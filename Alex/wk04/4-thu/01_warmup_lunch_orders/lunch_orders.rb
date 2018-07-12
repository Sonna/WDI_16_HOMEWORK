# ---
# source:
# - title: WDI Lunch Orders Warmup
#   url: https://gist.github.com/kasun-maldeni/3ff70009c99feb615a717a9a4ba07b4d
# ---

# ## Lunch Orders

# It's approaching lunch hour… let's collect orders. Create a new file called
# `lunch_orders.rb` to complete this exercise.

# def run # `run` is a keyword?
def app
  # orders = {}
  orders = Hash.new { |hash, key| hash[key] = [] }

  loop do
# 1. Create a program that collects lunch orders. Prompt:
#   * **Name for order:** (enter name)
    print "Name for order: "
    name = gets.chomp
  # orders[name] ||= []

#   * **{name} wants to order:** (enter item)
    print "#{name} wants to order: "
    item = gets.chomp

# 2. Store the name/order data. When storing data, do it in such a way that
#    additional order items may be added for the person's name.
#   * Example: **Greg** can order a *Burger*, and then add *Fries* to his order
#     later.
    orders[name].push(item)

# 3. After storing data, prompt the user with:
#   * **Add another item to the order? (y/n)**
    print "Add another item to the order? (y/n) "
#   * Repeat steps 1 & 2 if the answer is "y"
    continue = (gets.chomp.strip.downcase == "y")
    break unless continue
  end

# 4. After the user completes adding orders, print out:
#   * **"All orders: {order data}"**
  puts "\nAll orders: #{orders}"

# ### Keep going...

# Rather than printing out a blob of raw lunch order data, print each name's
# orders on a separate line, formatted as one of the following:

#  * "Greg ordered a sandwich"
#  * "Peter ordered a burger & fries"
#  * "Travis ordered a salad, apple & water"

# *You may have to do some hunting in Ruby docs!*
  puts "All orders:"
  orders.each do |name, order|
    # puts "Greg ordered a sandwich"
    *head, tail = order.reject(&:empty?)
    puts "#{name} ordered a #{head.join(', ')} & #{tail}" if head.any?
    puts "#{name} ordered a #{tail}" if tail && head.empty?
  end
end

if $PROGRAM_NAME == __FILE__ && ARGV.first == "run"
  # without `clear`, `"run"` is used as filename & calls `gets` from it
  ARGV.clear
  app
elsif $PROGRAM_NAME == __FILE__
  require "minitest/autorun"

  class LunchOrdersTest < Minitest::Test
    def test_it_works
      assert true
    end

    def test_no_order
      stdout_output = local_io("\n\nn") { app }
      assert_equal(<<~OUTPUT, stdout_output)
        Name for order:  wants to order: Add another item to the order? (y/n)#{' '}
        All orders: {""=>[""]}
        All orders:
      OUTPUT
    end

    #  * "Greg ordered a sandwich"
    def test_gregs_order
      stdout_output = local_io("Greg\nsandwich\nn") { app }
      assert_equal(<<~OUTPUT, stdout_output)
        Name for order: Greg wants to order: Add another item to the order? (y/n)#{' '}
        All orders: {"Greg"=>["sandwich"]}
        All orders:
        Greg ordered a sandwich
      OUTPUT
    end

    #  * "Peter ordered a burger & fries"
    def test_peters_order
      assert_equal(<<~OUTPUT, local_io("Peter\nburger\ny\nPeter\nfries\nn") { app })
        Name for order: Peter wants to order: Add another item to the order? (y/n) Name for order: Peter wants to order: Add another item to the order? (y/n)#{' '}
        All orders: {"Peter"=>["burger", "fries"]}
        All orders:
        Peter ordered a burger & fries
      OUTPUT
    end

    #  * "Travis ordered a salad, apple & water"
    def test_travis_order
      assert_equal(<<~OUTPUT, local_io("Travis\nsalad\ny\nTravis\napple\ny\nTravis\nwater\nn") { app })
        #{intro_line("Travis") * 3}
        All orders: {"Travis"=>["salad", "apple", "water"]}
        All orders:
        Travis ordered a salad, apple & water
      OUTPUT
    end

    def test_all_lunch_orders
      assert_equal(local_io(
        "Greg\nsandwich\ny\n" \
        "Peter\nburger\ny\nPeter\nfries\ny\n" \
        "Travis\nsalad\ny\nTravis\napple\ny\nTravis\nwater\nn"
      ) { app }, <<~OUTPUT)
        #{intro_line("Greg") + (intro_line("Peter") * 2) + (intro_line("Travis") * 3)}
        All orders: {"Greg"=>["sandwich"], "Peter"=>["burger", "fries"], "Travis"=>["salad", "apple", "water"]}
        All orders:
        Greg ordered a sandwich
        Peter ordered a burger & fries
        Travis ordered a salad, apple & water
      OUTPUT
    end

    private

    def intro_line(name)
      "Name for order: #{name} wants to order: Add another item to the order? (y/n) "
    end

    def local_io(in_str)
      old_stdin = $stdin
      old_stdout = $stdout
      $stdin = StringIO.new(in_str)
      $stdout = StringIO.new
      yield
      $stdout.string
    ensure
      $stdin = old_stdin
      $stdout = old_stdout
    end
  end
end
