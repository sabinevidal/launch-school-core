# Rotation 1
```ruby
def rotate_array(arr)
  new_arr = arr.dup
	new_arr.push(new_arr.shift)
end
# or
def rotate_array(array)
  array[1..-1] + [array[0]]
end
```

# Rotation 2
## Breakdown problem
- rotate the last `n` digits of a number
### Points to remember
- rotating 1 digit returns original number
- assume `n` is always positive
## Examples

Input: (735291, 1) -> Output: 735291
Input: (735291, 3) -> Output: 735912

## Process - high-level
Approach
- to return the last `n` digits of a num, need to convert to array
  - arr[-n..-1]
1. Convert num to array
2. get last `n` digits
  - arr[-n..-1]
  - pass to `rotate_array`
3. Add rotated array to end of original num array
3. convert back to num and return
## Code
```ruby
def rotate_rightmost_digits(num, n)
  all_digits = num.digits.reverse
  end_num = rotate_array(all_digits[-n..-1])
  (num = all_digits[0..-(n+1)] + end_num).join.to_i
end
```

## Refactor
Simplify
```ruby
def rotate_rightmost_digits(num, n)
  all_digits = num.digits.reverse
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end
```

# Rotation 3
## Breakdown problem
- rotating until you can't anymore
- rotate to left, then first digit fixed, rotate the remaining digits to the left
  - keep first 2 digits fixed and rotate the remaining digits to the left
  - etc until all digits would be 'fixed'
### Points to remember
- don't need to wory about multiple 00s as they'll be dropped
## Examples

Input: 735291 -> 352917 -> 329175 -> 321759 -> 321597 -> Output: 321579
  - 6 digits, 5 iterations
rotate_rightmost_digits(735291, 6) => 352917
rotate_rightmost_digits(352917, 5) => 329175
rotate_rightmost_digits(329175, 5) => 321759
rotate_rightmost_digits(321759, 3) => 321597
rotate_rightmost_digits(321597, 2) => 321579
## Process - high-level
Approach
Using rotate_rightmost_digits, start with max `n`, each iteration decrease `n` until 2
  - `num` passed to `rotate_rightmost_digits` is the previous iteration result
1. get array of digits size = n
2. Loop, with a counter starting at n
  - assign num to the return value of rotate_rightmost_digits
  - decrement counter
  - break when counter is 1
## Code
```ruby
def max_rotation(num)
  n = num.digits.size
  while n > 1
    num = rotate_rightmost_digits(num, n)
    n -= 1
  end
  num
end
```

## Refactor
Preserve zeros
- need to change `rotate_rightmost_digits` to use chars instead of digits
```ruby

def rotate_rightmost_digits(num, n)
  all_digits = num.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join
end

def max_rotation(num)
  n = num.digits.size
  while n > 1
    num = rotate_rightmost_digits(num, n)
    n -= 1
  end
  num
end
```

# 1000 Lights
## Breakdown problem
- numbers 1 to `n` all toggled 'off'
- loop through `n` times
  - first loop all toggled 'on'
  - second, every 2nd is toggled
  - third, every 3rd is toggled
  - nth, every nth is toggled
- input one argument (`n` the number of switches)
- returns an array identifying which lights are 'on' after `n` repitions

### Points to remember

## Examples

Input: 5 -> Output: [1, 4]
 [0, 0, 0, 0, 0] -> [1, 1, 1, 1, 1] -> [1, 0, 1, 0, 1]
Input: 10 -> Output: [1, 4, 9]

## Process - high-level
Approach
Add digit key (light) with `on`, on the first iteration (ie turning it on the first time)
1. Create empty hash with default as `off`
2. start loop `1.upto(n) do |light|`
  - set every `n` value to the opposite of it's current setting ie on => off, off => on
    - `.step` doesn't work as it starts from 0
