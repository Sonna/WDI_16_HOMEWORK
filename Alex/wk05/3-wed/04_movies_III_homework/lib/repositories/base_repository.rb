class BaseRepository
  attr_reader :adapter, :attributes, :table_name

  def initialize(table:, adapter: PSQL, attributes: [])
    @table_name = table
    @adapter = adapter
    @attributes = attributes
  end

  protected

  def create_sql(attr = attributes)
    <<~SQL
      INSERT INTO #{ table_name } ( #{ attr.join(',') })
      VALUES ( #{ attr.map.with_index(1) { |_, i| "$#{i}" }.join(",") } );
    SQL
  end

  def find_sql(attribute = "id")
    "SELECT * FROM #{table_name} WHERE #{attribute} ILIKE ($1);"
  end
end