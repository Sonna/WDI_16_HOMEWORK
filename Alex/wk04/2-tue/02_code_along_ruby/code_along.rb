# require "pry"

days_of_the_week = %w[mon tue wed thur fri sat sun]

# binding.pry

# days_of_the_week.unshift(days_of_the_week.pop())
# = > ["sun", "mon", "tue", "wed", "thur", "fri", "sat"]

# weekdays_and_weekend = [days_of_the_week[0..4], days_of_the_week[5..7]]
weekdays_and_weekend = [days_of_the_week[0..4], days_of_the_week[5..-1]]
# => [["mon", "tue", "wed", "thur", "fri"], ["sat", "sun"]]

days_of_the_week.slice_after(/fri/).to_a
# => [["mon", "tue", "wed", "thur", "fri"], ["sat", "sun"]]
days_of_the_week.slice_before(/sat/).to_a
# => [["mon", "tue", "wed", "thur", "fri"], ["sat", "sun"]]
