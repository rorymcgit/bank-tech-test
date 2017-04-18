class Statement

  def view(log)
    puts "Date\t\t\t\t\t Amount\t\t Balance\n"
    log.history.each do |arr|
      arr.each do |item|
         print item, "\t\t"
       end
       puts puts
     end
   end

end
