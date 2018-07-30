$LOAD_PATH.push File.expand_path('../', __FILE__)

require "dotenv"

ROOT = File.expand_path('../', __FILE__)
Dotenv.load File.join(ROOT, ".env")

require "lib/repositories/base_repository"
require "lib/repositories/movie_repository"
require "lib/repositories/relation"
require "lib/psql"

repo = MovieRepository.new
repo
# => #<MovieRepository:0x00007fd959870d90
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
# => #<MovieRepository::MovieEntity:0x00007fd9590a1538
#     @attributes=
#      {:id=>"107",
#       :title=>"Hello World",
#       :year=>nil,
#       :rated=>nil,
#       :released=>nil,
#       :runtime=>nil,
#       :genre=>nil,
#       :director=>nil,
#       :writer=>nil,
#       :actors=>nil,
#       :plot=>nil,
#       :language=>nil,
#       :poster=>nil,
#       :imdbrating=>nil,
#       :imdbvotes=>nil,
#       :production=>nil}>

movie.attributes # => {:id=>"107", :title=>"Hello World", :year=>nil, :rated=>nil, :released=>nil, :runtime=>nil, :genre=>nil, :director=>nil, :writer=>nil, :actors=>nil, :plot=>nil, :language=>nil, :poster=>nil, :imdbrating=>nil, :imdbvotes=>nil, :production=>nil}
movie.to_h # => {:id=>"107", :title=>"Hello World", :year=>nil, :rated=>nil, :released=>nil, :runtime=>nil, :genre=>nil, :director=>nil, :writer=>nil, :actors=>nil, :plot=>nil, :language=>nil, :poster=>nil, :imdbrating=>nil, :imdbvotes=>nil, :production=>nil}
movie.to_hash # => {:id=>"107", :title=>"Hello World", :year=>nil, :rated=>nil, :released=>nil, :runtime=>nil, :genre=>nil, :director=>nil, :writer=>nil, :actors=>nil, :plot=>nil, :language=>nil, :poster=>nil, :imdbrating=>nil, :imdbvotes=>nil, :production=>nil}
movie == movie # => true

