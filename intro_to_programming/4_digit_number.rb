puts "Enter a 4-digit number:"
number = gets.chomp.to_i
th = number / 1000
hu = (number%1000) / 100
te = (number % (th*1000 + hu*100))/10
on = (number % (th*1000 + hu*100 + te*10))
puts "Thousandths: #{th}, Hundredths: #{hu}, Tens: #{te}, Ones: #{on}"