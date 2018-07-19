# ---
# source:
# - title: WDI Scrabble Warmup
#   url: https://gist.github.com/kasun-maldeni/e0cbf312fe38afeb0f1997df85442a29
# ---

# # Scrabble Score

# Write a program that, given a word, computes the scrabble score for that word.

# ```ruby
# Scrabble.score("cabbage")
# # => 14
# ```

# Your program should be in a file named `scrabble.rb`.

# ## Letter Values

# ```plain
# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10
# ```

module Scrabble
  def self.letter_value(v)
    ->(l) { [l, v] }
  end

  POINTS = ('A'..'Z').to_a.zip(
    [1,3,3,2,1,4,2,4,1,8,5,1,3,1,1,3,10,1,1,1,1,4,4,8,4,10]
  ).to_h.freeze

  # Letter                           Value
  # POINTS = Hash[*[
  #   %w(A E I O U L N R S T).map(&letter_value(1)),
  #   %w(D G).map(&letter_value(2)),
  #   %w(B C M P).map(&letter_value(3)),
  #   %w(F H V W Y).map(&letter_value(4)),
  #   %w(K).map(&letter_value(5)),
  #   %w(J X).map(&letter_value(8)),
  #   %w(Q Z).map(&letter_value(10))
  # ].flatten].freeze

  # POINTS = {
  #   A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1,
  #   D: 2, G: 2,
  #   B: 3, C: 3, M: 3, P: 3,
  #   F: 4, H: 4, V: 4, W: 4, Y: 4,
  #   K: 5,
  #   J: 8, X: 8,
  #   Q: 10, Z: 10
  # }.freeze

  MODIFIERS = { nil => 1, double: 2, triple: 3 }.freeze

  def self.score(word, modifiers = {})
    word.upcase.each_char.with_index(1).sum do |letter, index|
      POINTS[letter] * MODIFIERS[modifiers[index]]
    end * MODIFIERS[modifiers[:word]]
  end
end

# ## Extensions

# * You can play a `:double` or a `:triple` letter.
# * You can play a `:double` or a `:triple` word.

if $PROGRAM_NAME == __FILE__
  require "minitest/autorun"

  class ScrabbleTest < Minitest::Test
    def test_score_class_method
      assert described_class.respond_to?(:score)
    end

    # Write a program that, given a word, computes the scrabble score for that
    # word.
    def test_calculates_score_14_for_cabbage
      assert_equal 14, described_class.score("cabbage")
    end

    def test_calculates_score_14_for_scrabble
      assert_equal 14, described_class.score("scrabble")
    end

    def test_calculates_score_9_for_ruby
      assert_equal 9, described_class.score("ruby")
    end

    def test_calculates_score_1_for_AEIOULNRST
      %w(a e i o u l n r s t).each do |letter|
        assert_equal 1, described_class.score(letter), letter
      end
    end

    def test_calculates_score_2_for_DG
      %w(d g).each do |letter|
        assert_equal 2, described_class.score(letter), letter
      end
    end

    def test_calculates_score_3_for_BCMP
      %w(b c m p).each do |letter|
        assert_equal 3, described_class.score(letter), letter
      end
    end

    def test_calculates_score_4_for_FHVWY
      %w(f h v w y).each do |letter|
        assert_equal 4, described_class.score(letter), letter
      end
    end

    def test_calculates_score_5_for_K
      assert_equal 5, described_class.score("k"), "k"
    end

    def test_calculates_score_8_for_JX
      %w(j x).each do |letter|
        assert_equal 8, described_class.score(letter), letter
      end
    end

    def test_calculates_score_10_for_QZ
      %w(q z).each do |letter|
        assert_equal 10, described_class.score(letter), letter
      end
    end

    # * You can play a `:double` or a `:triple` letter.
    def test_play_a_double_letter
      assert_equal 7, described_class.score('ab', { 2 => :double })
    end

    def test_play_a_triple_letter
      assert_equal 30, described_class.score('q', { 1 => :triple })
    end

    # * You can play a `:double` or a `:triple` word.
    def test_play_a_double_word
      assert_equal 28, described_class.score('cabbage', { word: :double })
    end

    def test_play_a_triple_word
      assert_equal 42, described_class.score('cabbage', { word: :triple })
    end

    def test_play_a_triple_word_with_a_double_letter
      assert_equal 51, described_class.score('cabbage', {
        3 => :double, word: :triple
      })
    end

    protected

    def described_class
      Scrabble
    end
  end
end
# >> Run options: --seed 17885
# >>
# >> # Running:
# >>
# >> ................
# >>
# >> Finished in 0.001868s, 8565.3105 runs/s, 18736.6168 assertions/s.
# >> 16 runs, 35 assertions, 0 failures, 0 errors, 0 skips
