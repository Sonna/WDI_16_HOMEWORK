---
source:
- title: week4_sinatra_99_bottles_of_beer.md
  url: https://gist.github.com/epoch/2b700d261912047fe8b7cdca0324c580
---

# 99 Bottles of Beer

## Background

"99 Bottles of Beer" is an anonymous folk song dating to the mid-20th century.
It is a traditional reverse counting song in both the United States and Canada.
It is popular to sing on long trips, as it has a very repetitive format which is
easy to memorize and can take a long time to sing.

https://en.wikipedia.org/wiki/99_Bottles_of_Beer

## Named parameters

while query string parameter **works just fine &trade;** sinatra routing
provides support for something called **named parameters**.

Route patterns may include named parameters, accessible via the params hash:

```ruby
get '/hello/:name' do
  # matches "GET /hello/foo" and "GET /hello/bar"
  # params[:name] is 'foo' or 'bar'
  "Hello #{params[:name]}!"
end
```

## Project Specs

create the 99 bottles of beer song in the form of a sinatra web application.

- The home page `/` should list:
  - "99 Bottles of beer on the wall"
  - add a link to take one down
- The page `/:num_bottles` should show:
  - `:num_bottles` bottles of beer on the wall"
  - where `:num_bottles` can be any positive integer.
  - add a link to take one down
- The page `/0` should show:
  - "No Bottles of beer on the wall"
  - do not show a link to take one down
  - show a link to start over
