# ---
# source:
# - title: ruby_method_temperature_converter.md
#   url: https://gist.github.com/epoch/225c8ad85f2a871486933b3a6e3b6834
# ---

# # Exercise: Temperature Converter

# Goal: create a program that can convert a temperature in fahrenheit, Celsius or
# Kelvin to the other two units.

# - Try the bonus goals if you have extra time!

# ## Setup

# * Write your code in  `temp_converter.rb`.
# * Test your code by running the following the terminal...

# ```bash
# $ ruby temp_converter.rb
# ```

# ## Instructions

# Ask the user for two inputs and store them in their own variables...
#   1. A starting temperature value
puts "1. A starting temperature value"
start_temp = gets.chomp.to_i

#   2. A temperature unit (e.g., f, C, K). Store each of those in a variable.
puts "2. A temperature unit (e.g., f, C, K)."
unit = gets.chomp

# Define a `convert_temp` method that takes those two user inputs as arguments.
def convert_temp(temp, temp_unit)
# Inside the method, create a conditional statement that contains a block for
# each unit of temperature. It will look something like this...
  to_celsius = temp
  to_fahrenheit = temp
  to_kelvin = temp

# ```ruby
  if temp_unit == "f"
    input_type = "fahrenheit"
    # From: Fahrenheit To: Celsius  C = ( F - 32) / 1.8
    to_celsius = (temp - 32) / 1.8
    # From: Fahrenheit To: kelvin  K = ( F + 459.67) / 1.8
    to_kelvin = (temp + 459.67) / 1.8
#   ...
  elsif temp_unit == "C"
    input_type = "celsius"
    # From: Celsius To: Fahrenheit   F =  C × 1.8 + 32
    to_fahrenheit = temp * 1.8 + 32
    # From: Celsius To: kelvin  K = C  + 273.15
    to_kelvin = temp + 273.15
#   ...
  elsif temp_unit == "K"
    input_type = "kelvin"
    # From: kelvin To: Celsius  C = K - 273.15
    to_celsius = temp - 273.15
    # From: kelvin To: Fahrenheit   F = K × 1.8 - 459.67
    to_fahrenheit = temp * 1.8 - 459.67
#   ...
  else
#   ...
  end
# ```

# Each conditional block should convert the starting temperature to its
# equivalent value in the other two units (e.g., f should be converted to C and
# K).

# * Conversion formulae: [http://www.csgnetwork.com/temp2conv.html](http://www.csgnetwork.com/temp2conv.html)
# * Sample temperatures: 32f = 0C = 273.15K

# Display the starting and converted values in the console.

# * **NOTE:** You should only be displaying the starting and converted values for
#   the temperature the user selected at the beginning.

# ```ruby
# # User selected "f" at the start of the program. So the output is...
# fahrenheit: ...
# to Celsius: ...
# to Kelvin: ...
# ```
puts "#{input_type}: #{temp}"
puts "to Celsius: #{to_celsius}"
puts "to Fahrenheit: #{to_fahrenheit}"
puts "to Kelvin: #{to_kelvin}"
end

# Feel free to turn to your tablemates for help!
convert_temp(start_temp, unit)

# ### Bonus 1

# Store the starting and converted temperatures in a hash. When you print those
# values to the console, do it by accessing the values in the hash.

# ### Bonus 2

# Keep the program running until the user decides to quit.
# * **HINT:** Requires a `while` loop.
# * When the program starts, the user should be prompted to enter a temperature OR
#   quit the program.
# * After the program displays the starting/converted temperatures, it should
#   return to the initial user prompt.
