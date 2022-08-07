puts "Hello there. Are you happy?"
answer = gets.chomp

until answer == "STOP"
  puts "Are you still happy?"
  answer = gets.chomp
end

def down(n)
  if n <=0
    puts "#{n}. Done counting down"
  else
    puts "#{n}. Still counting down"
    down(n-1)
  end
end

puts "Give me a number"
n = gets.chomp.to_i
down(n)