class Coffee
  attr_accessor :collected
  attr_reader :customer, :name, :options, :size, :sugar, :ready_at

  def initialize(customer, name, size, sugar, *options)
    @customer = customer
    @name = name
    @size = size
    @sugar = sugar
    @options = options

    wait_time = 60 * rand(2..5) # 60 seconds * 2-5 minutes
    @ready_at = Time.now + wait_time
  end

  def ready?(time = Time.now)
    (ready_at - time).negative?
  end

  def to_s(time = Time.now)
    misspelling = customer.tr("Dy", "Be")
    result = "#{misspelling}'s #{name}, #{size}, #{sugar} sugars."
    result = result[0..-2] + " (with #{options.join(', ')})." if options.any?
    # ready?(Time.now + 300) ? result.upcase : result
    # ready? ? result.upcase : result
    ready?(time) ? result.upcase : result
  end
end
