def valid_number?(number_string)
    number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num_one = nil
num_two = nil


loop do
    loop do
        puts ">> Please enter a positive or negative integer:"
        num_one = gets.chomp
        break if valid_number?(num_one)
        puts "Invalid input. Only non-zero integers are allowed."
    end
    loop do
        puts ">> Please enter a positive or negative integer:"
        num_two = gets.chomp
        break if valid_number?(num_two)
        puts "Invalid input. Only non-zero integers are allowed."
    end
    break if num_one.to_i * num_two.to_i < 0
    puts ">> Sorry. One integer must be positive, one must be negative."
    puts ">> Please start over."
end

result = num_one.to_i + num_two.to_i
puts "#{num_one} + #{num_two} = #{result}"