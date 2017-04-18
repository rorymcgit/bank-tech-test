require 'date'

class Log

  attr_reader :history

  def initialize
    @history = []
  end

  def store(date, amount, current_balance)
    history << [date, amount, current_balance]
  end

end
