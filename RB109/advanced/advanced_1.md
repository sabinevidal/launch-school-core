# Madlibs revisited
## Breakdown problem
- madlibs program that reads in some text from a sample text file
- plug in a selection of random nouns, verbs, adjectives, adverbs
- print in a specific format
### Points to remember

## Examples

Input:  -> Output:

## Process - high-level
Approach
- arrays of options (adj, nouns etc)
- open file and go through each line
- use format to substitute the noun/verb/etc placeholder with a random sample for the arrays
## Code
```ruby
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:       NOUNS.sample,
                      verb:       VERBS.sample,
                      adjective:  ADJECTIVES.sample,
                      adverb:     ADVERBS.sample)
  end
end
```

# Seeing Stars
## Breakdown problem
- display 8-pointed star in `n` x `n` grid
- `n` is an odd integer
- smallest star would be 7 x 7
### Points to remember

## Examples

Input: 7 -> Output: *  *  *   s 2 s 2 s   (7)  *   *   *  s 3 s 3 s
                     * * *    1 s 1 s 1 s (7)
                      ***     2 sss 2     (7)
                    *******
                      ***
                     * * *
                    *  *  *

- all rows except middle have 3 stars
- mid row has `n` stars
## Process - high-level
Approach
- top and bottom are repeats of each other => create repeatable row
  - first (last): spaces = (n - 3)/2
  - next: spaces = 1, star, then 1 less than above
  - next: spaces = 2, star, then 1 less etc
  - middle is just stars * n
## Code
```ruby
def print_row(n, index, mid)
  star = '*'
  space = ' '
  mid_spaces = ((n - 3)/2) - index
  if index == mid
    puts star * n
  else
    puts (space * index) + (star) + (space * mid_spaces) + (star) + (space * mid_spaces) + (star)
  end
end

def star(n)
  mid = n/2
  0.upto(mid-1) do |index|
     print_row(n, index, mid)
  end
  mid.downto(0) do |index|
     print_row(n, index, mid)
  end
end

```

# Transpose 3x3
## Breakdown problem
- take 3x3 nested arrays and transpose
### Points to remember

## Examples

Input: [[1, 5, 8], [4, 7, 2], [3, 9, 6]] -> Output: [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

## Process - high-level
Approach:
- create new nested array
- loop through the inner array add all inner_array[0] to array[0] etc
## Code
```ruby
def transpose(matrix)
  new_matrix = [[],[],[]]
  matrix.each do |array|
    array.each_with_index do |inner_array, index|
      new_matrix[index] << inner_array
    end
  end
  new_matrix
end
```

# Transpose MxN
## Breakdown problem
- use previous method and make it work with any size matrix
### Points to remember

## Examples

Input: [[1, 2, 3, 4]] -> Output: [[1], [2], [3], [4]]

## Process - high-level
Approach
- 
## Code
```ruby
def transpose(matrix)
  new_matrix = []
  (matrix[0].size).times { |_| new_matrix << [] }
  matrix.each do |array|
    array.each_with_index do |inner_array, index|
      new_matrix[index] << inner_array
    end
  end
  new_matrix
end
```

# Rotating Matrices
## Breakdown problem

### Points to remember

## Examples

Input:  -> Output:

## Process - high-level
Approach
- 
## Code
```ruby

```

# Fix the Bug
## Breakdown problem

### Points to remember

## Examples

Input:  -> Output:

## Process - high-level
Approach
1.
## Code
```ruby

```

# Merge Sorted Lists
## Breakdown problem

### Points to remember

## Examples

Input:  -> Output:

## Process - high-level
Approach
1.
## Code
```ruby

```


# Merge Sort
## Breakdown problem

### Points to remember

## Examples

Input:  -> Output:

## Process - high-level
Approach
1.
## Code
```ruby

```


# Egyptian Fractions
## Breakdown problem

### Points to remember

## Examples

Input:  -> Output:

## Process - high-level
Approach
1.
## Code
```ruby

```



