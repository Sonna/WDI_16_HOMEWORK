# ---
# source:
# - title: WDI Danchat Warmup
#   url: https://gist.github.com/kasun-maldeni/a09a90fb5e142ee5eeec15071e1850d3
# ---

# # Daniel

# Daniel is a lackadaisical teenager. In conversation, his responses are very
# limited.

# - He answers 'Sure.' if you ask him a question.
# - He answers 'Whatever.' if you tell him something.
# - He answers 'Woah, chill out!' if you yell at him (ALL CAPS).
# - He says 'Fine. Be that way!' if you address him without actually saying
#   anything.

module Daniel
  def self.talk(remark)
    return "Fine. Be that way!" if remark.strip.empty?
    return "Whoa, chill out!" if remark =~ /[A-Za-z]/ && remark == remark.upcase
    return "Sure." if remark.strip.end_with?("?")
    "Whatever."
  end
end

# Write code in `ruby` so that you can have an interactive conversation with
# Daniel. Make sure you include some testing in order to verify your code.

# ## Hints

# `gets`, _get string_ is the opposite of `puts` _put string_.

# Notice that when you type "Something" and then hit enter, you get the string
# `"Something\n"`

# ```
loop do
  # talk to Daniel here
  puts "talk to Daniel here"
  remark = gets.chomp
  break if remark.empty?
  puts Daniel.talk(remark)
end
# ```

# ## Extensions

# ### l33t sP34k

# Daniel, inspired by the 90s, is bringing back "l33t sP34k", and he'll teach
# you how to do it. Start any sentence with "Bro, ", and he'll translate the
# rest of it into l33t sP34k for you.

# In brief:

# * Several vowels are always replaced with numbers: a = 4, e = 3, i = 1, o = 0
# * Words that start with a consonant start with lower case
# * Consonants after the first letter alternate upper and lower case, except the
#   alternation starts over with lowercase after a digit (ex: sCh00l)

module Daniel
  def self.leet_speak(remark)
    response = talk(remark)
    return response unless remark.start_with?("Bro, ")
    response = response.tr("aeio", "4310")
    response = response.gsub(/\b[^aeiouAEIOU]/) { |letter| letter.downcase }

    response.each_char.map.with_index do |c, index|
      if index.odd? && response[index - 1] !~ /\d/ # && response[index + 1] !~ /\d/
        c.upcase
      else
        c.downcase
      end
    end.join
  end

  def self.talk(remark)
    return "Fine. Be that way!" if remark.strip.empty?
    return "Whoa, chill out!" if remark =~ /[A-Za-z]/ && remark == remark.upcase
    return "Sure." if remark.strip.end_with?("?")
    "Whatever."
  end
end

loop do
  # talk to Daniel here
  puts "talk to Daniel here (l33t speak available, begin with \"Bro, \")"
  remark = gets.chomp
  break if remark.empty?
  puts Daniel.leet_speak(remark)
end
