$LOAD_PATH.push File.expand_path('../', __FILE__)

require "dotenv"

ROOT = File.expand_path('../', __FILE__)
Dotenv.load File.join(ROOT, ".env")

require "lib/repositories/base_repository"
require "lib/repositories/movie_repository"
require "lib/psql"

repo = MovieRepository.new
repo
# => #<MovieRepository:0x00007fd19d1893d8
#     @adapter=PSQL,
#     @attributes=
#      ["title",
#       "year",
#       "rated",
#       "released",
#       "runtime",
#       "genre",
#       "director",
#       "writer",
#       "actors",
#       "plot",
#       "language",
#       "poster",
#       "imdbrating",
#       "imdbvotes",
#       "production"],
#     @table_name="movies">

movie = repo.create(title: "Hello World")
# => {"id"=>"101",
#     "title"=>"Hello World",
#     "year"=>nil,
#     "rated"=>nil,
#     "released"=>nil,
#     "runtime"=>nil,
#     "genre"=>nil,
#     "director"=>nil,
#     "writer"=>nil,
#     "actors"=>nil,
#     "plot"=>nil,
#     "language"=>nil,
#     "poster"=>nil,
#     "imdbrating"=>nil,
#     "imdbvotes"=>nil,
#     "production"=>nil}

# repo.all # =/>
repo.first # => {"id"=>"1", "title"=>"Jaws: The Revenge", "year"=>"1987", "rated"=>"PG-13", "released"=>"17 Jul 1987", "runtime"=>"89 min", "genre"=>"Adventure, Horror, Thriller", "director"=>"Joseph Sargent", "writer"=>"Peter Benchley (characters), Michael De Guzman", "actors"=>"Lorraine Gary, Lance Guest, Mario Van Peebles, Karen Young", "plot"=>"Chief Brody's widow believes that her family is deliberately being targeted by another shark in search of revenge.", "language"=>"English", "poster"=>"https://m.media-amazon.com/images/M/MV5BNGI1MTAxMWItOTE0OC00ZDhkLWE3Y2EtNjFiZmQ4NjQ1NGNkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg", "imdbrating"=>"2.9", "imdbvotes"=>"34,724", "production"=>"Universal Pictures"}
repo.last # => {"id"=>"101", "title"=>"Hello World", "year"=>nil, "rated"=>nil, "released"=>nil, "runtime"=>nil, "genre"=>nil, "director"=>nil, "writer"=>nil, "actors"=>nil, "plot"=>nil, "language"=>nil, "poster"=>nil, "imdbrating"=>nil, "imdbvotes"=>nil, "production"=>nil}

repo.delete(movie["id"])
# => #<PG::Result:0x00007fb87a9f25d8 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=1>
# repo.delete(repo.last["id"]).cmd_status
# =/> "DELETE 1"
# repo.delete(repo.last["id"]).cmd_tuples
# =/> 1

repo.first
# => {"id"=>"1",
#     "title"=>"Jaws: The Revenge",
#     "year"=>"1987",
#     "rated"=>"PG-13",
#     "released"=>"17 Jul 1987",
#     "runtime"=>"89 min",
#     "genre"=>"Adventure, Horror, Thriller",
#     "director"=>"Joseph Sargent",
#     "writer"=>"Peter Benchley (characters), Michael De Guzman",
#     "actors"=>"Lorraine Gary, Lance Guest, Mario Van Peebles, Karen Young",
#     "plot"=>
#      "Chief Brody's widow believes that her family is deliberately being targeted by another shark in search of revenge.",
#     "language"=>"English",
#     "poster"=>
#      "https://m.media-amazon.com/images/M/MV5BNGI1MTAxMWItOTE0OC00ZDhkLWE3Y2EtNjFiZmQ4NjQ1NGNkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
#     "imdbrating"=>"2.9",
#     "imdbvotes"=>"34,724",
#     "production"=>"Universal Pictures"}

repo.find(2)
# => {"id"=>"2",
#     "title"=>"Sharknado",
#     "year"=>"2013",
#     "rated"=>"TV-14",
#     "released"=>"11 Jul 2013",
#     "runtime"=>"86 min",
#     "genre"=>"Action, Adventure, Comedy",
#     "director"=>"Anthony C. Ferrante",
#     "writer"=>"Thunder Levin",
#     "actors"=>"Ian Ziering, Tara Reid, John Heard, Cassandra Scerbo",
#     "plot"=>
#      "When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.",
#     "language"=>"English",
#     "poster"=>
#      "https://m.media-amazon.com/images/M/MV5BOTE2OTk4MTQzNV5BMl5BanBnXkFtZTcwODUxOTM3OQ@@._V1_SX300.jpg",
#     "imdbrating"=>"3.3",
#     "imdbvotes"=>"40,724",
#     "production"=>"NCM Fathom"}

repo.update(1, imdbrating: "5.4") # => #<PG::Result:0x00007fd1a0005cc0 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=1>
repo.find(1)["imdbrating"] # => "5.4"
repo.update(1, imdbrating: "2.9") # => #<PG::Result:0x00007fd19d883670 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=1>
repo.find(1)["imdbrating"] # => "2.9"
