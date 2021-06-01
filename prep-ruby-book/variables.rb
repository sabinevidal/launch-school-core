1.
#name.rb
puts "What is your name?"
name = gets.chomp
puts "Hi " + name

2.
#age.rb
puts "How old are you?"
age = gets.chomp.to_i
puts "In 10 years you will be:"
puts age + 10
puts "In 20 years you will be:"
puts age + 20
puts "In 30 years you will be:"
puts age + 30
puts "In 40 years you will be:"
puts age + 40

3.
#name.rb cont

10.times do
    puts name
end

4.
#name.rb cont
puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts first_name + " " + last_name

5.
First program prints 3
Second program will throw an error because x isn't avaiable as it is created in the do/end block's scope.