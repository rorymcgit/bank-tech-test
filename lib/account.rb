class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    check_deposit_does_not_exceed_balance(amount)
    @balance -= amount
  end


  private
  def check_deposit_does_not_exceed_balance(amount)
    raise "Insufficient funds" if amount > balance
  end

end
