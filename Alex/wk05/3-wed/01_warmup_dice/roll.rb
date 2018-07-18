class Dice
  RANGE = (1..6)

  def self.roll(n = 1)
    Results.new(n.times.map { rand(RANGE) })
  end

  class Results
    include Enumerable
    attr_reader :rolls

    def initialize(rolls)
      @rolls = rolls.map { |pips| Roll.new(pips) }
    end

    def each
      return enum_for(__callee__) { rolls.size } unless block_given?
      rolls.each { |roll| yield roll }
    end

    def to_a
      rolls.map(&:pips)
    end

    def to_s
      rolls.map(&:to_s).join
    end

    def total
      [rolls.map(&:pips), rolls.sum]
    end
  end

  class Roll
    FACES = {
      6 => <<~GRAPHIC,
            _________
            | *   * |
            | *   * |
            | *   * |
            _________
          GRAPHIC
      5 => <<~GRAPHIC,
            _________
            | *   * |
            |   *   |
            | *   * |
            _________
          GRAPHIC
      4 => <<~GRAPHIC,
            _________
            | *   * |
            |       |
            | *   * |
            _________
          GRAPHIC
      3 => <<~GRAPHIC,
            _________
            | *     |
            |   *   |
            |     * |
            _________
          GRAPHIC
      2 => <<~GRAPHIC,
            _________
            | *     |
            |       |
            |     * |
            _________
          GRAPHIC
      1 => <<~GRAPHIC,
            _________
            |       |
            |   *   |
            |       |
            _________
          GRAPHIC
    }.freeze

    attr_reader :pips

    def initialize(pips)
      @pips = pips
    end

    def <=>(other)
      case other
      when self.class then pips <=> other.pips
      when Numeric then pips <=> other
      else
        return other.coerce(self).reduce(:<=>) if other.respond_to?(:coerce)
        raise TypeError, "#{other.class} can't be coerced into #{self.class}"
      end
    end

    def +(other)
      case other
      # Does this idea of adding pips, to make a new Die/Roll, make sense?
      # self.class.new(pips + other.pips)
      when self.class then pips + other.pips
      when Numeric then pips + other
      else
        return other.coerce(self).reduce(:+) if other.respond_to?(:coerce)
        raise TypeError, "#{other.class} can't be coerced into #{self.class}"
      end
    end

    def coerce(other)
      [self.class.new(other), self]
    end

    def to_s
      FACES[pips]
    end
  end
end

Dice.roll # => #<Dice::Results:0x00007fe9cf985c90 @rolls=[#<Dice::Roll:0x00007fe9cf985bc8 @pips=3>]>
Dice.roll.to_a # => [3]
Dice.roll(3) # => #<Dice::Results:0x00007fe9cf932fb8 @rolls=[#<Dice::Roll:0x00007fe9cf932bf8 @pips=6>, #<Dice::Roll:0x00007fe9cf932b08 @pips=5>, #<Dice::Roll:0x00007fe9cf932928 @pips=2>]>
Dice.roll(3).to_a # => [2, 2, 5]
Dice.roll(3).total # => [[1, 5, 2], 8]
Dice.roll(3).to_s # => "_________\n| *     |\n|   *   |\n|     * |\n_________\n_________\n|       |\n|   *   |\n|       |\n_________\n_________\n| *     |\n|   *   |\n|     * |\n_________\n"
puts Dice.roll(3)

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
      # assert results.all? { |result| (1..6).cover?(result.pips) }
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
      subject = Dice.roll
      # subject.to_s
      # = > ["_________\n| *     |\n|       |\n|     * |\n_________\n"]
      # assert subject.to_s.each { |str| Dice::Roll::FACES.values.include?(str) }
      assert Dice::Roll::FACES.values.include?(subject.to_s)
    end

    protected

    def described_class
      Dice
    end
  end
end
# >> _________
# >> |       |
# >> |   *   |
# >> |       |
# >> _________
# >> _________
# >> | *   * |
# >> |   *   |
# >> | *   * |
# >> _________
# >> _________
# >> | *   * |
# >> | *   * |
# >> | *   * |
# >> _________
# >> Run options: --seed 26736
# >>
# >> # Running:
# >>
# >> ......
# >>
# >> Finished in 0.001238s, 4846.5267 runs/s, 7269.7900 assertions/s.
# >> 6 runs, 9 assertions, 0 failures, 0 errors, 0 skips
