$LOAD_PATH.push File.expand_path('../', __FILE__)

require "coffee"

c1 = Coffee.new('Darryl', 'latte', 'medium', 2)
puts c1
# c1.to_s # = > "Darryl's latte, medium, 2 sugars."
c1.to_s # => "Barrel's latte, medium, 2 sugars."
c1.to_s(Time.now + 300) # => "BARREL'S LATTE, MEDIUM, 2 SUGARS."

coffees = 5.times.map { |i| Coffee.new("#{i.times.inject('D') { |c| c.next }}arryl", 'latte', 'medium', 2) }
coffees.first.collected = true
coffees.last.collected = true
coffees.reject(&:collected).length # => 3
coffees.reject(&:collected)
# => [#<Coffee:0x00007fc9e097f868
#      @customer="Earryl",
#      @name="latte",
#      @options=[],
#      @ready_at=2018-07-16 10:29:47 +1000,
#      @size="medium",
#      @sugar=2>,
#     #<Coffee:0x00007fc9e097f3b8
#      @customer="Farryl",
#      @name="latte",
#      @options=[],
#      @ready_at=2018-07-16 10:30:47 +1000,
#      @size="medium",
#      @sugar=2>,
#     #<Coffee:0x00007fc9e097d8d8
#      @customer="Garryl",
#      @name="latte",
#      @options=[],
#      @ready_at=2018-07-16 10:29:47 +1000,
#      @size="medium",
#      @sugar=2>]

coffees.select(&:collected).length # => 2
coffees.select(&:collected)
# => [#<Coffee:0x00007fc9e097fc28
#      @collected=true,
#      @customer="Darryl",
#      @name="latte",
#      @options=[],
#      @ready_at=2018-07-16 10:31:47 +1000,
#      @size="medium",
#      @sugar=2>,
#     #<Coffee:0x00007fc9e097caa0
#      @collected=true,
#      @customer="Harryl",
#      @name="latte",
#      @options=[],
#      @ready_at=2018-07-16 10:31:47 +1000,
#      @size="medium",
#      @sugar=2>]

c2 = Coffee.new('Darryl', 'latte', 'medium', 2, "hot of hazelnut", "whipped cream", "chocolate syrup")
c2.to_s # => "Barrel's latte, medium, 2 sugars (with hot of hazelnut, whipped cream, chocolate syrup)."
c2.to_s(Time.now + 300) # => "BARREL'S LATTE, MEDIUM, 2 SUGARS (WITH HOT OF HAZELNUT, WHIPPED CREAM, CHOCOLATE SYRUP)."

# >> Barrel's latte, medium, 2 sugars.
