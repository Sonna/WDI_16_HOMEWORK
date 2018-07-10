---
source:
- title: WDI Danchat Solution
  url: https://gist.github.com/kasun-maldeni/d0c01f06ffde8f439d1d67cfe4bc5487
---

```ruby
loop do
  puts "What would you like to say to Daniel?"
  input = gets.chomp

  if input[0..4] == "Bro, "
    output = input[5..-1].downcase
    output = output.gsub(/[aeio]/, 'a' => 4, 'e' => 3, 'i' => 1, 'o' => 0)
    counter = 0
    for i in 0...output.length
      if output[i].match /[a-z]/
        if counter == 1
          output[i] = output[i].upcase
        end
        counter = (counter + 1) % 2
      else
        counter = 0
      end
    end
    puts output
  elsif input == input.upcase && input.match(/[a-z]|[A-Z]/)
    puts "Woah, chill out!"
  elsif input[-1] == '?'
    puts "Sure."
  elsif input == ""
    puts "Fine. Be that way!"
  else
    puts "Whatever."
  end
end
```
