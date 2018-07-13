# API - Application Programming Interface or interface
class Account
  # todo soon
  def initialize()
    @balance = 0
  end

  def deposit(amount) # instance method
    @balance = @balance + amount

    # dont worry about this
    return self
  end

  def balance # instance method
    return @balance
  end

end

a1 = Account.new

a1 # => #<Account:0x00007fcefa1a1870 @balance=0>
a1.deposit(15)
a1 # => #<Account:0x00007fcefa1a1870 @balance=15>

a1.deposit(12)
a1 # => #<Account:0x00007fcefa1a1870 @balance=27>

# 27
a1.balance # => 27
# ~ > -:20:in `<main>': undefined method `balance' for #<Account:0x00007fa3529b7218 @balance=27> (NoMethodError)

a2 = Account.new # => #<Account:0x00007fcefa19bcb8 @balance=0>
a2.class # => Account

# 0
a2.balance # => 0

a2.deposit(10) # => #<Account:0x00007fcefa19bcb8 @balance=10>
a2.deposit(10).deposit(20) # => #<Account:0x00007fcefa19bcb8 @balance=40>
a2 # => #<Account:0x00007fcefa19bcb8 @balance=40>

a2.deposit(1000) # => #<Account:0x00007fcefa19bcb8 @balance=1040>
a2.balance # => 1040

# require 'pry'
# binding.pry
