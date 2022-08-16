 feature = ''

puts "Welcome to the mortgage calculator!"

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def is_valid_numeric_input(num)
  (integer?(num) || float?(num)) && (num.to_i > 0)
end

def get_required_info(feature)
  if feature == '1'

    monthly_payment_amount = ''
    interest_rate = ''
    loan_duration_months = ''
    down_payment = ''

    loop do
      puts "How much can you afford monthly?"
      monthly_payment_amount = gets.chomp
      if is_valid_numeric_input(monthly_payment_amount)
        monthly_payment_amount = monthly_payment_amount.to_f
        break
      else
        puts "#{monthly_payment_amount} is not a valid amount."
      end
    end

    loop do
      puts "What interest rate have you found?"
      interest_rate = gets.chomp
      if is_valid_numeric_input(interest_rate)
        if interest_rate.to_f > 1
          interest_rate = interest_rate.to_f / 100
          break
        else
          interest_rate = interest_rate.to_f
          break 
        end 
      else
        puts "#{interest_rate} is not a valid interest rate."
      end
    end
    
    loop do
      puts "What is the loan duration in months?"
      loan_duration_months = gets.chomp
      if is_valid_numeric_input(loan_duration_months)
        loan_duration_months = loan_duration_months.to_i
        break
      else
        puts "#{loan_duration_months} is not a valid loan duration."
      end
    end

    loop do
      puts "How much do you have for a down payment?"
      down_payment = gets.chomp
      if is_valid_numeric_input(down_payment)
        down_payment = down_payment.to_f
        break
      else
        puts "#{down_payment} is not a valid down payment amount."
      end
    end
    calculate_how_much_house_i_can_afford(monthly_payment_amount, interest_rate, loan_duration_months, down_payment)

  elsif feature == '2'
    puts "Coming soon!"
  elsif feature == '3'

    loan_amount = ''
    loan_duration_months = ''
    interest_rate = ''

    loop do
      puts "What is the loan amount?"
      loan_amount = gets.chomp
      if is_valid_numeric_input(loan_amount)
        loan_amount = loan_amount.to_f
        break
      else
        puts "#{loan_amount} is not a valid loan amount."
      end
    end

    loop do
      puts "What is the loan term in months?"
      loan_duration_months = gets.chomp
      if is_valid_numeric_input(loan_duration_months)
        loan_duration_months = loan_duration_months.to_i
        break
      else
        puts "#{loan_duration_months} is not a valid loan duration."
      end
    end

    loop do
      puts "What is the interest rate?"
      interest_rate = gets.chomp
      if is_valid_numeric_input(interest_rate)
        if interest_rate.to_f > 1
          interest_rate = interest_rate.to_f / 100
          break
        else
          interest_rate = interest_rate.to_f
          break 
        end 
      else
        puts "#{interest_rate} is not a valid interest rate."
      end
    end

    calculate_monthly_payment(loan_amount, loan_duration_months, interest_rate)
  else
    puts "I don't recognize this option."
  end
end

def calculate_monthly_payment(loan_amount, loan_duration_months, interest_rate)
  monthly_interest_rate = interest_rate / 12
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
  puts "Your monthly payment on a $#{loan_amount} loan lasting #{loan_duration_months/12} years at #{interest_rate*100}% interest rate is: 
   $#{monthly_payment}"
end

def calculate_how_much_house_i_can_afford(monthly_payment_amount, interest_rate, loan_duration_months, down_payment)
  monthly_interest_rate = interest_rate / 12
  total_loan_amount = monthly_payment_amount / (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))
  total_house_amount = down_payment + total_loan_amount
  puts "The total amount of house you can affod with a monthly payment amount of #{monthly_payment_amount} 
  and a #{loan_duration_months} month loan at #{interest_rate*100}% interest rate is: #{total_house_amount.to_i}"
end

loop do
  puts <<-MSG
  What would you like to calculate?
  1) How much house can I afford?
  2) Can I afford this house?
  3) What is my monthly payment?
  MSG

  loop do
    feature = gets.chomp

    if %w(1 2 3).include?(feature)
      get_required_info(feature)
      break
    else
      puts "Must choose a valid option (1, 2 or 3). Try again."
    end
  end
    
  puts "Would you like to calculate something else?"
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

puts "Good bye. Thanks for using the mortgage calculator!"