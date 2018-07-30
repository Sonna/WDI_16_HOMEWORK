require "httparty"

module OMDBAPI
  def self.movie_find_by(query = {})
    request({"t" => query[:title]})
  end

  def self.movie_search_by(query = {})
    request({"s" => query[:title], "type" => "movie", "page" => query[:page]})
  end

  def self.request(query = {})
    HTTParty.get(
      ENV["API_URL"], query: query.merge("apikey" => ENV["API_KEY"])
    ).transform_keys { |key| key.downcase.to_sym }
  end
end
