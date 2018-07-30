require "lib/entities/entity"
require "lib/repositories/adapters/psql"

# A Proxy object that will not be `exec` until an Enumerable method is called;
# like `each`, `first`, `last`, `to_a`, etc
class Relation
  include Enumerable

  # attr_reader
  attr_accessor :adapter, :entity_klass, :table, :values

  def initialize(table:, adapter: PSQL, entity_klass: Entity, values: {})
    @table = table
    @adapter = adapter
    @entity_klass = entity_klass
    @values = {
      columns: ["*"], wheres: [], orders: nil, limit_n: nil
    }.merge(values)
  end

  def each
    return enum_for(__callee__) { count } unless block_given?
    rows.each { |row| yield entity_klass.new(row) }
  end
  alias all to_a

  def inspect
    # subject = loaded? ? records : self
    # entries = subject.take([limit_value, 11].compact.min).map!(&:inspect)
    entries = each.take([values[:limit_n], 11].compact.min).map!(&:inspect)

    entries[10] = "..." if entries.size == 11

    "#<#{self.class.name}:#{object_id} [#{entries.join(', ')}]>"
  end

  def copy
    self.class.new(table: table, adapter: adapter, entity_klass: entity_klass,
                   values: values)
  end

  def first
    entity_klass.new(copy.order(:id, :asc).limit(1).rows.first)
  end

  def last
    entity_klass.new(copy.order(:id, :desc).limit(1).rows.first)
  end

  def select(*columns)
    copy.tap { |r| r.values[:columns] = columns }
  end

  def pluck(column)
    copy.tap do |relation|
      relation.values[:columns] = [column]
    end.rows.map { |row| row[column.to_s] }
  end

  def where(cond)
    copy.tap do |relation|
      relation.values[:wheres] = values[:wheres] +
        case cond
        when Hash then cond.map { |k, v| "#{k} = '#{v}'" }
        else [cond]
        end
    end
  end

  def limit(n = 0)
    copy.tap { |r| r.values = r.values.merge(limit_n: n) }
  end

  def order(*args)
    copy.tap { |r| r.values[:orders] = *args }
  end

  def to_sql
    [select_sql, from_sql, where_sql, order_sql, limit_sql].compact.join(" ").strip + ";"
  end

  def count
    return values[:limit_n] if values[:limit_n]&.positive?
    temp, values[:columns] = values[:columns], ["COUNT(id)"]
    # @count[[wheres, limit, order]] ||= adapter.exec(to_sql).first["count"].to_i
    @count = adapter.exec(to_sql).first["count"].to_i
    values[:columns] = temp
    @count
  end

  protected

  def rows
    @rows = adapter.exec(to_sql).to_a
  end

  def select_sql
    "SELECT #{values[:columns].join(', ')}"
  end

  def from_sql
    "FROM #{table}"
  end

  def where_sql
    "WHERE #{values[:wheres].join(' AND ')}" if values[:wheres].any?
  end

  def order_sql
    case values[:orders]
    when Array then
      *orders, tail = values[:orders]
      "ORDER BY #{orders.join(', ')} #{tail}"
    when Hash then
      *orders, tail = values[:orders]
      # "ORDER BY #{orders.join(', ')}#{orders.size >= 2 ? ',' : ''} #{tail.to_a.join(' ')}"
      "ORDER BY #{orders.join(', ')} #{tail.to_a.join(' ')}"
    when String then "ORDER BY #{values[:orders]}"
    else ""
    end
  end

  def limit_sql
    "LIMIT #{values[:limit_n]}" if values[:limit_n]&.positive?
  end
end
