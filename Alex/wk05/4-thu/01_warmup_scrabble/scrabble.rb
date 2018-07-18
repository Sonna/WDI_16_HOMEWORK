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
  def self.map_score(s)
    ->(l) { [l, s] }
  end

# Letter                           Value
  LETTER_SCORE = Hash[*[
    %w(A E I O U L N R S T).map(&map_score(1)),
    %w(D G).map(&map_score(2)),
    %w(B C M P).map(&map_score(3)),
    %w(F H V W Y).map(&map_score(4)),
    %w(K).map(&map_score(5)),
    %w(J X).map(&map_score(8)),
    %w(Q Z).map(&map_score(10))
  ].flatten]

  def self.score(word)
    word.chars.reduce(0) do |sum, letter|
      sum += LETTER_SCORE[letter.upcase]
    end
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
        assert_equal 1, described_class.score(letter)
      end
    end

    def test_calculates_score_2_for_DG
      %w(d g).each do |letter|
        assert_equal 2, described_class.score(letter)
      end
    end

    def test_calculates_score_3_for_BCMP
      %w(b c m p).each do |letter|
        assert_equal 3, described_class.score(letter)
      end
    end

    def test_calculates_score_4_for_FHVWY
      %w(f h v w y).each do |letter|
        assert_equal 4, described_class.score(letter)
      end
    end

    def test_calculates_score_5_for_K
      assert_equal 5, described_class.score("k")
    end

    def test_calculates_score_4_for_JX # !> previous definition of test_calculates_score_4_for_JX was here
      %w(j x).each do |letter|
        assert_equal 8, described_class.score(letter)
      end
    end

    def test_calculates_score_4_for_JX # !> method redefined; discarding old test_calculates_score_4_for_JX
      %w(q z).each do |letter|
        assert_equal 10, described_class.score(letter)
      end
    end

    protected

    def described_class
      Scrabble
    end
  end
end
# >> Run options: --seed 41237
# >>
# >> # Running:
# >>
# >> ..........
# >>
# >> Finished in 0.001355s, 7380.0738 runs/s, 20664.2066 assertions/s.
# >> 10 runs, 28 assertions, 0 failures, 0 errors, 0 skips
