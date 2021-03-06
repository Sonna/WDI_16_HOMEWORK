require "lib/entities/entity"
require "lib/repositories/adapters/psql"

class BaseRepository
  attr_reader :adapter, :entity_klass, :table_name

  def initialize(table:, adapter: PSQL, entity_klass: Entity)
    @table_name = table
    @adapter = adapter
    @entity_klass = entity_klass
  end

  # Create a record for the given data (or entity)
  def create(data)
    adapter.exec_prepared("create_#{table_name}", create_sql(data.keys), *data.values)
    last
  end

  # Update the record corresponding to the given id by setting the given data
  # (or entity)
  def update(id, data)
    adapter.exec_prepared("update_#{table_name}", update_sql(id, data.keys), *data.values)
  end

  # Delete the record corresponding to the given id
  def delete(id)
    adapter.exec_prepared("delete_#{table_name}", delete_sql, id)
  end

  # Fetch all the entities from the relation
  def all
    adapter.exec(all_sql).map { |r| entity_klass.new(r) }
  end

  # Fetch an entity from the relation by primary key
  def find(id)
    record = adapter.exec_prepared("find_#{table_name}", find_sql, id).first
    entity_klass.new(record) if record
  end

  # Fetch the first entity from the relation
  def first
    entity_klass.new(adapter.exec(first_sql).first)
  end

  # Fetch the last entity from the relation
  def last
    entity_klass.new(adapter.exec(last_sql).first)
  end

  # Delete all the records from the relation
  def clear
    adapter.exec(clear_sql)
  end

  protected

  def create_sql(columns)
    <<~SQL
      INSERT INTO #{ table_name } ( #{ columns.join(", ") })
      VALUES ( #{ columns.map.with_index(1) { |_, i| "$#{i}" }.join(", ") } );
    SQL
  end

  def update_sql(id, columns)
    <<~SQL
      UPDATE #{ table_name }
      SET #{ columns.map.with_index(1) { |k, i| "#{k} = ($#{i})" }.join(", ") }
      WHERE id = (#{ id });
    SQL
  end

  def delete_sql
    "DELETE FROM #{table_name} WHERE id = ($1);"
  end

  def all_sql
    "SELECT * FROM #{table_name};"
  end

  def find_sql(condition = "id = ($1)")
    "SELECT * FROM #{table_name} WHERE #{condition};"
  end

  def first_sql
    "SELECT * FROM #{table_name} ORDER BY id ASC LIMIT 1;"
  end

  def last_sql
    "SELECT * FROM #{table_name} ORDER BY id DESC LIMIT 1;"
  end

  def clear_sql
    "DELETE FROM #{table_name};"
  end
end
