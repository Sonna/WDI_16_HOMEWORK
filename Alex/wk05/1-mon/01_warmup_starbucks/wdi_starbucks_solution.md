---
source:
- title: WDI Starbucks Solution
  url: https://gist.github.com/kasun-maldeni/bdfa0ad5ed07da12257d57b92c4a3cb5
---

```ruby
# starbucks_core.rb
class Coffee
  def initialize(name, type, size, sugars)
    @name = name
    @type = type
    @size = size
    @sugars = sugars
  end

  def to_s
    "#{@name}'s #{@type}, #{@size}, #{@sugars} sugars"
  end
end

c1 = Coffee.new('Darryl', 'latte', 'medium', 2)
puts c1
```

```ruby
# starbucks_extension.rb
class Coffee
  attr_accessor :collected # allows you to set collected for a coffee

  def initialize(name, type, size, sugars)
    @name = misspell(name)
    @type = type
    @size = size
    @sugars = sugars
    @ordered_at = Time.now
    @wait_time = (120..300).to_a.sample # random 2 - 5 mins wait time
    @collected = false
  end

  def to_s
    "#{@name}'s #{@type}, #{@size}, #{@sugars} sugars"
  end

  def ready?
    if Time.now > @ordered_at + @wait_time
      puts "#{@type} for #{@name}!!!".upcase
    else
      puts "not ready yet #{@name}"
    end
  end

  private
  def misspell(name)
    consonants = ('a'..'z').to_a - %w(a e i o u)
    name[0] = consonants.sample
    return name
  end
end

coffees = []
coffees.push Coffee.new('Darryl', 'latte', 'medium', 2)
coffees.push Coffee.new('Samantha', 'mocha', 'large', 3)
coffees.push Coffee.new('Louis', 'cappuccino', 'small', 0)

puts coffees.first.ready?

coffees.first.collected = true
puts "Here are the coffees not yet collected:"
coffees.each do |coffee|
  unless coffee.collected
    puts coffee.to_s
  end
end
```
