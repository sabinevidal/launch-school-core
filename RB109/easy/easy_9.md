# Welcome Stranger
## Breakdown problem
- 2 arguments: array and hash
    - array: 2+ elements which combined, make up a person's name
    - hash: keys: :title and :occupation
- returns a greeting using person's name and mentioning title and occupation
### Points to remember

## Examples

Input: ['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' } -> Output: => Hello, John Q Doe! Nice to have a Master Plumber around.

## Process - high-level
Approach
1. initiate variable for full name and assign it to the given array.join
2. Initiate a variable each for title and occupation
    - assign the relevant values
3. Return sentence using interpolation with the varibales

## Code
```
def greetings(name, status)
    name = name.join(' ')
    title = status[:title]
    occupation = status[:occupation]

    puts "=> Hello, #{name}! Nice to have a #{title} #{occupation} around."
end
```

## Refactor
Simplify
```
def greetings(name, status)
    "=> Hello, #{name.join(' ')}!\
    Nice to have a #{status[:title]} #{status[:occupation]} around."
end
```

# Double Doubles
## Breakdown problem
- if number is NOT a double number, return 2x the number
    - if double number, return as is
### Points to remember
- Double number: even number of digits, and left hand digits are same as right hand
## Examples
44, 3333, 103103, 7676
Input: 37 -> Output: 74
Input: 103103 -> Output: 103103
Input: 3333 -> Output: 3333

## Process - high-level
Approach
1. Double number test
    - look for left and right side of the number
        - find centre point
        - assign splice of int string to each relevant side
2. pass number into double number test, if true return number
    - if false, double the number and return

## Code
```
def twice(num)
    num_str = num.to_s
    mid = num_str.size / 2
    left_side = num_str[0..mid - 1]
    right_side = num_str[mid..-1]

    return num if left_side == right_side && num_str.size > 1
    return num * 2
end
```

# Always Return Negative
## Breakdown problem
- input number
- return negative version if positive number
- return original number if it's 0 or negative
### Points to remember

## Examples

Input: 5 -> Output: -5
Input: -3 -> Output: -3
Input: 0 -> Output: 0

## Process - high-level
Approach
1. Check if num is > 0
    - return num * -1
2. else return num * 1

## Code
```
def negative(num)
  num > 1 ? num * -1 : num
end
```

# Counting up
## Breakdown problem
- input integer
- return array of all integers
    - in sequence between 1 and the argument
### Points to remember
- assumer will always be valid
## Examples

Input: 5 -> Output: [1, 2, 3, 4, 5]
Input: 1 -> Output: [1]

## Process - high-level
Approach
1. #upto num, adding to new array

## Code
```
def sequence(num)
    arr = []
    1.upto(num) {|num| arr << num}
    arr
end
```

## Refactor
Simplify
```
def sequence(num)
    (1..num).to_a
end
```
negative numbers
```
def sequence(num)
    num > 0 ? (1..num).to_a : (num..-1).to_a
end
```

# Uppercase Check
## Breakdown problem
- input string
- return true if all alpha chars are uppercase, else false
### Points to remember
- ignore non-alpha cases
## Examples

Input: 't' -> Output: false
Input: 'FOUR SCORE' -> Output: true
Input: '4SCORE!' -> Output: true
Input: '' -> Output: true

## Process - high-level
Approach
#upcase doesn't affect non-alpha chars, so method would be true if str is same if it's been convereted to all uppercase

## Code
```
def uppercase?(str)
  str == str.upcase
end
```

# How long are you?
## Breakdown problem
- input string
- return array
    - contains every word from the string
        - appending a space and the word length
### Points to remember
- assume words in string are separated by one space
- any substring of non-space chars is a word
- don't alter array being iterated over
## Examples

Input: "cow sheep chicken" -> Output: ["cow 3", "sheep 5", "chicken 7"]
Input: "Supercalifragilisticexpialidocious" -> Output: ["Supercalifragilisticexpialidocious 34"]
Input:  -> Output:

## Process - high-level
Approach
1. #Split string into array
2. Iterate through array
    - get word size
    - concat " #{size}" to each substring

## Code
```
def word_lengths(str)
  substrings = str.split
  substrings.map do |substr|
    substr.concat(" #{substr.size}")
  end
  substrings
end
```

