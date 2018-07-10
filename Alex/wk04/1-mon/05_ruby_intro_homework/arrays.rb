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
# days_of_the_week.rotate!(-1) # = > ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
days_of_the_week.rotate(-1) # => ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

# ### 3. Create a new array of the days of the week:
weekdays_and_weekend = [
  # - The first inner array should be the weekdays
  ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
  # - The second inner array should be the weekend days
  ["Saturday", "Sunday"]
]
weekdays_and_weekend = [days_of_the_week[0..4], days_of_the_week[5..-1]]
# => [["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
#     ["Saturday", "Sunday"]]

days_of_the_week.slice_after(/Friday/).to_a
# => [["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
#     ["Saturday", "Sunday"]]
days_of_the_week.slice_before(/Saturday/).to_a
# => [["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
#     ["Saturday", "Sunday"]]

days_of_the_week = days_of_the_week.slice_before(/Saturday/).to_a

# ### 4. Remove either the weekdays or the weekends
weekdays = days_of_the_week[0] # => ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
weekdays = days_of_the_week.first # => ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
weekdays = days_of_the_week.shift # => ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
# Your choice...
weekends = days_of_the_week[-1] # => ["Saturday", "Sunday"]
weekends = days_of_the_week.last # => ["Saturday", "Sunday"]
weekends = days_of_the_week.pop # => ["Saturday", "Sunday"]

# ### 5. Sort the remaining days alphabetically
weekdays.sort # => ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
weekdays.sort { |a, b| a <=> b } # => ["Friday", "Monday", "Thursday", "Tuesday", "Wednesday"]
weekdays.sort { |b, a| a <=> b } # => ["Wednesday", "Tuesday", "Thursday", "Monday", "Friday"]
