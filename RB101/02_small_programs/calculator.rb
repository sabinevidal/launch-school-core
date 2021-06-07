# ask user for two numbers
# ask the user for an operatiion to perform
# perform the operation
# output the result

Kernel.puts("Welcome to Calculator")

Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) mulitply 4) divide")
operator = Kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else
  result = number1.to_f() + number2.to_f()
end

Kernel.puts("The answer is #{result}")


=begin
THINGS TO TAKE NOTE OF

1. with conditionals, make sure equality comparison (==) is being used, not assignment (=)

2. Pay attention to the object being compared against. String vs Integer etc
eg
if operator == 1      #int
# vs
if operator == '1'    #string

3. Note concept of integer divison 
  (vs float division)

4. #String.to_i and #String.to_f
    useful, but know limitations
    - 

5. local variables initialised within an if can be accessed outside the if

6. if expressions can return a value