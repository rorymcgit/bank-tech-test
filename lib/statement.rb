class Statement

  def view(log)
    print_header
    log.history.each do |arr|
      arr.each do |item|
        print item, "\t\t"
      end
      puts
    end
  end

  private
  def print_header
    puts "Date\t\t\t\t\t Amount\t\t Balance\n"
  end

end