3. return keys which have values that are 'on'
## Code
```ruby
def initiate_lights(n)
  lights = {}
  1.upto(n) {|light| lights[light] = 'off'}
  lights
end

def toggle_every_nth_light(lights, nth)
  lights.each do |light, toggle|
    if light % nth == 0
      lights[light] = (toggle == 'off') ? 'on' : 'off'
    end
  end
end

def lights_on(lights)
  lights.select {|_, toggle| toggle == 'on'}.keys
end

def lights(n)
  lights = initiate_lights(n)
  1.upto(n) do |nth|
      toggle_every_nth_light(lights, nth)
  end
  lights_on(lights)
end
```

# Diamonds
## Breakdown problem
- displays a 4-pointed diamond in an `n` x `n` grid
- `n` is an odd integer supplied as argument
- `n` number of rows
  - start and end with 1 *
  - max centre point is `n`
### Points to remember
- assume will always be odd
## Examples

Input: 3 -> Output: *
                   ***
                    *

Input: 3 -> Output:     *
                       ***
                      *****
                     *******
                    *********
                     *******
                      *****
                       ***
                        *

## Process - high-level
Approach
1. loop
2. starting at 1 star in the centre and n-1 spaces/2 on each side
  - next will be +2(`x`) stars in centre and `n-x` spaces/2 on each side
    - until `x = n`
  - then repeat pattern in reverse until 1 star

- adding 2 stars until reaching `n` stars, then minus 2 stars until 1 star
## Code
```ruby
def diamond(n)
  x = 1
  star = "*"
  space = " "
  loop do
    puts (space * ((n-x)/2)) + (star * x)
    break if x == 9
    x += 2
  end
  loop do
    puts (space * ((n-x)/2)) + (star * x)
    break if x == 1
    x -= 2
  end
end
```
## Refactor
Streamline
```ruby
def print_row(n, x)
  star = "*"
  space = " "
  puts (space * ((n-x)/2)) + (star * x)
end

def diamond(n)
  (1...n).step(2) do |y|
     print_row(n, y)
  end
  n.step(1, -2) do |y|
     print_row(n, y)
  end
end
```
Empty diamond
- row 1: no spaces
- row 2: 1 space
- row 3: 3 spaces
- etc: +2 spaces
- same spaces, 1 star, space  , 1 star
```ruby
def print_row(n, x)
  star = "*"
  space = " "
  if x == 1
    puts (space * ((n-1)/2)) + star
  else
    puts (space * ((n-x)/2)) + star + (space * (x - 2)) + star
  end
end

def diamond(n)
  (1...n).step(2) do |y|
     print_row(n, y)
  end
  n.step(1, -2) do |y|
     print_row(n, y)
  end
end
```

# Stack Machine Interpretation
## Breakdown problem
- stack-and-register programming language: uses a stack of values
  - each operation in the language operates on a register ie current value
    - register is NOT part of stack
  - 
### Points to remember
- initialise register as 0
## Examples

Input:  -> Output:

## Process - high-level
Approach
1.
## Code
```ruby
def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'    then register += stack.pop
    when 'DIV'    then register /= stack.pop
    when 'MULT'   then register *= stack.pop
    when 'MOD'    then register %= stack.pop
    when 'SUB'    then register -= stack.pop
    when 'PUSH'   then stack.push(register)
    when 'POP'    then register = stack.pop
    when 'PRINT'  then puts register
    else             register = token.to_i
    end
  end
end
```

# Word to Digit
## Breakdown problem
- input sentence string as input
  - with numbers written out
    -  'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
- return same string with numbers as digits (still string)
  - '0 1 2 ...'
### Points to remember
- same string, but converted digits - mutating
## Examples

Input: 'five five five one two three four. Thanks.' -> Output: '5 5 5 1 2 3 4. Thanks.'

## Process - high-level
Approach: loop through hash of string => digit use #gsub (uses regex pattern) /\b#{foo}\b/
1. Each 
2. pass the key as the pattern and [value] as replacement for #gsub
## Code
```ruby
DIGIT_HASH = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9' }
def word_to_digit(str)
  DIGIT_HASH.each do |word, digit|
    str.gsub!(/\b#{word}\b/, digit)
  end
  str
end
```


