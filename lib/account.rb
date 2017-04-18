require_relative 'log'

class Account

  attr_reader :balance, :log

  def initialize(log = Log.new)
    @balance = 0
    @log = log
  end

  def deposit(amount)
    @balance += amount
    log.store(Time.now, amount, balance)
  end

  def withdraw(amount)
    check_withdrawal_does_not_exceed_balance(amount)
    @balance -= amount
    log.store(Time.now, -amount, balance)
  end


  private
  def check_withdrawal_does_not_exceed_balance(amount)
    raise "Insufficient funds available" if amount > balance
  end

end
