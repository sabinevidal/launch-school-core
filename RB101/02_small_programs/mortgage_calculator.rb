=begin
-  Inputs:
    - loan amount
    - Annual Percentage Rate (APR)
    - loan duration
-  Output:
  - monthly interest rate
  - loan duration in months
  - monthly payment
---
- Formula
  m = p * (j / (1 - (1 + j)**(-n)))
    m = monthly payment
    p = loan amount
    j = monthly interest rate
    n = loan duration in months

Take in the inputs, (clarify between years and months for the loan duration)
Convert the loan duration to months if needed.
Convert the interest rate percentage to decimal.
Run the inputs through the formula, to get the monthly payment amount
Return the monthly payment amount.

Pseduocode

START
SET loan_amount = 0
SET annual_rate = 0
SET monthly_rate = 0
SET loan_yrs_input = 0
SET loan_mnths_input = 0
GET loan_amount, annual_rate, loan duration (years and months)

SET loan_mnths = (loan_yrs_input * 12) + loan_mnths_input

FUNCTION to_monthly_rate(annual_rate)
  monthly_rate = (annual_rate/100)/12
ENDFUNCTION

PROMPT user to check if inputs are correct
IF yes
  carry on
ELSE IF 'no'
  go back and ask for inputs again
ELSE
  prompt again


SET monthly_pay = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_mnths)))

PRINT given information
PRINT monthly_pay

END

=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def inpt
  Kernel.gets().chomp()
end

def valid_number?(num)
  num.empty?() || num.to_f() < 0
end

prompt("Welcome to the mortgage calculator")

loop do # main loop
  loan_amount = ''
  interest_rate = ''
  loan_months = ''

  loop do # get input loop
    loop do
      prompt("What is your loan amount?")
      loan_amount = inpt()

      if valid_number?(loan_amount)
        prompt("Enter a valid number")
      else
        break
      end
    end

    loop do
      prompt("What is the annual percentage rate(%)?")
      interest_rate = inpt()

      if valid_number?(interest_rate)
        prompt("Enter a valid number")
      else
        break
      end
    end

    loop do
      prompt("What is the loan duration? (in months)")
      loan_months = inpt()

      if valid_number?(loan_months)
        prompt("Enter a valid number")
      else
        break
      end
    end

    inputs_print = <<-MSG
      -----------------------------
      Loan Amount: #{loan_amount}
      APR: #{interest_rate}%
      Duration: #{loan_months} months
    MSG
    prompt(inputs_print)

    prompt("Is this correct? (Y if it is correct)")
    answer = inpt
    break if answer.downcase().start_with?('y')
  end

  annual_rate = interest_rate.to_f() / 100
  monthly_rate = annual_rate / 12

  monthly_pay = loan_amount.to_f() *
                (monthly_rate /
                (1 - (1 + monthly_rate)**(-(loan_months.to_i()))))

  output = <<-MSG
    -------------------------------------
    You will owe #{monthly_pay} per month
    with the following terms:
      Loan Amount: #{loan_amount}
      APR: #{interest_rate}%
      Duration: #{loan_months} months
    --------------------------------------
    Do you want to use the calculator again? (Y to calculate again)
  MSG
  prompt(output)

  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the calculator")

=begin
THINGS TO TAKE NOTE OF

1. Look at Kernel#format in docs
    - returns a string with formatting applied to any argument.
    - useful when using integers and floats within a string when you need to make them more readable
    - eg.

    # puts "I'm atually a long float: $#{format('%.2f', 1.2345678 )}""
    # => I'm atually a long float: 1.23

  https://ruby-doc.org/core-3.0.1/Kernel.html#method-i-format
=end
