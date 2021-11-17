# Combine 2 lists
## Breakdown problem
- combines 2 arrays
- returns a new array containing all elements from both arrays
    - with elements alternating
### Points to remember
- arrays will have same number of elements
## Examples
Input: [1, 2, 3], ['a', 'b', 'c'] -> Output: [1, 'a', 2, 'b', 3, 'c']

## Process - high-level
Approach
Using index of each array, alternating
1. Iterate over arrays using #each_index going from index to index
2. Add element from each array at the current index to new array

## Code
```
def interleave(arr1, arr2)
    new_arr = []
    arr1.each_index do |i|
        new_arr << arr1[i] << arr2[i]
    end
    new_arr
end
```

## Refactor with #zip
```
def interleave(arr1, arr2)
    new_arr = arr1.zip(arr2).flatten
end
```

# Lettercase Counter
## Breakdown problem
- takes a string
- returns a hash
- hash contains 3 entries:
    - number of lowercase characters in string
    - number of uppercase characters in string
    - number of characters which are neither
### Points to remember
- space counts as a 'neither' character
## Examples

Input: 'abCdef 123' -> Output: { lowercase: 5, uppercase: 1, neither: 4 }
Input: 'AbCd +Ef' -> Output: { lowercase: 3, uppercase: 3, neither: 2 }

## Process - high-level
Approach
Use string#chars and array#count
1. Separate string into chars
2. Create new hash with the 3 entries, each with 0 value
3. set each key's value with the relevant return value from count

## Code
```
UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a
def letter_case_count(str)
    arr = str.chars
    hsh = { lowercase: 0, uppercase: 0, neither: 0 }
    hsh[:lowercase] = arr.count { |char| LOWERCASE_CHARS.any?(char) }
    hsh[:uppercase] = arr.count { |char| UPPERCASE_CHARS.any?(char) }
    hsh[:neither] = arr.count - (hsh[:lowercase] + hsh[:uppercase])
    hsh
end
```

# Capitialise words
## Breakdown problem
- Takes a string
- returns new string
- with original argument, but with first character in each word capitalised and others lowercase
### Points to remember
- "" quoted words aren't capitalised - so only first character (whether it's punctuation or letters)
## Examples

Input: 'four score and seven' -> Output: 'Four Score And Seven'
Input: 'this is a "quoted" word' -> Output: 'This Is A "quoted" Word'

## Process - high-level
Approach
1. Split string into substrings
2. #Capitalise each substring
3. join together into a string again

## Code
```
def word_cap(str)
    substrings = str.split
    substrings.map do |substr|
        substr.capitalize!
    end
    new_str = substrings.join(" ")
end
```

## Refactor
More succinct with syntactical sugar
```
def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end
```

# Swap Case
## Breakdown problem
- Takes a string
- Returns a new string
    - Every uppercase letter is replaced with lowercase and vice versa
### Points to remember
- may NOT use #swapcase
## Examples

Input: 'CamelCase' -> Output: 'cAMELcASE'
Input: 'Tonight on XYZ-TV' -> Output: 'tONIGHT ON xyz-tv'

## Process - high-level
Approach
1. Iterate through #each_char
2. If upcase make downcse and vv else pass

## Code
```
UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a
def swapcase(str)
    chars = str.chars
    new_str = ""
    chars.map do |char|
        if UPPERCASE_CHARS.any?(char)
            char.downcase!
        elsif LOWERCASE_CHARS.any?(char)
            char.upcase!
        end
        new_str << char
    end
    new_str
end
```

# Staggered caps 1
## Breakdown problem
- Takes a string
- returns a new string
    - staggered capitalisation - every other char is capitalised
### Points to remember
- non-letter chars stay the same but count as a char
## Examples

Input: 'I Love Launch School!' -> Output: 'I LoVe lAuNcH ScHoOl!'
Input: 'ignore 77 the 444 numbers' -> Output: 'IgNoRe 77 ThE 444 NuMbErS'

## Process - high-level
Approach
1. split string into array of chars
2. Use #each_with_index
    - Odd indexes are downcase (include 0)
    - Even indxes are upcase

## Code
```
def staggered_case(str)
    chars = str.chars.each_with_index do |char, index|
        if index.even?
            char.upcase!
        elsif index.odd?
            char.downcase!
        end
    end
    chars.join
end
```

