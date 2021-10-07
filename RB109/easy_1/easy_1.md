# Repeat Yourself

```ruby
def repeat(str, num)
    num.times do
        puts str
    end
end

# repeat("hello", 2)
# hello
# hello
# => 2
```

# Odd

```ruby
def is_odd?(num)
    num % 2 != 0
end

```

```ruby
def is_odd2?(num)
    num.remainder(2) != 0
end
```

# List of Digits

```ruby
def digit_list(num)
    numbers = num.to_s.chars
    numbers.map { |char| char.to_i }
end
```
With syntactical sugar
```ruby
def digit_list2(num)
    num.to_s.chars(&:to_i)
end
```

# How Many?
input: array
output: Unique elements with the number of times it occured in the array eg. `element => 4`

Data structure: Hash as can store name and number together, order isn't important

Initialise hash. Go through array one at a time, if it's a new element add it as a new key to the hash and start the counter at 1.
If it's a repeat element, increment the relevant counter by 1.

```ruby
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# first go which works
def count_occurrences(arr)
    hsh = {}
    arr.each do | el |
        if hsh.has_key?(el) == false
            hsh[el] = 1
        else
            hsh[el] += 1
        end
    end
    hsh.each do |key, count|
        puts "#{key} => #{count}"
    end
end

# working through solution which is cleaner
def count_occurrences2(arr)
    occurrences = {}
    arr.uniq.each do |el|                       # arr.uniq returns a NEW array to cycle through for each unique element
        occurrences[el] = arr.count(el)         # the original arr is called with .count(), using each unique element as the argument which specifies what should be counted
    end
    occurrences.each do |key, count|
        puts "#{key} => #{count}"
    end
end

count_occurrences(vehicles)
```

# Reverse It 1
Input: string
Output: New string with word order reversed (words are still correct)

Turn string into array with each word as an element. Reverse array order, turn array back into a string.

```ruby
def reverse_sentence(str)
    str.split.reverse.join(" ")
end
```

# Reverse It 2
Input: string
Output: New string
Modification: if word has 5+ chars reverse the original word else leave.
Notes: Space included if more than word

```ruby
def reverse_words(str)
    words = str.split.each do |word|
        word.reverse! if word.length >= 5
    end
    words.join(" ")
end
```

# Stringy Strings
Input: positive integer
Outout: String of alternatining 1s and 0s, same length of given integer
Notes: Must start with 1

Initialise an empty string as a new variable.
number.times with a block
if counter 0 or even return 1, if counter is odd, return 0
append digit to new string variable as a string

```ruby
#first go
def stringy(num)
    numbers = ''
    num.times do |i|
        if i%2 == 0
            numbers << '1'
        else
            numbers << '0'
        end
    end
    numbers
end
# numbers are correct but test returns false.
# needed to change `numbers` at end to `numbers.to_s`

def stringy(num)
    numbers = ''
    num.times do |i|
        number = i.even? ? 1:0
        numbers << number.to_s
    end
    numbers
end
```

# Array Average
Input: array of ints (will always be full and alwats ints)
Output: Integer which is average of array

take array and measure length. Sum all the numbers in the array. Divide the result by the length of the array.

```ruby
def average(arr)
    arr.sum.div(arr.size)
end

def average_float(arr)
    arr.sum.fdiv(arr.size)
end

```

# Sum of Digits
Input: positive integer
Output: sun of the integer's digits

Take number and split it into its digits. Add the digits together

```ruby
def sum(num)
    num.digits.sum
end
```

# What's my bonus?
Input: positive integer and a boolean
Output: An integer, which is either half the given integer if bool is true, or 0 if false

If Bool is True, divide num by 2 and return
If bool is false, return 0

```ruby
def calculate_bonus(num, bool)
    bool ? num.div(2):0
end

```