def valid_number?(number_string)
    number_string.to_i.to_s == number_string
end

num = nil
den = nil

loop do
    puts ">> Please enter the numerator:"
    num = gets.chomp
    break if valid_number?(num)
    puts "Invalid input. Only integers are allowed."
end
loop do
    puts ">> Please enter the denominator:"
    den = gets.chomp
    if den.to_i == 0
        puts "Invalid input. A denominator of 0 is not allowed."
        next
    end
    break if valid_number?(den)
    puts "Invalid input. Only integers are allowed."
end

answer = num.to_i / den.to_i
puts "#{num} / #{den} is #{answer.to_s}"


