=begin
given a list of names
Joe Black
Mary Jane
Bob Hawke

hackers
  |
  |--joe_black
  |
  |--mary_jane
  |
  |--bob_hawke

=end

require "fileutils"

names = [
  "Joe Black",
  "Mary Jane",
  "Bob Hawke"
]

directories = names.map { |name| name.downcase.gsub(/[^a-z]/, '_')  }

FileUtils.mkdir(directories)

directories.each { |directory| FileUtils.touch("#{directory}/README.md") }
