require "lib/entities/entity"
require "lib/repositories/adapters/psql"

# A Proxy object that will not be `exec` until an Enumerable method is called;
# like `each`, `first`, `last`, `to_a`, etc
class Relation
  include Enumerable

  # attr_reader
  attr_accessor :adapter, :entity_klass, :columns, :limit_sql, :order_sql,
                :table, :wheres

  def initialize(table:, adapter: PSQL, entity_klass: Entity)
    # @query
    @columns = "*"
    @table = table
    @adapter = adapter
    @wheres = []
    @entity_klass = entity_klass
    # @count = {}
  end

  def each
    return enum_for(__callee__) { count } unless block_given?
    rows.each { |row| yield entity_klass.new(row) }
  end
  alias all to_a

  def inspect
    "<#{self.class.name}:#{object_id} [#{rows.inspect}]>"
  end

  # def dup
  #   self.class.new(table: table).tap do |relation|
  #     relation.wheres = wheres
  #     relation.limit_sql = limit_sql
  #     relation.order_sql = order_sql
  #   end
  # end

  def where(cond)
    relation = self.class.new(table: table)
    # relation.wheres = wheres
    relation.wheres << wheres +
      case cond
      when Hash then cond.map { |k, v| "#{k} = '#{v}'" }
      else cond
      end
    # self
    relation.limit_sql = limit_sql
    relation.order_sql = order_sql
    relation
  end

  def limit(n = 0)
    # @limit_sql = "LIMIT #{n}" if n.positive?
    # self
    relation = self.class.new(table: table)
    relation.wheres = wheres
    relation.limit_sql = "LIMIT #{n}" if n.positive?
    relation.order_sql = order_sql
    relation
  end

  def order(attribute = "id", direction = "ASC")
    # @order_sql = "ORDER BY #{attribute} #{direction}"
    # self
    relation = self.class.new(table: table)
    relation.wheres = wheres
    relation.limit_sql = limit_sql
    relation.order_sql = "ORDER BY #{attribute} #{direction}"
    relation
  end

  def to_sql
    <<~SQL.strip + ";"
      SELECT #{columns}
      FROM #{table}
      #{where_sql}
      #{order_sql}
      #{limit_sql}
    SQL
  end

  def count
    temp, @columns = columns, "COUNT(id)"
    # @count[[wheres, limit, order]] ||= adapter.exec(to_sql).first["count"].to_i
    @count = adapter.exec(to_sql).first["count"].to_i
    @columns = temp
    @count
  end

  protected

  def rows
    @rows = adapter.exec(to_sql).to_a
  end

  def where_sql
    "WHERE #{wheres.join(' AND ')}" if wheres.any?
  end
end
