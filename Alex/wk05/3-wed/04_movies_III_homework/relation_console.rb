$LOAD_PATH.push File.expand_path('../', __FILE__)

require "dotenv"

ROOT = File.expand_path('../', __FILE__)
Dotenv.load File.join(ROOT, ".env")

require "lib/repositories/relation"

relation = Relation.new(table: "movies")

relation.count # => 103

relation.where(title: "Sharknado").count # => 1
relation.where(title: "Sharknado")
# => <Relation:70356459069360 [[{"id"=>"2", "title"=>"Sharknado", "year"=>"2013", "rated"=>"TV-14", "released"=>"11 Jul 2013", "runtime"=>"86 min", "genre"=>"Action, Adventure, Comedy", "director"=>"Anthony C. Ferrante", "writer"=>"Thunder Levin", "actors"=>"Ian Ziering, Tara Reid, John Heard, Cassandra Scerbo", "plot"=>"When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.", "language"=>"English", "poster"=>"https://m.media-amazon.com/images/M/MV5BOTE2OTk4MTQzNV5BMl5BanBnXkFtZTcwODUxOTM3OQ@@._V1_SX300.jpg", "imdbrating"=>"3.3", "imdbvotes"=>"40,724", "production"=>"NCM Fathom"}]]>

relation.where(year: "2013").count # => 4
relation.where(year: "2013")
# => <Relation:70356459061920 [[{"id"=>"2", "title"=>"Sharknado", "year"=>"2013", "rated"=>"TV-14", "released"=>"11 Jul 2013", "runtime"=>"86 min", "genre"=>"Action, Adventure, Comedy", "director"=>"Anthony C. Ferrante", "writer"=>"Thunder Levin", "actors"=>"Ian Ziering, Tara Reid, John Heard, Cassandra Scerbo", "plot"=>"When a freak hurricane swamps Los Angeles, nature's deadliest killer rules sea, land, and air as thousands of sharks terrorize the waterlogged populace.", "language"=>"English", "poster"=>"https://m.media-amazon.com/images/M/MV5BOTE2OTk4MTQzNV5BMl5BanBnXkFtZTcwODUxOTM3OQ@@._V1_SX300.jpg", "imdbrating"=>"3.3", "imdbvotes"=>"40,724", "production"=>"NCM Fathom"}, {"id"=>"80", "title"=>"Fukushima: The Never Ending Story", "year"=>"2013", "rated"=>"N/A", "released"=>"13 Jan 2013", "runtime"=>"N/A", "genre"=>"N/A", "director"=>"N/A", "writer"=>"N/A", "actors"=>"N/A", "plot"=>"N/A", "language"=>"English", "poster"=>"N/A", "imdbrating"=>"N/A", "imdbvotes"=>"N/A", "production"=>"N/A"}, {"id"=>"113", "title"=>"Only God Forgives", "year"=>"2013", "rated"=>"R", "released"=>"22 May 2013", "runtime"=>"90 min", "genre"=>"Crime, Drama", "director"=>"Nicolas Winding Refn", "writer"=>"Nicolas Winding Refn", "actors"=>"Ryan Gosling, Kristin Scott Thomas, Vithaya Pansringarm, Gordon Brown", "plot"=>"Julian, a drug-smuggler thriving in Bangkok's criminal underworld, sees his life get even more complicated when his mother compels him to find and kill whoever is responsible for his brother's recent death.", "language"=>"English, Thai", "poster"=>"https://m.media-amazon.com/images/M/MV5BMzE5NzcxMTk5NF5BMl5BanBnXkFtZTcwNjE2MDg2OQ@@._V1_SX300.jpg", "imdbrating"=>"5.7", "imdbvotes"=>"95,916", "production"=>"Radius-TWC"}, {"id"=>"102", "title"=>"A Certain Magical Index: The Miracle of Endymion", "year"=>"2013", "rated"=>"N/A", "released"=>"23 Feb 2013", "runtime"=>"90 min", "genre"=>"Animation, Fantasy, Sci-Fi", "director"=>"Hiroshi Nishikiori", "writer"=>"Kazuma Kamachi (creator), Hiroyuki Yoshino (screenplay)", "actors"=>"Atsushi Abe, Sachika Misawa, Yôko Hikasa, Yuka Iguchi", "plot"=>"On the day Touma Kamijou and Index see Academy City's space elevator, Endymion in the distance, they meet a Level 0 girl with an amazing singing voice, Arisa Meigo. As the three enjoy their...", "language"=>"Japanese", "poster"=>"https://images-na.ssl-images-amazon.com/images/M/MV5BOWU0YTY1YjctODhjNi00YjRkLWJlYzEtODlmYTcwNjI5NmJiXkEyXkFqcGdeQXVyMjYxMzY2NDk@._V1_SX300.jpg", "imdbrating"=>"6.6", "imdbvotes"=>"179", "production"=>"N/A"}]]>

