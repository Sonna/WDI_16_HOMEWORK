# full_stars, half_stars = (7.7).divmod(2).map(&:to_i) # => [3, 1]

# max_stars = 5
# empty_stars = max_stars - full_stars
# "*" * full_stars + (half_stars >= 1 ? "+" + ("." * (empty_stars - 1)) : "." * empty_stars)
# # = > "***+."

class Rating
  MAX_STARS = 5

  attr_reader :full_stars, :half_stars, :empty_stars

  def initialize(value = 10) # assumes score is out of 10 (from IMDB)
    @full_stars, @half_stars = (value).divmod(2).map(&:to_i) # => [3, 1]
    @empty_stars = MAX_STARS - full_stars
    @empty_stars = empty_stars - 1 if half_stars >= 1
  end

  def to_s
    "*" * full_stars + "+" * half_stars + "." * empty_stars
  end

  def to_html
    <<~HTML
      <span class="stars">
        #{'<span class="full"></span>' * full_stars}
        #{'<span class="half-alt"></span>' * half_stars}
        #{'<span class="empty"></span>' * empty_stars}
      </span>
    HTML
  end
end
