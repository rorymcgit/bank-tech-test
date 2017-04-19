require_relative 'log'
require_relative 'statement'

class Account

  attr_reader :balance, :log

  def initialize(log = Log.new)
    @balance = 0
    @log = log
  end

  def deposit(amount)
    @balance += amount
    @in_overdraft = false if @balance > 0
    log.store(Time.now, amount, balance)
  end

  def withdraw(amount)
    check_withdrawal_against_current_balance(amount)
    if @in_overdraft
      @balance -= amount
      apply_overdraft_fee
    else
      @balance -= amount
    end
    log.store(Time.now, -amount, balance)
  end

  def view_statement(statement = Statement.new)
    statement.view(@log)
  end

  private
  def check_withdrawal_against_current_balance(amount)
    puts "Insufficient funds - you have been charged a 10% overdraft fee" if amount > balance
    amount > balance ? @in_overdraft = true : @in_overdraft = false
  end

  def apply_overdraft_fee
    @balance -= @balance.abs / 10
  end

end