relation.where(title: "Sharknado", year: "2013").to_a
# => [#<Entity:0x00007ffa47147d20
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
#        :production=>"NCM Fathom"}>]

relation.where(title: "Sharknado").where(year: "2013").to_a
# => [#<Entity:0x00007ffa47150c90
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
#        :production=>"NCM Fathom"}>]

relation.where(title: "Sharknado", year: "2013").to_a == relation.where(title: "Sharknado").where(year: "2013").to_a
# => true

relation.limit(5).order(:year, :asc).to_a
# => [#<Entity:0x00007ffa4714a570
#      @attributes=
#       {:id=>"11",
#        :title=>"Jaws of Justice",
#        :year=>"1933",
#        :rated=>"PASSED",
#        :released=>"04 Dec 1933",
#        :runtime=>"58 min",
#        :genre=>"Western",
#        :director=>"Spencer Gordon Bennet",
#        :writer=>
#         "Joseph Anthony Roach (by), Joseph Anthony Roach (screen adaptation)",
#        :actors=>"Jack Perrin, Robert Walker, Ruth Sullivan, Lafe McKee",
#        :plot=>
#         "Seeker Dean has found the gold he has been looking for for 15 years. Heading for the Government office, Boone Jackson kills him. Kickabout finds a cryptogram as to the gold's location and ...",
#        :language=>"English",
#        :poster=>
#         "https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4MzE3NzM4MV5BMl5BanBnXkFtZTcwNjg4OTUwNA@@._V1_SX300.jpg",
#        :imdbrating=>"4.0",
#        :imdbvotes=>"24",
#        :production=>"Sol Lesser Productions"}>,
#     #<Entity:0x00007ffa4714a520
#      @attributes=
#       {:id=>"18",
#        :title=>"Blade of the Ripper",
#        :year=>"1971",
#        :rated=>"R",
#        :released=>"13 Aug 1971",
#        :runtime=>"81 min",
#        :genre=>"Crime, Horror, Mystery",
#        :director=>"Sergio Martino",
#        :writer=>
#         "Vittorio Caronia (screenplay), Ernesto Gastaldi (screenplay), Eduardo Manzanos (screenplay), Eduardo Manzanos (story)",
#        :actors=>"George Hilton, Edwige Fenech, Conchita Airoldi, Manuel Gil",
#        :plot=>
#         "An ambassador's wife discovers that one of the men in her life - either her husband, an ex-lover or her current lover - may be a vicious serial killer.",
#        :language=>"Italian, Spanish",
#        :poster=>
#         "https://images-na.ssl-images-amazon.com/images/M/MV5BMzI3MTcyMDYtM2Y1Ni00YmVkLTllNDktZTFmMWQ1MzY2MDhhXkEyXkFqcGdeQXVyMTAxMDQ0ODk@._V1_SX300.jpg",
#        :imdbrating=>"7.0",
#        :imdbvotes=>"2,730",
#        :production=>"Gemini-Maron"}>,
#     #<Entity:0x00007ffa4714a4d0
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
#     #<Entity:0x00007ffa4714a480
#      @attributes=
#       {:id=>"14",
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
#     #<Entity:0x00007ffa4714a430
#      @attributes=
#       {:id=>"16",
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
#        :production=>"Paramount Pictures"}>]
