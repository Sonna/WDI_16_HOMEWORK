class Dice
  RANGE = (1..6)

  def self.roll(n = 1)
    n.times.map { rand(RANGE) }
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
      skip
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
# >> Run options: --seed 53252
# >>
# >> # Running:
# >>
# >> ....
# >>
# >> Finished in 0.000886s, 4514.6727 runs/s, 4514.6727 assertions/s.
# >> 4 runs, 4 assertions, 0 failures, 0 errors, 0 skips
