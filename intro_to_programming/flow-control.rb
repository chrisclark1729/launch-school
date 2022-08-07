def caps(word)
  if word.length > 10
    word.upcase
  else
    word
  end
end

puts caps("Chris")
puts caps("Dean and Chris and Cody and Carly")

def range(number)
  if number >= 0 && number <=50
    puts "Number is between 0 and 50"
  elsif number > 50 && number <=100
    puts "Number is between 50 and 100"
  elsif number > 100
    puts "Number is greater than 100"
  else
    puts "Didn't recognize"
  end
end

puts "Give me a positive number please"
number = gets.chomp.to_i
range(number)

'4' == 4 ? puts("TRUE") : puts("FALSE") #FALSE

#Did you get it right?
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end

#Alright now!
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end

