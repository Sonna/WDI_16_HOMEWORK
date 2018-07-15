# ---
# source:
# - title: WDI Starbucks Warmup
#   url: https://gist.github.com/kasun-maldeni/b38a4bcdb17078f48b5179ff9fc85d21
# ---

# # Starbucks

# Write a program that holds on to coffee orders.

class Coffee
  attr_reader :customer, :name, :size, :sugar

  def initialize(customer, name, size, sugar) # !> previous definition of initialize was here
    @customer = customer
    @name = name
    @size = size
    @sugar = sugar
  end

  def to_s # !> previous definition of to_s was here
    "#{customer}'s #{name}, #{size}, #{sugar} sugars."
  end
end

# ```ruby
c1 = Coffee.new('Darryl', 'latte', 'medium', 2)
# ```

# Write the `.to_s` method for this class so when you `puts c1` you will have
# "Darryl's latte, medium, 2 sugars."
c1.to_s # => "Darryl's latte, medium, 2 sugars."

# ### Extension

# 1. Starbucks always gets names wrong, however. Make the name a bad misspelling
#    of the actual name when you create the order.

class Coffee
  def to_s # !> previous definition of to_s was here
    misspelling = customer.tr("Dy", "Be")
    "#{misspelling}'s #{name}, #{size}, #{sugar} sugars."
  end
end

# ```ruby
puts c1
# = > "Barrel's latte, medium, 2 sugars."
c1.to_s # => "Barrel's latte, medium, 2 sugars."
# ```

# 2. When you make an order, there should be a waiting time of anywhere between
#    2-5 minutes. You should be able to check if it's ready by calling
#    `c1.ready?` and have the program yell out the order and the misspelled name
#    if its ready.
class Coffee
  attr_reader :ready_at

  def initialize(customer, name, size, sugar) # !> previous definition of initialize was here
    @customer = customer
    @name = name
    @size = size
    @sugar = sugar

    wait_time = 60 * rand(2..5) # 60 seconds * 2-5 minutes
    @ready_at = Time.now + wait_time
  end

  def ready?(time = Time.now)
    (ready_at - time).negative?
  end

  def to_s # !> previous definition of to_s was here
    misspelling = customer.tr("Dy", "Be")
    # if ready?(Time.now + 300)
    if ready?
      "#{misspelling}'s #{name}, #{size}, #{sugar} sugars.".upcase
    else
      "#{misspelling}'s #{name}, #{size}, #{sugar} sugars."
    end
  end
end

c1 = Coffee.new('Darryl', 'latte', 'medium', 2)
c1.to_s # => "Barrel's latte, medium, 2 sugars."

# 3. You should be able to mark the coffee as collected with
#    `c1.collected = true`
class Coffee
  attr_accessor :collected
  # attr_writer :collected
end

# 4. List all of the coffees not collected.
coffees = 5.times.map { |i| Coffee.new("#{i.times.inject('D') { |c| c.next }}arryl", 'latte', 'medium', 2) }
coffees.first.collected = true
coffees.last.collected = true
coffees.reject(&:collected).length # => 3
coffees.reject(&:collected)
# => [#<Coffee:0x00007fd0030c8390
#      @customer="Earryl",
#      @name="latte",
#      @ready_at=2018-07-16 09:45:19 +1000,
#      @size="medium",
#      @sugar=2>,
#     #<Coffee:0x00007fd0030c3908
#      @customer="Farryl",
#      @name="latte", # !> method redefined; discarding old initialize
#      @ready_at=2018-07-16 09:46:19 +1000,
#      @size="medium",
#      @sugar=2>,
#     #<Coffee:0x00007fd0030c2788
#      @customer="Garryl",
#      @name="latte",
#      @ready_at=2018-07-16 09:46:19 +1000,
#      @size="medium",
#      @sugar=2>]

coffees.select(&:collected).length # => 2 # !> method redefined; discarding old to_s
coffees.select(&:collected)
# => [#<Coffee:0x00007fd0030c8980
#      @collected=true,
#      @customer="Darryl",
#      @name="latte",
#      @ready_at=2018-07-16 09:45:19 +1000,
#      @size="medium",
#      @sugar=2>,
#     #<Coffee:0x00007fd0030c07f8
#      @collected=true,
#      @customer="Harryl",
#      @name="latte",
#      @ready_at=2018-07-16 09:45:19 +1000,
#      @size="medium",
#      @sugar=2>]

# 5. Add options to the coffee order, eg shot of hazelnut, whipped cream,
#    chocolate syrup.

class Coffee
  attr_reader :options

  def initialize(customer, name, size, sugar, *options)
    @customer = customer
    @name = name
    @size = size
    @sugar = sugar
    @options = options

    wait_time = 60 * rand(2..5) # 60 seconds * 2-5 minutes
    @ready_at = Time.now + wait_time
  end

  def to_s
    misspelling = customer.tr("Dy", "Be")
    result = "#{misspelling}'s #{name}, #{size}, #{sugar} sugars."
    result = result[0..-1] + " (with #{options.join(' ')})." if options.any?
    # ready?(Time.now + 300) ? result.upcase : result
    ready? ? result.upcase : result
  end
end

c2 = Coffee.new('Darryl', 'latte', 'medium', 2, "hot of hazelnut", "whipped cream", "chocolate syrup")
c2.to_s # => "Barrel's latte, medium, 2 sugars. (with hot of hazelnut whipped cream chocolate syrup)."

# == References:
# - https://stackoverflow.com/questions/6936203/add-minutes-to-time-object

# >> Barrel's latte, medium, 2 sugars.
