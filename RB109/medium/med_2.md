# Longest Sentence
## Breakdown problem
- Take text file and run program
- seperate the text into sentences ending with `.`, `!` or `?`
- find the longest sentence and print the longest sentence with its length

### Points to remember
- `sentences = text.split(/\.|\?|!/)`
## Examples

Input:  -> Output:

## Process - high-level
Approach: Read file, split into sentences and order by length
1.
## Code
```ruby
text = File.read(sample_text.txt)
sentences = text.split(/\.|\?|!/) 
longest_sentence = sentences.max { |sentence| sentence.size}
puts longest_sentence.strip
puts "Length: #{longest_sentence.split.size} words"
```

# Now I know my ABCs
## Breakdown problem
- Input a word
- check if word can be spelled with letters from given spelling blocks
- can only use one letter from each block
    - ie, B:O means word can either have a B or an O, not both.
- retun true or false
### Points to remember
- blocks can only be used once
- case is not important
## Examples

Input: 'BATCH' -> Output: true
Input: 'BUTCH' -> Output: false
Input: 'jest' -> Output: true

## Process - high-level
Approach: 
- Spelling block options as an array of strings
- Check for the letters in word (upcase word)
    - check if the word includes more than 1 of the 2 letters
        - use #none to check if there are no letters in the pairs that appear than once.

## Code
```ruby
SPELLING_BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)
def block_word?(word)
    up_string = word.upcase
    SPELLING_BLOCKS.none? { |letters| up_string.count(letters) >= 2 }
end

```


# Lettecase Percentage Ratio
## Breakdown problem
- input string
- return hash with 3 entries
    - lowercase, uppercase, neither
    - percentage of chars in string that are each
### Points to remember

## Examples

Input:  -> Output:

## Process - high-level
Approach
1.
## Code
```ruby
def letter_percentages(str)
    chars = str.chars
    hsh = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
    hsh[:lowercase] = chars.count { |char| char =~ /[a-z]/ }.to_f * 100/ chars.size
    hsh[:uppercase] = chars.count { |char| char =~ /[A-Z]/ }.to_f * 100/ chars.size
    hsh[:neither] = chars.count { |char| char =~ /[^A-Za-z]/ }.to_f * 100/ chars.size
    hsh
end
```

## Refactor
```ruby
def letter_percentages(str)
    chars = str.chars
    hsh = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
    hsh[:lowercase] = (chars.count { |char| char =~ /[a-z]/ }.to_f * 100/ chars.size).round(2)
    hsh[:uppercase] = (chars.count { |char| char =~ /[A-Z]/ }.to_f * 100/ chars.size).round(2)
    hsh[:neither] = (chars.count { |char| char =~ /[^A-Za-z]/ }.to_f * 100/ chars.size).round(2)
    hsh
end


```

# Matching Parentheses
## Breakdown problem
- input string
- return true if all parantheses in str are balanced
    - balanced: parantheses with matching pairs
### Points to remember
- correct order `( )`
## Examples

Input: 'What (is) this?' -> Output: true
Input: 'What is) this?' -> Output: false

## Process - high-level
Approach: Isolate parantheses in correct order
To test for balance: +1 or -1, balanced would == 0
BUT: `)(` - `0 - 1  + 1 == 0` - so needs to break if it goes negative


## Code
```ruby
def balanced?(str)
  balance = 0
  str.each_char do |char|
    balance += 1 if char == '('
    balance -= 1 if char == ')'
    break if balance < 0
  end

  balance.zero?
end
```


# Triangle Sides
## Breakdown problem
- input 3 ints
- check if equilateral, isosceles or scalene triangle. or invalid
- reeturn symbol
### Points to remember
- to be a triangle: sum of the 2 shortest sides must be > than length of longest side
    - all sides must be greater than 0
- equi: all sides are the same
- isosceles: 2 sides equal, 3rd is different
- scalene: all sides are different
## Examples

Input: 3, 3, 3 -> Output: :equilateral
Input: 3, 1, 1 -> Output: :invalid

## Process - high-level
Approach: Test if meets triangle criteria, then test what triangle
    - test if sides are the same use #uniq
    - test if only 2 sides are same

## Code
```ruby
def triangle?(sides)
    return false if sides.any?(0)
    shortest_two_sides = sides.sort[0, 2]
    longest_side = sides.sort[-1]
    return false if shortest_two_sides.sum <  longest_side
    true
end

def triangle_type(sides)
    return :equilateral if sides.uniq.size <= 1
    return :isosceles if sides.uniq.size <= 2
    return :scalene
end

def triangle(side1, side2, side3)
    sides = [side1, side2, side3]
    return :invalid if !triangle?(sides)
    triangle_type(sides)
end
```


# Tri-angles
## Breakdown problem
- take 3 angles of a triangle
- check if  valid triangle
- check if acute, right, or obtuse
### Points to remember
- triangle: all angles must be grater than 0
    - sum of angle must be exactly 180 degrees
- right: one angle is 90 degrees
- acute: all 3 angles are less than 90 degrees
- one angle is greater than 90 degrees

