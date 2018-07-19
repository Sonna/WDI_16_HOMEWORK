# ---
# source:
# - title: WDI Say In English Solution
#   url: https://gist.github.com/kasun-maldeni/edef240fd32901ee9497de3f445928ae
# ---

class Say
  def initialize(num)
    @num = num.to_i
  end

  def in_english
    ones = %w(zero one two three four five six seven eight nine)
    teens = %w(ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
    tens = %w('' ten twenty thirty forty fifty sixty seventy eighty ninety)
    tens_num, ones_num = @num.divmod(10)
    if @num < 0 || @num >= 100
      raise ArgumentError, 'Number must be between 0 and 99, inclusive.'
    elsif @num < 10
      ones[ones_num]
    elsif @num < 20
      teens[ones_num]
    else
      tens[tens_num] + (ones_num == 0 ? '' : "-#{ones[ones_num]}")
    end
  end
end

puts Say.new(0).in_english
puts Say.new(14).in_english
puts Say.new(50).in_english
puts Say.new(98).in_english
puts Say.new(-1).in_english
puts Say.new(100).in_english
