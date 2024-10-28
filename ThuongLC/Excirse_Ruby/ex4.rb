puts 'Enter number element of array:'

num = gets.chomp.to_i

if num <= 0
  puts 'Enter number element greater zero!!'
  num = gets.chomp.to_i
end

puts 'Enter target'
target_sum = gets.chomp.to_i
arr = []
sub_arr = []
begin
  puts 'Enter number : '
  num_arr = gets.chomp.to_i
  if arr.include?(num_arr)
    puts 'Enter number  again'
    num_arr = gets.chomp.to_i
  end
  arr << num_arr
end while arr.length < num
puts arr.inspect

seen_number = {}

for i in 0..arr.length - 1
  complement = target_sum - arr[i]
  if seen_number[complement]
    sub_arr.push(arr[i], complement)
    break
  end
  seen_number[arr[i]] = true
end

puts 'Answer:'
puts sub_arr.inspect
