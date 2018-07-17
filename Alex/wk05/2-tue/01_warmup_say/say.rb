class Say
  UNITS = %w(zero one two three four five six seven eight nine ten eleven twelve
             thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  TENS = %w(_ _ twenty thirty forty fifty sixty seventy eighty ninety)

  attr_reader :question

  def initialize(question)
    unless (0..99).include?(question)
      raise ArgumentError, "Number must be between 0 and 99, inclusive."
    end
    @question = question
  end

  def in_english
    return UNITS.first if question.zero?
    textify(question)
  end

  private

  def textify(number)
    return UNITS[number] if number < UNITS.length

    tens, units = number.divmod(10)

    out = []
    out << "#{TENS[tens]}" if tens > 0 && number >= 20
    out << "-" if tens > 0 && units > 0
    out << "#{UNITS[units]}" if units > 0
    out.join.strip
  end
end

# ## Extension
#
# Re-write the method for the Integer class
class Integer
  def in_english
    Say.new(self).in_english
  end
end

Say.new(0).in_english # => "zero"
1.in_english # => "one"
2.in_english # => "two"
3.in_english # => "three"
4.in_english # => "four"
5.in_english # => "five"
6.in_english # => "six"
7.in_english # => "seven"
8.in_english # => "eight"
9.in_english # => "nine"
10.in_english # => "ten"
11.in_english # => "eleven"
12.in_english # => "twelve"
13.in_english # => "thirteen"
14.in_english # => "fourteen"
15.in_english # => "fifteen"
16.in_english # => "sixteen"
17.in_english # => "seventeen"
18.in_english # => "eighteen"
19.in_english # => "nineteen"
20.in_english # => "twenty"
21.in_english # => "twenty-one"
22.in_english # => "twenty-two"
30.in_english # => "thirty"
32.in_english # => "thirty-two"
40.in_english # => "forty"
43.in_english # => "forty-three"
50.in_english # => "fifty"
54.in_english # => "fifty-four"
60.in_english # => "sixty"
65.in_english # => "sixty-five"
70.in_english # => "seventy"
76.in_english # => "seventy-six"
80.in_english # => "eighty"
87.in_english # => "eighty-seven"
90.in_english # => "ninety"
98.in_english # => "ninety-eight"
99.in_english # => "ninety-nine"

if $PROGRAM_NAME == __FILE__
  require 'minitest/autorun'

  class SayTest < Minitest::Test
    def test_zero
      question = 0
      assert_equal('zero', Say.new(question).in_english)
    end

    def test_one
      question = 1
      assert_equal('one', Say.new(question).in_english)
    end

    def test_fourteen
      question = 14
      assert_equal('fourteen', Say.new(question).in_english)
    end

    def test_twenty
      question = 20
      assert_equal('twenty', Say.new(question).in_english)
    end

    def test_twenty_two
      question = 22
      assert_equal('twenty-two', Say.new(question).in_english)
    end

    def test_one_hundred_is_out_range
      question = 100
      assert_raises ArgumentError do
        Say.new(question).in_english
      end
    end

    def test_numbers_below_zero_are_out_of_range
      question = -1
      assert_raises ArgumentError do
        Say.new(question).in_english
      end
    end

    def test_numbers_above_999999999999_are_out_of_range
      question = 1_000_000_000_000
      assert_raises ArgumentError do
        Say.new(question).in_english
      end
    end
  end
end
# >> Run options: --seed 13314
# >>
# >> # Running:
# >>
# >> ........
# >>
# >> Finished in 0.001301s, 6149.1166 runs/s, 6149.1166 assertions/s.
# >> 8 runs, 8 assertions, 0 failures, 0 errors, 0 skips