repo.all.take(5)
# => [#<MovieRepository::MovieEntity:0x00007fd959889318
#      @attributes=
#       {:id=>"2",
#        :title=>"Sharknado",
#        :year=>"2013",
#        :rated=>"TV-14",
#        :released=>"11 Jul 2013",
#        :runtime=>"86 min",
#        :genre=>"Action, Adventure, Comedy",
#        :director=>"Anthony C. Ferrante",
#        :writer=>"Thunder Levin",
#        :actors=>"Ian Ziering, Tara Reid, John Heard, Cassandra Scerbo",
#        :plot=>
#         "When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.",
#        :language=>"English",
#        :poster=>
#         "https://m.media-amazon.com/images/M/MV5BOTE2OTk4MTQzNV5BMl5BanBnXkFtZTcwODUxOTM3OQ@@._V1_SX300.jpg",
#        :imdbrating=>"3.3",
#        :imdbvotes=>"40,724",
#        :production=>"NCM Fathom"}>,
#     #<MovieRepository::MovieEntity:0x00007fd959889020
#      @attributes=
#       {:id=>"3",
#        :title=>"Blade Runner",
#        :year=>"1982",
#        :rated=>"R",
#        :released=>"25 Jun 1982",
#        :runtime=>"117 min",
#        :genre=>"Sci-Fi, Thriller",
#        :director=>"Ridley Scott",
#        :writer=>
#         "Hampton Fancher (screenplay), David Webb Peoples (screenplay), Philip K. Dick (novel)",
#        :actors=>
#         "Harrison Ford, Rutger Hauer, Sean Young, Edward James Olmos",
#        :plot=>
#         "A blade runner must pursue and terminate four replicants who stole a ship in space and have returned to Earth to find their creator.",
#        :language=>"English, German, Cantonese, Japanese, Hungarian, Arabic",
#        :poster=>
#         "https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
#        :imdbrating=>"8.2",
#        :imdbvotes=>"589,433",
#        :production=>"Warner Bros. Pictures"}>,
#     #<MovieRepository::MovieEntity:0x00007fd959888d28
#      @attributes=
#       {:id=>"4",
#        :title=>"The Godfather",
#        :year=>"1972",
#        :rated=>"R",
#        :released=>"24 Mar 1972",
#        :runtime=>"175 min",
#        :genre=>"Crime, Drama",
#        :director=>"Francis Ford Coppola",
#        :writer=>
#         "Mario Puzo (screenplay by), Francis Ford Coppola (screenplay by), Mario Puzo (based on the novel by)",
#        :actors=>
#         "Marlon Brando, Al Pacino, James Caan, Richard S. Castellano",
#        :plot=>
#         "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
#        :language=>"English, Italian, Latin",
#        :poster=>
#         "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg",
#        :imdbrating=>"9.2",
#        :imdbvotes=>"1,344,736",
#        :production=>"Paramount Pictures"}>,
#     #<MovieRepository::MovieEntity:0x00007fd959888a30
#      @attributes=
#       {:id=>"5",
#        :title=>"Once",
#        :year=>"2007",
#        :rated=>"R",
#        :released=>"15 Jun 2007",
#        :runtime=>"86 min",
#        :genre=>"Drama, Music, Romance",
#        :director=>"John Carney",
#        :writer=>"John Carney",
#        :actors=>"Glen Hansard, Markéta Irglová, Hugh Walsh, Gerard Hendrick",
#        :plot=>
#         "A modern-day musical about a busker and an immigrant and their eventful week in Dublin, as they write, rehearse and record songs that tell their love story.",
#        :language=>"English, Czech",
#        :poster=>
#         "https://ia.media-imdb.com/images/M/MV5BYWUxZjJkMDktZmMxMS00Mzg3LTk4MDItN2IwODlmN2E0MTM0XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
#        :imdbrating=>"7.9",
#        :imdbvotes=>"101,549",
#        :production=>"Fox Searchlight"}>,
#     #<MovieRepository::MovieEntity:0x00007fd959888738
#      @attributes=
#       {:id=>"6",
#        :title=>"Once Upon a Time in America",
#        :year=>"1984",
#        :rated=>"R",
#        :released=>"01 Jun 1984",
#        :runtime=>"229 min",
#        :genre=>"Crime, Drama",
#        :director=>"Sergio Leone",
#        :writer=>
#         "Harry Grey (novel), Leonardo Benvenuti (screenplay), Piero De Bernardi (screenplay), Enrico Medioli (screenplay), Franco Arcalli (screenplay), Franco Ferrini (screenplay), Sergio Leone (screenplay), Stuart Kaminsky (additional dialogue)",
#        :actors=>
#         "Robert De Niro, James Woods, Elizabeth McGovern, Treat Williams",
#        :plot=>
#         "A former Prohibition-era Jewish gangster returns to the Lower East Side of Manhattan over thirty years later, where he once again must confront the ghosts and regrets of his old life.",
#        :language=>"English, Italian, French",
#        :poster=>
#         "https://ia.media-imdb.com/images/M/MV5BMGFkNWI4MTMtNGQ0OC00MWVmLTk3MTktOGYxN2Y2YWVkZWE2XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
#        :imdbrating=>"8.4",
#        :imdbvotes=>"258,711",
#        :production=>"Warner Home Video"}>]
repo.first # => #<MovieRepository::MovieEntity:0x00007fd95906f880 @attributes={:id=>"1", :title=>"Jaws: The Revenge", :year=>"1987", :rated=>"PG-13", :released=>"17 Jul 1987", :runtime=>"89 min", :genre=>"Adventure, Horror, Thriller", :director=>"Joseph Sargent", :writer=>"Peter Benchley (characters), Michael De Guzman", :actors=>"Lorraine Gary, Lance Guest, Mario Van Peebles, Karen Young", :plot=>"Chief Brody's widow believes that her family is deliberately being targeted by another shark in search of revenge.", :language=>"English", :poster=>"https://m.media-amazon.com/images/M/MV5BNGI1MTAxMWItOTE0OC00ZDhkLWE3Y2EtNjFiZmQ4NjQ1NGNkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg", :imdbrating=>"2.9", :imdbvotes=>"34,724", :production=>"Universal Pictures"}>
repo.last # => #<MovieRepository::MovieEntity:0x00007fd95906ddf0 @attributes={:id=>"107", :title=>"Hello World", :year=>nil, :rated=>nil, :released=>nil, :runtime=>nil, :genre=>nil, :director=>nil, :writer=>nil, :actors=>nil, :plot=>nil, :language=>nil, :poster=>nil, :imdbrating=>nil, :imdbvotes=>nil, :production=>nil}>

