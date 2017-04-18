class Account

  attr_reader :balance

  def initialize(log = Log.new)
    @balance = 0
    @log = log
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    check_withdrawal_does_not_exceed_balance(amount)
    @balance -= amount
  end


  private
  def check_withdrawal_does_not_exceed_balance(amount)
    raise "Insufficient funds" if amount > balance
  end

end
