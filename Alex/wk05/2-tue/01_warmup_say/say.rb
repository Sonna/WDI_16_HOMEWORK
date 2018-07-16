class Say
  UNITS = %w(zero one two three four five six seven eight nine ten eleven twelve
             thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
  TENS = %w(_ _ twenty thirty forty fifty sixty seventy eighty ninety)
  # MAGNITUDE = %w(_ thousand million billion)

  attr_reader :question

  def initialize(question)
    # unless (0..999_999_999_999).include?(question)
    unless (0..99).include?(question)
      raise ArgumentError, "Number must be between 0 and 99, inclusive."
    end
    @question = question
  end

  def in_english
    return UNITS.first if question.zero?
    chunkify(question).each_with_object([]).with_index do |(chunk, memo), i|
      next if chunk.zero?
      # memo << MAGNITUDE[i] unless i.zero?
      memo << textify(chunk)
    end.reverse.join(' ')
  end

  private

  def chunkify(number)
    chunks = []
    while number > 0
      number, chunk = number.divmod(1000)
      chunks << chunk
    end
    chunks
  end

  def textify(number)
    return UNITS[number] if number < UNITS.length

    tens, units = number.divmod(10)
    hundreds, tens = tens.divmod(10) # !> assigned but unused variable - hundreds

    out = []
    # out << "#{UNITS[hundreds]} hundred " if hundreds > 0
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

0.in_english # => "zero"
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

    # def test_one_hundred
    def test_one_hundred_is_out_range
      question = 100
      # assert_equal('one hundred', Say.new(question).in_english)
      assert_raises ArgumentError do
        Say.new(question).in_english
      end
    end

    # def test_one_hundred_twenty_three
    #   question = 123
    #   assert_equal('one hundred twenty-three', Say.new(question).in_english)
    # end

    # def test_one_thousand
    #   question = 1_000
    #   assert_equal('one thousand', Say.new(question).in_english)
    # end

    # def test_one_thousand_two_hundred_thirty_four
    #   question = 1_234
    #   assert_equal('one thousand two hundred thirty-four', Say.new(question).in_english)
    # end

    # def test_one_million
    #   question = 1_000_000
    #   assert_equal('one million', Say.new(question).in_english)
    # end

    # def test_one_million_two_thousand_three_hundred_forty_five
    #   question = 1_002_345
    #   assert_equal('one million two thousand three hundred forty-five', Say.new(question).in_english)
    # end

    # def test_one_billion
    #   question = 1_000_000_000
    #   assert_equal('one billion', Say.new(question).in_english)
    # end

    # def test_a_big_number
    #   question = 654_321_123
    #   assert_equal('six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three', Say.new(question).in_english)
    # end

    # def test_a_bigger_number
    #   question = 987_654_321_123
    #   assert_equal('nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three', Say.new(question).in_english)
    # end

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
# >> 8 runs, 8 assertions, 0 failures, 0 errors, 0 skips
# >> Run options: --seed 51084
# >>
# >> # Running:
# >>
# >> ........
# >>
# >> Finished in 0.001032s, 7751.9384 runs/s, 7751.9384 assertions/s.
# >> 8 runs, 8 assertions, 0 failures, 0 errors, 0 skips
