class MovieRepository < BaseRepository
  ATTRIBUTES = %w(
    title year rated released runtime genre director writer actors plot language
    poster imdbrating imdbvotes production
  ).freeze

  def initialize(table: "movies", adapter: PSQL, attributes: ATTRIBUTES)
    super(table: table, adapter: adapter, attributes: attributes)
  end

  def find_by_title(title)
    adapter.exec_prepared("find_#{table_name}", find_by_title_sql, title).first
  end

  protected

  def find_by_title_sql
    "SELECT * FROM #{table_name} WHERE title ILIKE ($1);"
  end
end
