# Class and Instance Methods

`File::path` is a class method, this means it is called on the File class. It returns the string representation of the path
`File.path("/dev/null")      #=> "/dev/null"`

`File#path` is an instance method, this means it is called on an object of the `File` class. It returns the pathname used to create the file as a string, and does not normalise the name.
`File.new("testfile").path   #=> "testfile"`


# Optional Arguments Redux

`Date::civil` creates a date object with the given calendar date using the `Date` class in the Ruby API.
`line 3` will print `-4712-01-01` which is the default
`line 4` will print `2016-01-01`
`line 5` will print `2016-05-01`
`line 6` will print `2016-05-13`

# Default Arguments in the Middle

Ruby allows default arguments in the middle of a number of positional arguments, like here where the parameters `b` and `c` which have default values, are in between `a` and `d` which don't have default values. Ruby will first assign the given arguments in the method call to the two variables which do not have default values, in their order. So first argument will be assigned to the first variable and the last argument will be assigned to the last variable (`4` and `6`). Ruby then fills out the remaining supplied arguments to variables which have default values (`5` to `b`) and then the default values are applied to any remaining variables.

```
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# [4, 5, 3, 6]
```

# Mandatory Blocks

```
a = [1, 4, 8, 11, 15, 19]

puts a.bsearch { |x| x >= 9 }
# 11
# => nil
```

# Multiple Signatures

`%w()` is a shortcut for `[]`, it's a notation to write an array of strings separated by spaces instead of commas and with no quotes. 'Whitespace separated array'
`Array#fetch` returns the element at the index.

`# puts a.fetch(7)`
Will throw an `IndexError` as there is no element at index `7` and is out fo bounds

`# puts a.fetch(7, 'beats me')`
Will print `beats me` as this has been provided as a default value if there is no valid element at the supplied index.

`# puts a.fetch(7) { |index| index**2 }`
Will output `49` as the the method has the `index` argument and a block, which will call the block with the `index` if there is no valid element at the index. The block has taken the `7` and squared it.

# Keyword Arguments

`#step` (from `Numeric` class) invokes the given block with the sequence of numbers starting with the number given as the caller `5` in this case, and incremented by the number given with the `by:` keyword argument (signature), `3` here, until (or less than) the number given as the limit, `10` here.
```
5
8
```

# Parent Class

`#public_methods` is availble under the Object class

`s.public_methods(false).inspect`
Including the `false` argument limits the output just to the methods in the called object (String in this case)


# Included Modules
```
a = [5, 9, 3, 11]
puts a.min
# 3
# => nil
```

```
puts a.min(2)
# 3
# 5
# => nil
```

# Down the Rabbit Hole

https://ruby-doc.org/stdlib-3.0.0/libdoc/psych/rdoc/Psych.html
