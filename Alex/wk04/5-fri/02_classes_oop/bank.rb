# API - Application Programming Interface or interface
class Account
  # todo soon
  def initialize(amount = 0, name = 'checking')
    @balance = amount
    @name = name
  end

  def deposit(amount) # instance method
    @balance = @balance + amount

    # dont worry about this
    return self
  end

  def balance # instance method
    return @balance
  end

  # setter
  # def set_name(name = 'savings')
  # def name=(name)
  #   @name = name
  # end
  def name=(value)
    @name = value
  end

  # getter
  # def get_name
  def name
    # 'savings'
    @name
  end

  def withdraw(amount) # instance method
    fee = 3
    @balance -= amount
    @balance -= fee
    return amount
  end

end

a1 = Account.new

a1 # => #<Account:0x00007f802797f550 @balance=0, @name="checking">
a1.deposit(15)
a1 # => #<Account:0x00007f802797f550 @balance=15, @name="checking">

a1.deposit(12)
a1 # => #<Account:0x00007f802797f550 @balance=27, @name="checking">

# 27
a1.balance # => 27
# ~ > -:20:in `<main>': undefined method `balance' for #<Account:0x00007fa3529b7218 @balance=27> (NoMethodError)

a1.name # => "checking"

a2 = Account.new # => #<Account:0x00007f8027979dd0 @balance=0, @name="checking">
a2.class # => Account

# 0
a2.balance # => 0

a2.deposit(10) # => #<Account:0x00007f8027979dd0 @balance=10, @name="checking">
a2.deposit(10).deposit(20) # => #<Account:0x00007f8027979dd0 @balance=40, @name="checking">
a2 # => #<Account:0x00007f8027979dd0 @balance=40, @name="checking">

a2.deposit(1000) # => #<Account:0x00007f8027979dd0 @balance=1040, @name="checking">
a2.balance # => 1040

# require 'pry'
# binding.pry

a3 = Account.new(1000) # => #<Account:0x00007f8027943758 @balance=1000, @name="checking">
a3 # => #<Account:0x00007f8027943758 @balance=1000, @name="checking">
a3.deposit(15) # => #<Account:0x00007f8027943758 @balance=1015, @name="checking">
a3.deposit(12) # => #<Account:0x00007f8027943758 @balance=1027, @name="checking">
a3.balance # => 1027

# add withdrawal fee of $3, balance was `1027` expect `1014` after withdraw `10`
a3.withdraw(10) # => 10
a3 # => #<Account:0x00007f8027943758 @balance=1014, @name="checking">

# a3.get_name # => "checking"
# a3.set_name('savings') # => "savings"
# a3.get_name # => "savings"

a3.name # => "checking"
a3.name=('savings') # => "savings"
a3.name = 'savings' # => "savings"
a3.name # => "savings"
