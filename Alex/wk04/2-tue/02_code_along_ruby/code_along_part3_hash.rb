# require "pry"

# old syntax for hash
#  =>

movie = {
  :title => "sharknado",
  :year => 2000,
  :stars => ["shark"]
}

# new syntax inspired by json
movie = {
  title: "sharknado",
  year: 2000,
  stars: ["shark"]
}

movie[:title] # => "sharknado"

_movies = [
  {
    title: "sharknado",
    year: 2000,
    stars: ["shark"]
  },
  {
    title: 'rubber',
    year: 3000
  },
  {
    title: 'sharknado 6',
    year: 1000
  }
]

# binding.pry

'abc' # => "abc"
'abc'.object_id # => 70347723169680
'abc'.object_id # => 70347723168840
42.object_id # => 85
42.object_id # => 85
42.object_id # => 85

:title # => :title
:title.class # => Symbol
'abc'.class # => String
5.class # => Integer
5.0.class # => Float
:title.to_s # => "title"
