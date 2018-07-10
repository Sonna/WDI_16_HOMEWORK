# # Check for Palindromes

# Return true if the given string is a palindrome. Otherwise, return false.

# A palindrome is a word or sentence that's spelled the same way both forward
# and backward, ignoring punctuation, case, and spacing.

# [Some Palindromes to test against](http://www.palindromelist.net/)

# Good Luck!

def is_palindrome?(pharse)
  letters = pharse.downcase.gsub(/[^a-z]/, "").chars
  letters == letters.reverse
end

pharse = "A but tuba."
is_palindrome?(pharse) # => true
pharse = "A car, a man, a maraca."
is_palindrome?(pharse) # => true
pharse = "A dog, a plan, a canal: pagoda."
is_palindrome?(pharse) # => true
pharse = "A dog! A panic in a pagoda!"
is_palindrome?(pharse) # => true
pharse = "A lad named E. Mandala"
is_palindrome?(pharse) # => true
pharse = "A man, a plan, a canal: Panama."
is_palindrome?(pharse) # => true
