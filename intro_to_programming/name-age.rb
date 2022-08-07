puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Hello #{first_name + " " + last_name}!"

10.times do
  puts first_name
end

puts "How old are you?"
age = gets.chomp.to_i
puts "In 10 years you will be: #{age + 10}"
puts "In 20 years you will be: #{age + 20}"
puts "In 30 years you will be: #{age + 30}"
puts "In 40 years you will be: #{age + 40}"
