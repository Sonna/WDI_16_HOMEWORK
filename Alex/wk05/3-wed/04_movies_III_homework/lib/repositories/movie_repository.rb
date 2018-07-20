class MovieRepository
  ATTRIBUTES = %w(
    title year rated released runtime genre director writer actors plot language
    poster imdbrating imdbvotes production
  ).freeze

  attr_reader :adapter

  class << self
    def create_sql(table = "movies", attributes = ATTRIBUTES)
      <<~SQL
        INSERT INTO #{ table } (
          #{ attributes.join(',') }
        ) VALUES (
          #{ attributes.map.with_index(1) { |_, i| "$#{i}" }.join(",") }
        );
      SQL
    end

    def find_sql(table = "movies", attribute = "title")
      "SELECT * FROM #{table} WHERE #{attribute} ILIKE ($1);"
    end
  end

  def initialize(adapter = PSQL)
    @adapter = adapter
    # adapter.prepare("find_movie", self.class.find_sql)
    # adapter.prepare("create_movie", self.class.create_sql)
  end

  def attributes
    ATTRIBUTES
  end

  def create(attributes)
    adapter.exec_prepared("create_movie", self.class.create_sql, *attributes)
  end

  def find(title)
    adapter.exec_prepared("find_movie", self.class.find_sql, title).first
  end
end
