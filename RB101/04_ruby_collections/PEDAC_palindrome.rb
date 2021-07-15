=begin
PROBLEM:

Given a string, write a method `palindrome_substrings` which returns
all the substrings from a given string which are palindromes. Consider
palindrome words case sensitive.

Test cases:

palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []

Questions:
1. Should a new string object be returned? Or Original?
2. What is a palindrome?
3. What is a substring?
4. Will inputs always be strings?
5. What does it mean that the strings are cases sensitive?
6. How should the strings be returned? String or array?

Inputs:
- String
Outputs:
- Array of substrings

Rules:
  Explicit:
    - return only palindrome substrings
    - palindrome words should be case sensitive , so "abBA" would not be considered a plaindrome
  Implicit:
    - return a new array object

Data structure: Array

Algorithm:

  Substring Method
  ==============
  - create an empty array called `result` that will contain all required substrings
  - create a `starting_index` variable (value `0`) for the starting index of a substring
  - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
    - create a `num_chars` variable (value `2`) for the length of a substring
    - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
      - extract a substring of length `num_chars` from `string` starting at `starting_index`
      - append the extracted substring to the `result` array
      - increment the `num_chars` variable by `1`
    - end the inner loop
    - increment the `starting_index` variable by `1`
  - end the outer loop
  - return the `result` array

  START

  /* Given a string named 'string */

  SET result = []
  SET starting_index = 0

  WHILE starting_index <= length of string - 2
    SET numChars = 2
    WHILE numChars <= length of string - starting_index
      SET substring = num_chars characters from string starting at index starting_index
      append substring to result array
      SET num_chars = num_chars + 1

    SET starting_index = starting_index + 1

    RETURN result

  END

  is_palindrome? method
  - Inside the `is_palindrome?` method, check whether the string
    value is equal to its reversed value. You can use the
    String#reverse method.

  palindrome_substrings method
  ============================
  - initialize a result variable to an empty array
  - create an array named substring_arr that contains all of the
    substrings of the input string that are at least 2 characters long.
  - loop through the words in the substring_arr array.
  - if the word is a palindrome, append it to the result
    array
  - return the result array
=end

def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end