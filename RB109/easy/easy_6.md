# Cute Angles
## Breakdown problem
- Method that takes a float representing an angle (0-360)
- Returns a sring that represents the angle in degrees, minutes and seconds
### Points to remember
- use °(degrees), '(mins) and "(secs)
- Degree has 60 minutes, mintute has 60 secs
- use 2 digit numbers with leading zeros for formatting minutes and seconds

## Examples

Input: 30  -> Output: %(30°00'00")
Input: 76.73  -> Output: %(76°43'48")
Input: 254.6  -> Output: %(254°36'00")
Input: 360  -> Output: %(360°00'00") || %(0°00'00")

## Process - high-level
Approach
1. Take the whole number out of the float and assign it to the degree part of the string
2. Minutes = decimal * 60
3. Seconds = (decimal - minutes/60) * 3600

## Tests
method('input') == 'output'

## Pseudocode


## Code
```ruby
DEGREE = "\xC2\xB0"

def dms(flt)
    degree = flt.to_i
    decimal = flt - degree.to_f
    minute = decimal * 60
    second = (minute - minute.to_i) * 60
    format(%(#{degree}#{DEGREE}%02d'%02d"), minute, second)
end
```

## Refactor and clean
Using `divmod` and accounting for -+360 degrees
```ruby
DEGREE = "\xC2\xB0"

def dms(flt)
    flt = flt%360 if flt < 0 || flt > 360
    degree = flt.to_i
    decimal = flt - degree.to_f
    minute = decimal * 60
    second = (minute - minute.to_i) * 60
    format(%(#{degree}#{DEGREE}%02d'%02d"), minute, second)
end
```


# Delete Vowels
## Breakdown problem
- Takes array of strings
- returns an array of same string value but with no vowels
### Points to remember
- same string values - so destructive
- account for upper/lowercase
- return an empty string if all vowels gone
## Examples

Input: %w(abcdefghijklmnopqrstuvwxyz) -> Output: %w(bcdfghjklmnpqrstvwxyz)
Input: %w(ABC AEIOU XYZ)  -> Output: ['BC', '', 'XYZ']

## Process - high-level
Approach
1. Iterate through array
2. Delete all instances of vowels in each string

## Tests
method('input') == 'output'

## Pseudocode

## Code
```
def remove_vowels(arr)
    arr.map do |str|
        str.delete!('aeiouAEIOU')
    end
end
```
## Refactor and clean
```
def remove_vowels(arr)
    arr.map { |str| str.delete!('aeiouAEIOU') }
end
```

# Fibonacci Number
## Breakdown problem
- int given is the number of digits
- return index of the first fibonacci number which has the number of digits specified

### Points to remember
- first 1 is index 1, second 1 is index 2
- argument will always be greater than or EQUAL to 2
    - Have exit point at 2

## Examples

Input: 2  -> Output: 7   # 1 1 2 3 5 8 13
Input: 3  -> Output: 12  # 1 1 2 3 5 8 13 21 34 55 89 144

## Process - high-level
Approach
1. Set first 2 fibo numbers (1 and 1), and index starting at 1
2. Start loop,
    - Increment index
    - set fibo to the sum of first 2 numbers
    - break if fibo digit count is the same as argument
    - reassign the variables for the first two numbers to the second number and the fibo number respectively
3. 
## Tests
method('input') == 'output'

## Code
```
def find_fibonacci_index_by_length(num)
    first = 1
    second = 1
    index = 2

    loop do
        index += 1
        fibo = first + second
        break if fibo.digits.size >= num

        first = second
        second = fibo
    end
    index
end

```

# Reversed Arrays 1
## Breakdown problem
- Takes an array and reverses it's elements
- Mutate the aray
- Return value should be the same
### Points to remember
- Can't use #reverse or #reverse!
## Examples

Input: [1,2,3,4] -> Output: [4, 3, 2, 1]
Input:  ['abc'] -> Output: ["abc"]

## Process - high-level
Approach
Using index assignment to re-assign the first with the last etc
1. Assign the variables left_index and right_index to 0 and -1 respectivly
2. Start loop, which will break when the halfway point is reached
    - using parallel assigment re-assign the let_index to the right_index and vv
    - increment both the left_index and right_index
    - break point: when left_index is half the size of the length of the arry

## Pseudocode

## Code
```
def reverse!(arr)
    left_index = 0
    right_index = -1

    until left_index >= arr.size / 2
        arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
        left_index += 1
        right_index -= 1
    end
    arr
end
```

# Reversed Arrays 2
## Breakdown problem
- Same as above, but NO modification

### Points to remember
- can't use prev approach

## Examples

Input: [1,2,3,4]  -> Output: [4,3,2,1]
Input: list = [1, 3, 2]  -> Output: list == [1, 3, 2] , new_list == [2, 3, 1]

## Process - high-level
Approach
Use #reverse_each
1. Create a new array
2. Use reverse_each to iterate over the given array and insert each element into the new array

## Code
```
def reverse(arr)
    new_arr = []
    arr.reverse_each { |el| new_arr << el}
    new_arr
end
```

# Combining Arrays
## Breakdown problem
- take 2 arrays
- returns 1 array that contains all the values from both the argument arrays
- no duplication of values
### Points to remember
- uniq

## Examples

Input: [1, 3, 5], [3, 6, 9]  -> Output: [1, 3, 5, 6, 9]

## Process - high-level
Approach:
Create new array and inject both arrays into it then run uniq
Iterate through the 2 arrays checking if the number exists else adding.
Add 2 arrays and then #uniq

## Code
```
def merge(arr1, arr2)
    (arr1 + arr2).uniq
end
```

# Halvsies
## Breakdown problem
- Array as an argument
- returns 2 arrays as a pair of nested arrays
- nested arras contain the first and second half of the original array
### Points to remember
- if odd number, middle element will be in the first array
## Examples

Input: [1, 2, 3, 4]  -> Output: [[1, 2], [3, 4]]
Input: [1, 5, 2, 4, 3] -> Output: [[1, 5, 2], [4, 3]]

## Process - high-level
Approach
Use #slice!
1. Set variable for new_arr
2. assign #slice! with range of start to half of length
2.
## Code
```ruby
def halvsies(arr)
    half = (arr.length/2.0).round
    new_arr = arr.slice!(0, half)
    [new_arr,arr]
end
```

# Find the Duplicate
## Breakdown problem
- given an unordered array where exactly one value occurs twice
- figure out which value is duplicated
- find and return duplicate value
### Points to remember

## Examples

Input: [1, 5, 3, 1]  -> Output: 1

## Process - high-level
Approach
Use #find, and check whether the count is greater than 1

## Code
```
def find_dup(arr)
    arr.find { |el| arr.count(el) > 1 }
end
```

# Does my list include this?
## Breakdown problem
- Takes an array and search value as arguments
- return true if search value is in array, else false
### Points to remember
- May not use #include?
- Must work with `nil` as a value
## Examples

Input: ([1,2,3,4,5], 3)  -> Output: true
Input: ([nil], nil)  -> Output: true

## Process - high-level
Approach
Use #find to check each element for the search value
1.
2.

## Code
```
def include?(arr, search)
    arr.find { |el| return true if el == search }
    false
end
```

# Right Triangles
## Breakdown problem
- takes a positive integer (`n`)
- Displays a right triangle whose sides are `n` stars *
- Diagonal is to the left and stright vertical is to the right
### Points to remember
- Stars and spaces must have count
- First row will have `1` stars and `n-1` spaces
- Second row will have `2` stars and `n-2` space
## Examples

Input: 5  -> Output:
    *
   **
  ***
 ****
*****

## Process - high-level
Approach
Use #times, starting from top row adding up
1. Set stars and spaces
2. num(vertical count) times puts spaces and stars
3. incremement spaces and stars
## Code
```
def triangle(num)
    stars = 1
    spaces = num - 1

    num.times do |n|
        puts (' ' * spaces) + ('*' * stars)
        stars += 1
        spaces -= 1
    end
end
```