## Examples

Input: 60, 70, 50 -> Output: :acute
Input: 0, 90, 90 -> Output: :invalid

## Process - high-level
Approach: First check if valid triangle, then check what type
    - right, check one is == 90
    - acute, all are < 90
    - obtuse: one angle > 90
1.
## Code
```ruby
def triangle?(angles)
    return false if angles.any?(0)
    return true if angles.sum == 180
    false
end

def triangle_type(angles)
    case
    when angles.one?(90)
        :right
    when angles.all? {|angle| angle < 90 }
        :acute
    else
        :obtuse
    end
end

def triangle(angle1, angle2, angle3)
    angles = [angle1, angle2, angle3]
    return :invalid if !triangle?(angles)
    triangle_type(angles)
end
```

# Unlucky Days
## Breakdown problem
- return the number of Friday the 13ths in a year
- input year
### Points to remember
- assumer year is greater than 1752
## Examples

Input: 2015 -> Output: 3

## Process - high-level
Approach: use `Date`
- loop through all the months in the year
- use `#friday?` to check if the 13th lands on a Friday
- use counter to keep track of true returns ^^

## Code
```ruby
require 'date'
def friday_13th(year)
    friday_13ths = 0
    1.upto(12) do |month|
        date = Date.civil(year, month, 13)
        friday_13ths += 1 if date.friday?
    end
    friday_13ths
end
```


# Next featured
## Breakdown problem
- featured number: odd num
    - multiple of 7
    - digits occur exactly once each
- input a single int
- return the next greater featured number
- or error message if no featured num

### Points to remember
error `# -> There is no possible number that fulfills those requirements`
- given num isn't always a multiple of 7
## Examples
- 49 is
    - 98 is not odd
    - 97 is not a multiple of 7
    - 133 has the digit 3 twice

Input: 12 -> Output: 21

## Process - high-level
Approach:
- loop through multiples of 7
- starting from first multiple greater then given num
    - check if it meets the requirements and return
        - else go to next one

## Code
```ruby
def featured?(num)
    return false if num.even?
    return false if num.digits.uniq != num.digits
    true
end

def featured(num)
    multiple = 0
    loop do
        multiple +=7
        break if multiple >= 9_876_543_210
        return multiple if multiple > num && featured?(multiple)
    end
    puts "-> There is no possible number that fulfills those requirements"
end
```


# Bubble sort
## Breakdown problem
- sorting algorithm
- make multiple iterations thorugh an array
- on each iteration, each pair of consecutive elements is compared
    - if the first element is greater than the second then the 2 are swapped
- repeated until a complete iteration is made without any swaps being performed.
- input an array
- return sorted array
### Points to remember
- mutating
- a <=> b
    - -1 a less than b
    - 0 same
    - +1 a greater than b
-
## Examples

Input: [6, 2, 7, 1, 4] -> Output: [1, 2, 4, 6, 7]
Input: %w(Sue Pete Alice Tyler Rachel Kim Bonnie) -> Output: %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

## Process - high-level
Approach
- Use `>`
- parallel assignment syntax to swap using index position if needed
- loop array until a condition is met
    - condition to indicate that no swaps happened
        - `swapped = false` changes to `swapped = true` if swap happens
- loop through array comparing the 2 elements
    - swap if needed and change `swapped`
    - use `#upto` as array will mutate so can't iterate actual array
## Code
```ruby
def bubble_sort!(array)
    loop do
        swapped = false
        1.upto(array.size - 1) do |index|
            if array[index - 1] > array[index]
                array[index - 1], array[index] = array[index], array[index - 1]
                swapped = true
            end
        end
        break unless swapped
    end
end
```

## Refactor
Optimised
```ruby
def bubble_sort!(array)
    unsorted_to_index = array.size - 1
    loop do
        swapped = false
        unsorted_to_index.times do |index|
            if array[index] > array[index + 1]
                array[index], array[index + 1] = array[index + 1], array[index]
                swapped = true
            end
        end
        unsorted_to_index -=1
        break unless swapped
    end
end
```


# Sum Square
## Breakdown problem
- compute difference between the square of the sum of the first `n` positive integers
    - vs sum of the squares of the first `n` positive intefers
### Points to remember

## Examples

Input: 3 -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2) -> Output: 22

## Process - high-level
Approach
- get all integers in an array
- 2 variables each assigned to the return value of helper methods
- get difference between the variables
## Code
```ruby
def square_of_sum(integers)
    (integers.sum)**2
end

def sum_of_squares(integers)
    integers.map { |int| int **2 }.sum
end

def sum_square_difference(n)
    integers = []
    1.upto(n) {|int| integers << int }
    square_sum_result = square_of_sum(integers)
    sum_square_result = sum_of_squares(integers)
    result = square_sum_result - sum_square_result
end
```
## Refactor

```ruby
def sum_square_difference(n)
    sum = 0
    sum_of_squares = 0

    1.upto(n) do |int|
        sum += value
        sum_of_squares += value**2
    end

    sum**2 - sum_of_squares
end
```
