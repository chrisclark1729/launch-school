arr = [1, 3, 5, 7, 9, 11]
number = 3
arr_2 = ["Chris", "Carly", "Dean", "Cody", "Ridge"]

def a_check(arr, number)
  arr.include?(number)
end

def increment_array(arr)
  b = arr.map {|n| n+2}
end

puts a_check(arr, number)
arr_2.each_with_index {|name, idx| puts "#{idx+1}. #{name}"}
p arr
p increment_array(arr)
