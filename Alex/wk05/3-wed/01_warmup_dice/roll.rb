class Dice
  RANGE = (1..6)

  def self.roll(n = 1)
    Results.new(n.times.map { rand(RANGE) })
  end

  class Results
    include Enumerable
    attr_reader :values

    def initialize(values)
      @values = values
    end

    def each
      return enum_for(__callee__) { values.size } unless block_given?
      values.each { |value| yield value }
    end

    # def to_a
    #   values
    # end

    def total
      [values, values.sum]
    end
  end
end

if $PROGRAM_NAME == __FILE__
  require "minitest/autorun"

  class DiceTest < Minitest::Test
    def test_roll_class_method
      assert described_class.respond_to?(:roll)
    end

    # It should give you a different result each time.
    def test_roll_returns_different_results
      first_roll = Dice.roll
      second_round = Dice.roll
      third_round = Dice.roll
      # assert ([first_roll] & [second_round] & [third_round]).empty?
      results = [first_roll, second_round, third_round]
      # refute_equal results.uniq, results
      refute results.all? { |result| result == results.first }
    end

    # When you pass in a number, it rolls the dice that many times, and returns
    # you the array of rolled dice
    def test_roll_multiple_times
      results = Dice.roll(3)
      assert results.is_a?(Enumerable)
    end

    # how to test for rand values between 1 & 6
    def test_roll_returns_values_between_1_and_6
      results = Dice.roll(10)
      assert results.all? { |result| (1..6).cover?(result) }
    end

    ## Extensions
    # 1. Write a method called `total` you can chain directly after
    # `Dice.roll(n)`; e.g. `Dice.roll(4).total # => [[6,3,2,4], 15]`
    def test_chain_total_method_after_dice_roll
      subject = Dice.roll.total
      assert subject.is_a?(Enumerable)
      assert subject.first.is_a?(Enumerable)
      assert subject.last.is_a?(Numeric)
      assert_equal subject.first.sum, subject.last
    end

    # 2. Display die faces after rolling.
    def test_display_die_faces_after_rolling
      skip
    end

    protected

    def described_class
      Dice
    end
  end
end
# >> Run options: --seed 46850
# >>
# >> # Running:
# >>
# >> ..S...
# >>
# >> Finished in 0.000915s, 6557.3771 runs/s, 8743.1694 assertions/s.
# >> 6 runs, 8 assertions, 0 failures, 0 errors, 1 skips
# >>
# >> You have skipped tests. Run with --verbose for details.
