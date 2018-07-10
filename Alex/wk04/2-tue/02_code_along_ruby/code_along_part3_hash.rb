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
'abc'.object_id # => 70245948315060
'abc'.object_id # => 70245948312940
42.object_id # => 85
42.object_id # => 85
42.object_id # => 85

:title # => :title
:title.class # => Symbol
'abc'.class # => String
5.class # => Integer
5.0.class # => Float
:title.to_s # => "title"

# axel - 4
# megan - 4
# inder - 3
# kate - 4
# micael - 3

db = {
  3 => ['inder', 'micael']
}

db # => {3=>["inder", "micael"]}
db[4] = ["axel"] # => ["axel"]
db # => {3=>["inder", "micael"], 4=>["axel"]}
db[4].push('megan') # => ["axel", "megan"]
db # => {3=>["inder", "micael"], 4=>["axel", "megan"]}
db[4] # => ["axel", "megan"]
db[3] # => ["inder", "micael"]
db[3].length # => 2

db = {
  2 => ['dt'],
  3 => ['inder', 'micael'],
  4 => ['megan', 'axel']
}

students = ['inder', 'micael', 'megan']
students.each do |student|
  # puts student
  student # => "inder", "micael", "megan"
end

# db is a collection

db.each do |thing|
  # puts thing
  # p thing
  thing # => [2, ["dt"]], [3, ["inder", "micael"]], [4, ["megan", "axel"]]
end

# db.each do |key, value|
#   puts "#{key} #{value.join(' ')}"
db.each do |score, student_names|
  puts "#{score} #{student_names.join(' ')}"
end
# db.each { |key, value| puts "#{key} #{value.join(' ')}" }

# >> 2 dt
# >> 3 inder micael
# >> 4 megan axel
