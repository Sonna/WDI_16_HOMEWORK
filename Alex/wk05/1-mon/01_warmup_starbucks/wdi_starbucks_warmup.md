---
source:
- title: WDI Starbucks Warmup
  url: https://gist.github.com/kasun-maldeni/b38a4bcdb17078f48b5179ff9fc85d21
---

# Starbucks

Write a program that holds on to coffee orders.

```ruby
c1 = Coffee.new('Darryl', 'latte', 'medium', 2)
```

Write the `.to_s` method for this class so when you `puts c1` you will have
"Darryl's latte, medium, 2 sugars."

### Extension

1. Starbucks always gets names wrong, however. Make the name a bad misspelling
   of the actual name when you create the order.

```ruby
puts c1
# => "Barrel's latte, medium, 2 sugars."
```

2. When you make an order, there should be a waiting time of anywhere between
   2-5 minutes. You should be able to check if it's ready by calling `c1.ready?`
   and have the program yell out the order and the misspelled name if its ready.

3. You should be able to mark the coffee as collected with `c1.collected = true`

4. List all of the coffees not collected.

5. Add options to the coffee order, eg shot of hazelnut, whipped cream,
   chocolate syrup.
