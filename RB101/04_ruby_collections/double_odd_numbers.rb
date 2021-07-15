def double_odd_numbers(numbers)
  doubled_numbers = numbers.map do |num|
    if num.odd?
      num = num*2
    else
      num
    end
  end
  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_numbers(my_numbers) # => [2, 4, 6, 14, 2, 6]