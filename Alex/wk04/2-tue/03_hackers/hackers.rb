=begin
given a list of names
Joe Black
Mary Jane
Bob Hawke

hackers
  |
  |--joe_black
  |     |-README.md
  |
  |--mary_jane
  |     |-README.md
  |
  |--bob_hawke
        |-README.md

=end

require "fileutils"

hackers = [
  "Joe Black",
  "Mary Jane",
  "Bob Hawke"
]

# that do end thing?? - ruby blocks
hackers.each do |hacker|
  # secret = 42 # scoped local to the block
  dir_name = hacker.downcase.gsub(" ", "")
  FileUtils.mkdir(dir_name)

  # FileUtils.cd(dir_name)
  # FileUtils.touch("README.md")
  # FileUtils.cd("../")

  FileUtils.cd(dir_name) do
    FileUtils.touch("README.md")
  end

  # FileUtils.touch("#{dir_name}/README.md")
end

# loop for each hackers

# make a dir with the hackers name
# cd into dir
# touch a readme.md file
# cd ..

directories = hackers.map { |hacker| hacker.downcase.gsub(/[^a-z]/, '_')  }

FileUtils.mkdir(directories)

directories.each { |directory| FileUtils.touch("#{directory}/README.md") }
