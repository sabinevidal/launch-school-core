# Searching 101
Get 6 ints from input, add first 5 to array.
Check if 6th number appears in array.
```ruby
ints = []
puts "==> Enter the 1st number:"
int1 = gets.to_i
ints << int1
puts "==> Enter the 2nd number:"
int2 = gets.to_i
ints << int2
puts "==> Enter the 3rd number:"
int3 = gets.to_i
ints << int3
puts "==> Enter the 4th number:"
int4 = gets.to_i
ints << int4
puts "==> Enter the 5th number:"
int5 = gets.to_i
ints << int5
puts "==> Enter the last number:"
int6 = gets.to_i

if ints.include?(int6)
    puts "The number #{int6} appears in #{ints}."
else
    puts "The number #{int6} does not appear in #{ints}."
end
```

# Arithmetic Integer
```ruby
puts "==> Enter the first number:"
num1 = gets.to_i
puts "==> Enter the second number:"
num2 = gets.to_i

puts "==>  #{num1} + #{num2} = #{num1 + num2}"
puts "==>  #{num1} - #{num2} = #{num1 - num2}"
puts "==>  #{num1} * #{num2} = #{num1 * num2}"
puts "==>  #{num1} / #{num2} = #{num1 / num2}"
puts "==>  #{num1} % #{num2} = #{num1 % num2}"
puts "==>  #{num1} ** #{num2} = #{num1 ** num2}"
```

# Counting the number of characters
```ruby
puts "Please write word or multiple words:"
input = gets.chomp
chars_total = input.delete(" ").size
puts " There are #{chars_total} characters in '#{input}'."
```

# Multiplying Two numbers
```ruby
def multiply(int1, int2)
    total = int1*int2
end

```

# Squaring an Argument
```ruby
def square(int)
    multiply(int, int)
end

def power_to(int, n)
    int**n
end
```

# Exclusive Or
```ruby
# first go
def xor?(arg1, arg2)
    if arg1 && arg2
        return false
    elsif arg1 || arg2
        return true
    else
        return false
    end
end

# simplified
def xor?(arg1, arg2)
    return true if arg1 && !arg2
    return true if !arg1 && arg2
    return false
end
```

# Odd Lists
```ruby
def oddities(arr)
    return_arr = []
    arr.each_with_index do |el, i|
        return_arr << el if i.even?
    end
    return_arr
end

def eveners(arr)
    return_arr = []
    arr.each_with_index do |el, i|
        return_arr << el if i.odd?
    end
    return_arr
end
```

# Palindromic Strings 1
```ruby
def palindrome?(str)
    str.reverse == str
end

def palindrome_arr?(arr)
    arr.reverse == arr
end

def palindrome_arr?(str_arr)
    str_arr.reverse == str_arr
end
```

# Palindromic Strings 2
```ruby
def real_palindrome?(str)
    str = str.downcase.delete('^a-z0-9')
    palindrome?(str)
end
```

# Palindromic Numbers
```ruby
def palindromic_number?(num)
    palindrome_arr?(num.digits)
end
```