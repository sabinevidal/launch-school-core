# Sum of Sums
## Breakdown problem
- Takes an array of numbers
- Returns the sum of the sums of each leading subsequence for the array
### Points to remember
- Array will always have at least 1 number
## Examples

Input: [3, 5, 2] -> (3) + (3 + 5) + (3 + 5 + 2) -> Output: 21
Input: [1, 5, 7, 3] -> (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) -> Output: 36
Input: [2, 2] -> (2) + (2 + 2) -> Output: 6

## Process - high-level
Approach
1. Iterate through array
2. Each iteration add the current element to the numbers in all the previous 

## Code
```
def sum_of_sums(arr)
    sum = 0
    accum = 0
    arr.each do |num|
        accum += num
        sum += accum
    end
    sum
end
```

# Madlibs
## Breakdown problem
- prompt for noun, verb, adverb and adjective
- Inject each word into a story
### Points to remember
- program not a method
## Examples

Input:  -> Output:
Input:  -> Output:

## Process - high-level
Approach
1. prompt for each word and assign to variable
2. Return a random sentence with the variables

## Code
```
puts "Enter a noun:"
noun = gets.chomp

puts "Enter a verb:"
verb = gets.chomp

puts "Enter an adjective:"
adjective = gets.chomp

puts "Enter an adverb:"
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample
```

# Leading Substrings
## Breakdown problem
- string input
- returns a list of all substrings possible starting from beginning of string
- order from shortest to longest
### Points to remember

## Examples

Input: 'abc' -> Output: ['a', 'ab', 'abc']
Input: 'xyzzy' -> Output: ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

## Process - high-level
Approach
1. initiate Array and accumulator
2. Iterate over string chars with #each
3. Add each substring to the array and concat to accumulator

## Code
```
def leading_substrings(str)
    arr = []
    accum = ''
    str.chars.each do |char|
        accum += char
        arr.push(accum)
    end
    arr
end
```

# All Substrings
## Breakdown problem
- input string
- returns list of all substrings of a string
- ordered by where in the string the substring begins
### Points to remember
- substrings in same order as string ie substrings will never have the exact same chars no matter the order
## Examples

Input: 'abcde' -> Output: [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
Input: 'dac' -> Output: [
    'd', 'da', 'dac',
    'a', 'ac',
    'c'
]

## Process - high-level
Approach
1. Iterate through string using the index
    - Pass the string into the leading_substring method
    - Remove the first char
2. Return

## Code
```
def leading_substrings(str)
    arr = []
    accum = ''
    str.chars.each do |char|
        accum += char
        arr.push(accum)
    end
    arr
end

def substrings(str)
    result = []
    str.chars.each_with_index do |char, i|
        result += leading_substrings(str)
        str.delete_prefix!(char)
    end
    result
end
```

# Palindromic Substrings
## Breakdown problem
- return a list of all substrings of a stiring that are palindromic
    - each substring must contain the same sequence of characters forwards and backwards
- return value arranged in same sequence as the substrings appear in the string
- duplicate palindromes should be included
### Points to remember
- use substring method
- consider all characters and pay attention to case ("AbcbA" not "Abc-bA")
## Examples

Input: 'abcd' -> Output: []
Input: 'madam' -> Output: ['madam', 'ada']
Input: 'hello-madam-did-madam-goodbye' -> Output: [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]

## Process - high-level
Approach
1. Test for palindrome
2. run string through substrings method and then pass to palindrome test to determine result
3. add to new array

## Code
```
def palindrome?(str)
  str == str.reverse && str.size > 1
end

def palindromes(str)
  new_arr = []
  substrings = substrings(str)
  substrings.each do |substr|
    new_arr << substr if palindrome?(substr) 
  end
  new_arr
end
```

# fizzbuzz
## Breakdown problem
- 2 arguments:
    - starting number
    - ending number
- print all numbers betweent the two
- EXCEPT: if number is divisible by 3 - then 'Fizz"
    - if num divisible by 5 - "Buzz"
    - if num divisibile by 3 and 5, then "FizzBuzz"
### Points to remember

## Examples

Input: 1, 15 -> Output: 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

## Process - high-level
Approach
1. Range of numbers
2. Pass through if/else to check divisibility
3. Add to list
4. format and then print

## Code
```
def fizzbuzz(start_num, end_num)
  result = []
  (start_num.. end_num).each do |num|
    if num % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 5 == 0
      result << "Buzz"
    elsif num % 3 == 0
      result << "Fizz"
    else
      result << num
    end
  end
  result.join(', ')
end
```

# Double Char 1
## Breakdown problem
- takes a string
- returns new string with every char doubled
### Points to remember
- cases stay same
- non-alpha also doubled
- empty returns empty
## Examples

Input: 'Hello' -> Output: "HHeelllloo"
Input: "Good job!" -> Output: "GGoooodd  jjoobb!!"

## Process - high-level
Approach
1. Create new array
2. Split string into chars
3. Iterate through, adding the char x2 to the new array
4. join into string

## Code
```
def repeater(str)
  new_arr = []
  str.chars.map do |char|
    new_arr << char * 2
  end
  new_arr.join
end
```

## Refactor
without new array
```
def repeater(str)
  result = ''
  str.each_char do |char|
    result << char * 2
  end
  result
end
```

# Double char 2
## Breakdown problem
- input string
- return new string with every consonant character doubled
    - vowels, digits, punctuation and whitespace NOT doubled
### Points to remember

## Examples

Input: "Hello-World!" -> Output: "HHellllo-WWorrlldd!"
Input: "July 4th" -> Output: "JJullyy 4tthh"

## Process - high-level
Approach
1.
2.

## Code
```
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
def double_consonants(str)
  result = ''
  str.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end
```

# Reverse the Digits In a Number
## Breakdown problem
- input a positive num
- return num with digits reversed
### Points to remember
- Don't worry about leading numbers - Ruby sees the m as octal numbers
## Examples

Input: 12345 -> Output: 54321
Input: 12000 -> Output: 21

## Process - high-level
Approach
1. Split num into array of digits
2. Reverse array
3. Transform back into it .join.to_i

## Code
```
def reversed_number(int)
    int.digits.join.to_i
end
```

# Get the Middle Character
## Breakdown problem
- input non-empty string
- return middle-char or chars of the argument
    - odd length => 1 char
    - even length => 2 chars
### Points to remember
- spaces count
## Examples

Input: 'I love ruby' -> Output: 'e'
Input: 'Launch School' -> Output: ' '
Input: 'Launch' -> Output: 'un'

## Process - high-level
Approach
1. Calculate length
    - calculate mid
2. splice str
    - if odd: str[mid] (0 indexed array)
    - if even: str[mid-1, 2]

## Code
```
def center_of(str)
    mid = str.size / 2
    if str.size.odd?
        str[mid]
    else
        str[mid-1, 2]
    end
end
```