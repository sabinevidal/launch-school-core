loop do 
    puts ">> Do you want me to print something? (y/n)"
    input = gets.chomp.downcase
    if input == 'y'
        puts "something"
        break
    elsif input == 'n'
        break
    else
        puts ">> Invalid input! Please enter y or n"
    end
end
