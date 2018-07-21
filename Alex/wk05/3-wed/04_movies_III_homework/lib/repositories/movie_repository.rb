class MovieRepository < BaseRepository
  class MovieEntity < BaseEntity; end

  def initialize
    super(table: "movies")
  end

  def find_by_title(title)
    adapter.exec_prepared("find_#{table_name}", find_by_title_sql, title).first
  end

  protected

  def find_by_title_sql
    "SELECT * FROM #{table_name} WHERE title ILIKE ($1);"
  end

  def entity_klass
    MovieEntity
  end
end
