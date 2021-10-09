# How old is Teddy?

```ruby
def teddys_age
    age = rand(20..200)
    puts "Teddy is #{age} years old!"
end

puts "What's teddy's name?"
name = gets.chomp
age = rand(20..200)
puts "#{name} is #{age} years old!"
```

# How big is the room?

```ruby
def room_size
    puts "Enter the length of the room in meters:"
    length = gets.chomp.to_f
    puts "Enter the width of the room in meters:"
    width = gets.chomp.to_f
    sqmeter = length*width
    sqfeet = sqmeter*10.7639
    puts "The area of the room is #{sqmeter} square meters (#{sqfeet} square feet)"
end
```

# Tip calculator

```ruby
def tip_calculator
    puts "What is the bill?"
    bill = gets.chomp.to_f
    puts "What is the tip percentage?"
    tip_percent = gets.chomp.to_f
    tip = (bill/100)*tip_percent
    total = bill + tip
    puts "The tip is $#{tip}"
    puts " The total is $#{total}"
end
```

# When will I retire
```ruby
def age
    puts "What is your age?"
    age = gets.to_i
    puts "At what age would you like to retire?"
    retire_age = gets.to_i
    current_year = Time.now.year
    retire_time = retire_age - age
    retire_year = current_year + retire_time

    puts "It's #{current_year}. You will retire in #{retire_year}."
    puts "You only have #{retire_time} years of work to go!"
end
```

# Greeting a user
```ruby
def greeting
    puts "What is your name?"
    name = gets.chomp

    if name.include? "!"
        puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
    else
        puts "Hello #{name}."
    end
end
```

# Odd Numbers
```ruby
(1..99).map {|i| puts i if i.odd?}

1.upto(99) { |i| puts i if i.odd?}
```

# Even Numbers
```ruby
1.upto(99) { |i| puts i if i.even?}
```

# Sum or Product of Consecutive Integers
```ruby
# first go
puts ">> Please enter an integer greater than 0:"
int = gets.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
answer = gets.chomp
if answer == 's'
    sum = 0
    1.upto(int) { |i| sum += i }
    puts "The sum of the integers between 1 and #{int} is #{sum}."
elsif answer == 'p'
    product = 1
    1.upto(int) { |i| product *= i }
    puts "The product of the integers between 1 and #{int} is #{product}."
end
```
```ruby
# neaten up with validation
def compute_sum(int)
    sum = 0
    1.upto(int) { |i| sum += i }
    sum
end

def compute_product(int)
    product = 1
    1.upto(int) { |i| product *= i }
    product
end

puts ">> Please enter an integer greater than 0:"
int = gets.to_i
loop do
    puts ">> Enter 's' to compute the sum, 'p' to compute the product."
    answer = gets.chomp
    if answer == 's'
        sum = compute_sum
        puts "The sum of the integers between 1 and #{int} is #{sum}."
    elsif answer == 'p'
        product = compute_product
        puts "The product of the integers between 1 and #{int} is #{product}."
    else
        puts "Oops! Wrong input! Try again"
        next
    end
    break
end
```

# String Assignment
```ruby
BOB
BOB
```
This program will print out capitalised Bob twice. The variable `name` is initialised and assigned to the String object with the value `"Bob"`. On `line 2` the variable `save_name` is intialised and assigned to the variable `name`, and so references the same String object as `name`. This is an example of the concept of variables as pointers, where variables point to the address space of an object. When the new variable `save_name` is assigned to the original `name`, they are both pointing to the same object. On `line 3` the method `.upcase!` is called with the `name` variable, making the whole string uppercase. This is a destructive method, so it will mutate the original object which `name` is pointing to. `save_name` is pointing to the same object so will also reflect the changes.

# Mutation

```ruby
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo
```
On `line 3`, references from the elements in `array1` are merely copied over to `array2`. As `.upcase!` in the loop on `line 4` is a destructive method, the changes to the array elements will be reflected in both `array1` and `array2`.