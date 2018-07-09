# ### 1. Create an array of the days of the week
# - Create a variable named `days_of_the_week` as an array of the following:
days_of_the_week = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
]

# ### 2. My calendar says the first day is Sunday...

# - Remove Sunday from the last postion and move it to the first position. Use
#  array methods.
days_of_the_week.rotate!(-1) # => ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

# ### 3. Create a new array of the days of the week:
days_of_the_week = [
  # - The first inner array should be the weekdays
  ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
  # - The second inner array should be the weekend days
  ["Saturday", "Sunday"]
]

# ### 4. Remove either the weekdays or the weekends
weekdays = days_of_the_week.shift # => ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
# Your choice...
weekends = days_of_the_week.pop # => ["Saturday", "Sunday"]

# ### 5. Sort the remaining days alphabetically
weekdays.sort # => ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
weekdays.sort { |a, b| a <=> b } # => ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
weekdays.sort { |b, a| a <=> b } # => ["Wednesday", "Tuesday", "Thursday", "Monday", "Friday"]
