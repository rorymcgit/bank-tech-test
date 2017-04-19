class Statement

  def view(log)
    print_header
    log.history.each do |arr|
      arr.each do |item|
        if item.class == Time
          print item.strftime("%c"), "\t"
        else
          print item, "\t\t"
        end
      end
      print "\n"
    end
  end

  private
  def print_header
    puts "Date\t\t\t\t Amount\t\t Balance\n"
  end

end
