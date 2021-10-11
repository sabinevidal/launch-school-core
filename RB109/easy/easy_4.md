# Short Long Short
Input: 2 strings
Output: concated string, Short+Long+Short

Create array of 2 strings. Assign to `short` variable the result of calling `min` on the array, and to the `long` variable the result of calling max on the array.
Concat the variables
```ruby
def short_long_short(str1, str2)
    arr = [str1, str2]
    short = arr.min { |a, b| a.length <=> b.length }
    long = arr.max { |a, b| a.length <=> b.length }
    short + long + short
end
```

# What Century is That
Input: year
Output Century

For numbers bigger than 101, round year up to next hundred, divide by 100.
Add suffix to number depending on what number -1 = st, -2 = nd -3 = rd -4 up = th

```ruby
def century(year)
    century = year.ceil(-2)/100
    century.to_s + century_suffix(century)
end

def century_suffix(century)
    return 'th' if [11, 12, 13].include?(century % 100)
    last_digit = century.to_s[-1, 2]
    case last_digit
    when "1" then 'st'
    when "2" then 'nd'
    when "3" then 'rd'
    else 'th'
    end
end
```

# Leap Years 1
true if divide by 4 or 400
false if divide by 100
```ruby
def leap_year?(year)
    if year % 400 == 0
        return true
    elsif year % 100 == 0
        return false
    else
        year % 4 == 0
    end
end
```

# Leap Years 2
```ruby
def leap_year?(year)
    if year < 1752 && year % 4 ==0
        true
    elsif year % 400 == 0
        return true
    elsif year % 100 == 0
        return false
    else
        year % 4 == 0
    end
end
```

# Multiples of 3 and 5
```ruby
def multisum(num)
    total = 0
    (1..num).map do |i|
        if i % 3 == 0 || i % 5 == 0
            total + = i
        end
    end
    total
end
```


# Running Totals
```ruby
def running_total(arr)
    new_arr = []
    arr.map do |i|
        sum += i
    end
end
```

# Convert a String  Number
Input: string of digits
Output: String converted to an integer

Use a hash to map out the string digits to integer digits.
Create array of characters from the string.
For each element in array, find corresponding digit, and re-assign to the int version.

Initialise new number and assign it the value 0
Iterate through array of digits and first multiply the new number by 10 then add the new digit to the number.

```ruby
DIGITS = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}
def string_to_integer(str)
    digits = str.chars.map { |char| DIGITS[char]}

    num = 0
    digits.each { |digit| value = (value * 10) + digit}
    value
end
```
Need to prepend `0x` to hexadecimal number.
```ruby
def hexadecimal_to_integer(str)
    hexa = '0x' + str
    Integer(hexa)
end
```
# Convert a String to a Signed Number

```ruby
def string_to_signed_integer(str)
    case str[0]
    when '-'
        then -string_to_integer(str.delete('-'))
    when '+'
        then string_to_integer(str.delete('+'))
    else
        string_to_integer(str)
    end
end

```

# Convert a Number to a String
```ruby
CHARS = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'}
def integer_to_string(int)
    chars = int.digits.reverse.map { |digit| CHARS[digit]}

    str = chars.join
end
```

# Convert a Signed Number to a String
```ruby
def signed_integer_to_string(int)
    if int.negative?
        "-" + integer_to_string(int*-1)
	elsif int.positive?
        "+" + integer_to_string(int)
	else
		integer_to_string(int)
	end
end
```