## Refactor
To choose whether first char is up or down case
```
def staggered_case(str, first_downcase=false)
    chars = str.chars.each_with_index do |char, index|
        if index.even?
            char.upcase!
        elsif index.odd?
            char.downcase!
        end
    end
    chars.join
end
```
# Staggered caps 2
## Breakdown problem
- Same method as before, but ignore non-alphabetic chars
### Points to remember

## Examples

Input: 'I Love Launch School!' -> Output: 'I lOvE lAuNcH sChOoL!'
Input: 'ignore 77 the 444 numbers' -> Output: 'IgNoRe 77 ThE 444 nUmBeRs'

## Process - high-level
Approach
1.
2.

## Code
```
ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
def staggered_case(str)
    need_upper = true
    new_str = str.chars.each do |char|
        if ALPHABET.any?(char)
            if need_upper
                char.upcase!
            else
                char.downcase!
            end
            need_upper = !need_upper
        end
    end
    new_str.join
end
```

## Refactor
Option to include non-alpha characters
```
ALPHABET = ('A'..'Z').to_a + ('a'..'z').to_a
def staggered_case(str, alpha_only=true)
    need_upper = true
    new_str = str.chars.each do |char|
        if alpha_only ? ALPHABET.any?(char) : true
            if need_upper
                char.upcase!
            else
                char.downcase!
            end
            need_upper = !need_upper
        end
    end
    new_str.join
end
```

# Multiplicative Average
## Breakdown problem
- array of integers as input
- multiples all numbers together, divides result by number of entries in array
- print result rounded to 3 decimal places
### Points to remember
- assume array is non-empty
## Examples

Input: [3, 5] -> Output: => The result is 7.500
Input: [6] -> Output: => The result is 6.000

## Process - high-level
Approach
1. Get size of array
3. Create `sum = 1`
2. Use #map to iterate and multiply the sum by each element

## Code
```
def show_multiplicative_average(arr)
    sum = 1.to_f
    arr.map { |el| sum *= el }
    result = sum/arr.size
    puts "=> The result is #{format('%.3f', result)}"
end
```

# Multiply Lists
## Breakdown problem
- 2 array arguments each holding list of numbers
- returns a new array containing the product of each pair of numbers
### Points to remember
- pairs of numbers have the same index
- arrays will contain same number of elements
## Examples

Input: [3, 5, 7], [9, 10, 11] -> Output: [27, 50, 77]
Input: -> Output:

## Process - high-level
Approach
1. Use #each_with_index
2.

## Code
```
def multiply_list(arr1, arr2)
    new_arr = []
    arr1.each_with_index do |num, i|
        new_arr << num * arr2[i]
    end
    new_arr
end
```

## refactor
with #zip
```
def multiply_list(arr1, arr2)
    arr1.zip(arr2).map { |sub| sub.inject(:*)}
end
```

# Multiply all pairs

## Breakdown problem
- 2 array arguments each containing list of numbers
- returns a new array
    - contains the product of every pair of numbers that can be formed between each elements
### Points to remember
- result should be sorted by increasing value
- assume neither array will be empty
## Examples

Input: [2, 4], [4, 3, 1, 2] -> Output: [2, 4, 4, 6, 8, 8, 12, 16]
Input: [2], [4, 3, 1, 2] -> Output: [2, 4, 6, 8]

## Process - high-level
Approach
1. Create a new array
2. Use #each and #each again and #* to go through each element on the first array, and then again with the second array
3. sort new_array

## Code
```
def multiply_all_pairs(arr1, arr2)
    new_arr = []
    arr1.each do |num1|
        arr2.each do |num2|
            new_arr << num1 * num2
        end
    end
    new_arr.sort
end
```

## Refactor
```
def multiply_all_pairs(arr1, arr2)
    arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
end
```

# The end is near
## Breakdown problem
- returns the next to last word in the String passed in
### Points to remember
- words are any sequence of non-blank characters
- input will always contain at least two words
## Examples

Input: 'last word' -> Output: 'last'
Input: 'Launch School is great!' -> Output: 'is'

## Process - high-level
Approach
1. Use #split to create array
2. Return word at second to last index

## Code
```
def penultimate(str)
    str.split[-2]
end
```
## Refactor
Edge cases
```
def penultimate(str)
    str.split.size >=2 ? str.split[-2] : str
end
```
Middle word
```
def middle(str)
    mid = str.split.size / 2
    str.split.size >=3 ? str.split[mid] : str
end
```