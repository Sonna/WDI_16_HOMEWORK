class MovieRepository < BaseRepository
  ATTRIBUTES = %w(
    title year rated released runtime genre director writer actors plot language
    poster imdbrating imdbvotes production
  ).freeze

  def initialize(table: "movies", adapter: PSQL, attributes: ATTRIBUTES)
    super(table: table, adapter: adapter, attributes: attributes)
  end

  def create(attributes)
    adapter.exec_prepared("create_movie", create_sql, *attributes)
  end

  def find(title)
    adapter.exec_prepared("find_movie", find_sql("title"), title).first
  end
end
