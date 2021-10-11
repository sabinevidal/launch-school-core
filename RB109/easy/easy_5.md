# ASCII String Value
```ruby
def ascii_value(str)
    sum = 0
    str.each_char { |char| sum += char.ord }
end
```
# After Midnight 1
```ruby
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def normalise_minutes_to_1439(minutes)
    while minutes < 0
        minutes += MINUTES_PER_DAY
    end
    minutes % MINUTES_PER_DAY
end

def time_of_day(delta_mins)
    delta_mins = normalise_minutes_to_1439(delta_mins)
    hours, minutes = delta_mins.divmod(MINUTES_PER_HOUR)
    format('%02d:%02d', hours, minutes)
end
```

# After midnight 2
```ruby
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time)
    hours, minutes = time.split(':').map(&:to_i)
    (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time)
    delta_mins = MINUTES_PER_DAY - after_midnight(time)
    delta_mins = 0 if delta_mins == MINUTES_PER_DAY
    delta_mins
end
```

# Letter Swap
Split words into an array
Map words to a new array, where char[0] and char[-1] of each word are re-assigned to each other
Join array with spaces to string which is returned
```ruby
def swap_letters(word)
    new_word = word.dup
    new_word[0] = word[-1]
    new_word[-1] = word[0]
    new_word
end
def swap(str)
    new_str = str.split.map do |word|
        swap_letters(word)
    end
    new_str.join(" ")
end
```

# Clean up the words
Split text up into array of characters
For each character, check if it's in alphabet and if it is add to new array.
If it isn't replace with a space unless the last char was also a space.
Join array into string
```ruby
ALPHABET = ('a'..'z').to_a
def cleanup(text)
    clean_str = []
    text.chars.each do |char|
        if ALPHABET.include?(char)
            clean_str << char
        else
            clean_str << " " unless clean_str.last == " "
        end
    end
    clean_str.join
end

# gsub example
def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end
```

# Letter Counter 1
Split words into an array
check size of each word
Add size with count of 1 to the hash if first of that size
Any additional words with same length will + 1 to the value of the corresponding hash key

```ruby
def word_sizes(str)
    hsh = {}
    str.split.each do |word|
        if hsh.keys.include?(word.size)
            hsh[word.size] += 1
        else
            hsh[word.size] = 1
        end
    end
    hsh
end

# Don't need to differentiate between initialising hash and increasing it's value if use `hsh = Hash.new(0)` instead of `hsh = {}`. Using the default value form of initialising a hash, forces any references to non-existing keys to return 0 instead of nil
def word_sizes(str)
    hsh = Hash.new(0)
    str.split.each do |word|
        hsh[word.size] += 1
    end
    hsh
end
```

# Letter Counter 2
```ruby
def word_sizes(str)
    hsh = Hash.new(0)
    str.split.each do |word|
        word.delete!('^A-Za-z')
        hsh[word.size] += 1
    end
    hsh
end
```

# Alphabetical Numbers
```ruby
NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)
def alphabetic_number_sort(arr)
    arr.sort_by { |num| NUMBER_WORDS[num] }
end
```

# Daily Double
```ruby
def crunch(str)
    text = ''
    str.chars.each do |char|
        text << char unless char.last == char
    end
    text
end
```

# Bannerizer
```ruby
def print_in_box(text)
	horizontal = "+#{'-' * (text.size + 2)}+"
	empty_line = "|#{' ' * (text.size + 2)}|"
	text_line = "| #{text} |"

	puts horizontal
	puts empty_line
	puts text_line
	puts empty_line
	puts horizontal
end

TRUNCATE = 80
def print_in_box_truncated(text)
    text.slice!((TRUNCATE-4)..text.size) if text.size + 4 >= TRUNCATE
	horizontal = "+#{'-' * (text.size + 2)}+"
	empty_line = "|#{' ' * (text.size + 2)}|"

	puts horizontal
	puts empty_line
	puts "| #{text} |"
	puts empty_line)
	puts horizontal
end
```

# Spin me around in circles
Method will return a different object.
The original string is split into an array, which creates a new object. Then that Array object is mutated using `.reverse!`. The array of words is then joined together to create a new string, which will be a different String object from the original.