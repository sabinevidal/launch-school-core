loop do
    puts ">> How many output lines do you want? Enter a number >= 3 (Q to quit):"
    lines = gets.chomp
    if lines.downcase == 'q'
        break
    elsif lines.to_i >= 3
        lines.to_i.times {puts "Launch School is the best!"}
    else
        puts ">> That's not enough lines"
    end
end