# Fibonacci Numbers (Recursion)
## Breakdown problem
- recursive mehod that computes the nth Fibon number
- nth is argument
### Points to remember
- sequence of numbers starting with 1, 1
- each number is the sum of the previous 2
- naturally trnslates to 'recursive' methods
  - method calls itself
    1. calls themselves at least once
    2. have a condition that stops the recursion
    3. use the result returned by themselves
## Examples

Input: 1 -> Output: 1
Input: 5 -> Output: 5
Input: 12 -> Output: 144

## Process - high-level
Approach: start with 1 as the first 2 return values as it's a given, then recursion from that
F(n) = F(n - 1) + F(n - 2) where n > 2
1. return 1 if nth is 1 or 2
2. Use mathematical sequence with recursion ^^
## Code
```ruby
def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end
```


# Fibonacci Numbers (Procedural)
## Breakdown problem
- fibo without recursion
### Points to remember

## Examples

Input: 20 -> Output: 6765
Input: 1 -> Output: 1

## Process - high-level
Approach: return 1 if nth is 2 or under
1. keep counter of last 2 numbers
2. loop up to nth
  - reassign former num to latter, and latter to former + latter
    - use multiple-assignment syntax
3. return last
## Code
```ruby
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end
  last
end
```


# Fibonacci Numbers (Last Digit)
## Breakdown problem
- return last digit of the nth fibonacci number
### Points to remember

## Examples

Input:  -> Output:

## Process - high-level
Approach
1. get last fibo num from fibo method, turn into array of digits, return last digit
## Code
```ruby
def fibonacci_last(nth)
  fibonacci(nth).digits.reverse[-1]
end
```

# Study Session Problem
Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

## Breakdown problem
 - input array of n positive integers, and a positive integer (s)
 - find minimal length of a contiguous subarray of which sum is greater than s
    - else return 0 if isn't one
 - subarrays where the sum of the ints is equal to bigger than s
 - what is the length of the 'shortest' possible subarray which has a sum >= s

### Points to remember
 - contiguous - numbers must be next to each other in the main array

## Examples

Input: [2,3,1,2,4,3], 7 -> [4 + 3], [2 + 3 + 1 + 2], etc -> Output: 2
Input: [1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280 -> [100 + 1 + 0 + 200], [200 + 3 + 2 + 1 +250]  -> Output: 4
Input: [1, 2, 4], 8  -> 1+2+4 = 7 -> Output: 0

## Process - high-level
Approach: need to loop through possible subarrays and add up ints and check if sum is greater than s. Then find the shortest one. Check if sum of original array is smaller than s => return 0
1. loop through array creating subarrays
    - starting from index 0
    - add each int to a temp_subarray, sum together and check sum
      - if sum is greater than s, get length  
      - check if length is smaller than current min_length variable, and update it
      - break if min_length is 1 (as no smaller possiblitities)
    - once if 

2. Get all possible sub arrays
  - get all subarrays with sum greater than s
  - find the shortest subarray

## Code
```ruby
def minSubLength(arr, s)
  all_subs = find_all_subarrays(arr)
  greater = find_greater_than(all_subs, num)
  find_min_length(greater)
end

def find_all_subarrays(arr)
  result = []

  i = 0
  while i < arr.length
    j = i
    while j < arr.length
      subarr = arr[i..j]       # array from arr index i to index i (eg arr[0..0] arr[0..1], THEN arr[1..1], arr[1..2]. THEN arr[2..2], arr[2..3] etc)
      result << subarr
      j += 1
    end
    i += 1
  end
  result
end

def find_greater_than(arr, target)
  arr.select {|sub| sub.sum >= target }
end

def find_min_length(arr)
  return 0 if arr.empty?

  arr.map {|sub| sub.length }.min   # create a new array with map of the subarrays lengths, then get min one
end
```

## Tests
p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0