require 'date'

class Log

  attr_reader :history

  def initialize
    @history = []
  end

  def store_date(date)
    @history << date
  end

end