# repo.delete(movie["id"])
repo.delete(movie.id)
# => #<PG::Result:0x00007fd95906c2e8 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=1>
# repo.delete(repo.last["id"]).cmd_status
# =/> "DELETE 1"
# repo.delete(repo.last["id"]).cmd_tuples
# =/> 1

repo.first
# => #<MovieRepository::MovieEntity:0x00007fd9590663e8
#     @attributes=
#      {:id=>"1",
#       :title=>"Jaws: The Revenge",
#       :year=>"1987",
#       :rated=>"PG-13",
#       :released=>"17 Jul 1987",
#       :runtime=>"89 min",
#       :genre=>"Adventure, Horror, Thriller",
#       :director=>"Joseph Sargent",
#       :writer=>"Peter Benchley (characters), Michael De Guzman",
#       :actors=>"Lorraine Gary, Lance Guest, Mario Van Peebles, Karen Young",
#       :plot=>
#        "Chief Brody's widow believes that her family is deliberately being targeted by another shark in search of revenge.",
#       :language=>"English",
#       :poster=>
#        "https://m.media-amazon.com/images/M/MV5BNGI1MTAxMWItOTE0OC00ZDhkLWE3Y2EtNjFiZmQ4NjQ1NGNkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg",
#       :imdbrating=>"2.9",
#       :imdbvotes=>"34,724",
#       :production=>"Universal Pictures"}>

repo.find(2)
# => #<MovieRepository::MovieEntity:0x00007fd95895f180
#     @attributes=
#      {:id=>"2",
#       :title=>"Sharknado",
#       :year=>"2013",
#       :rated=>"TV-14",
#       :released=>"11 Jul 2013",
#       :runtime=>"86 min",
#       :genre=>"Action, Adventure, Comedy",
#       :director=>"Anthony C. Ferrante",
#       :writer=>"Thunder Levin",
#       :actors=>"Ian Ziering, Tara Reid, John Heard, Cassandra Scerbo",
#       :plot=>
#        "When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.",
#       :language=>"English",
#       :poster=>
#        "https://m.media-amazon.com/images/M/MV5BOTE2OTk4MTQzNV5BMl5BanBnXkFtZTcwODUxOTM3OQ@@._V1_SX300.jpg",
#       :imdbrating=>"3.3",
#       :imdbvotes=>"40,724",
#       :production=>"NCM Fathom"}>

repo.update(1, imdbrating: "5.4") # => #<PG::Result:0x00007fd959057708 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=1>
repo.find(1)["imdbrating"] # => "5.4"
repo.find(1)[:imdbrating] # => "5.4"
repo.find(1).imdbrating # => "5.4"
repo.update(1, imdbrating: "2.9") # => #<PG::Result:0x00007fd958968208 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=1>
repo.find(1)["imdbrating"] # => "2.9"
repo.find(1)[:imdbrating] # => "2.9"
repo.find(1).imdbrating # => "2.9"