# Name Swapping
## Breakdown problem
- input single string: first name, a space, last name
- return single string: last name, a comma, a space, first name
### Points to remember

## Examples

Input: 'Joe Roberts' -> Output: 'Roberts, Joe'

## Process - high-level
Approach
1. Split str into array
2. reverse array order
3. Join array with (', ') into new string

## Code
```
def swap_name(name)
  name.split.reverse.join(', ')
end
```

# Sequence Count
## Breakdown problem
- input 2 integer arguments
    - count
    - first number in sequence
- return array that contains the count number of elements
    - elements are multiples of the starting number
### Points to remember
- count will always be >= 0
- starting num can be +/-
- if count is 0, empty list returned
## Examples

Input: (5, 1) -> Output: [1, 2, 3, 4, 5]
Input: (4, -7) -> Output: [-7, -14, -21, -28]
Input: (3, 0) -> Output: [0, 0, 0]

## Process - high-level
Approach
1. create new array
2. Iterate count.times
    - with an index starting at 1
3. Add result to new array
    - result = num * index

## Code
```
def sequence(count, num)
  arr = []
  count.times {|i| arr << num * (i+1)}
  arr
end
```

## Refactor
Using `#map` and `Range`
```
def sequence(count, num)
  (1..count).map { |i| num * i }
end
```


# Grade book
## Breakdown problem
- determine mean of 3 scores passed in
- retun the letter value associated with the grade
### Points to remember
- values between 0 - 100
## Examples

Input: 95, 90, 93 -> Output: "A"
Input: 50, 50, 95 -> Output: "D"

## Process - high-level
Approach
1. Work out average (add gades and divide by 3)
2. case statement to get letter grde using ranges

## Code
```
def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3)/3
  case average
  when 90..100 then 'A'
  when 80...90  then 'B'
  when 70...80  then 'C'
  when 60...70  then 'D'
  else              'F'

  end
end
```

## Refactor
Extra credit
```
def get_grade(grade1, grade2, grade3)
  average = (grade1 + grade2 + grade3)/3
  case average
  when 90..100 then 'A'
  when 80...90  then 'B'
  when 70...80  then 'C'
  when 60...70  then 'D'
  when 0...60   then 'F'
  else               'A+'
  end
end
```

# Grocery List
## Breakdown problem
- input array of arry of fruits with quantities
- return array duplicate fruit written out
### Points to remember

## Examples

Input: [["apples", 3], ["orange", 1], ["bananas", 2]] -> Output:  ["apples", "apples", "apples", "orange", "bananas","bananas"]

## Process - high-level
Approach
1. Create new array
2. Iterate through the arrays
    - grab the fruit name, then num.times add to the new array

## Code
```
def buy_fruit(fruits)
  grocery_list = []
  fruits.each do |fruit|
    fruit[1].times { |_| grocery_list << fruit[0] }
  end
  grocery_list
end
```

## Refactor
Using `#map` and one line
```
def buy_fruit(fruits)
  fruits.map {|fruit, quantity| [fruit] * quantity}.flatten
end
```

# Group Anagrams
## Breakdown problem
- input array
- print out groups of words that are anagrams
    - groups should be words using the same letters
### Points to remember
- program
## Examples

Input: ['demo', 'none', 'tied', 'evil', 'dome', 'mode',
        'live','fowl', 'veil', 'wolf', 'diet', 'vile', 'edit',
        'tide','flow', 'neon']
    -> Output: ["demo", "dome", "mode"]
               ["neon", "none"] #(etc)

## Process - high-level
Approach
1. create new hash object
2. iterate through the array
    - add current element as key to hash
    - select any of the other elements have the same chars
        - use `wrd.chars.sort == word.chars.sort`
    - add as values to key
2. Each iteration check if word is already in hash object values
3. print the values (which are already in arrays)

'demo' => ['demo', 'dome', 'mode']

## Code
```
result = {}

words.each do |word|
    if result.values.flatten.include?(word) == false
        values = words.select do |wrd|
            wrd.chars.sort == word.chars.sort
        end
        result[word] = values
    end
end

result.each_value do |v|
    p v
end
```
