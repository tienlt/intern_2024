puts 'Enter number for array: '
number = gets.chomp.to_i
puts number
while number > 99 || number <= 0
  puts 'Invalid number! Please enter a number between 1 and 99: '
  number = gets.chomp.to_i
end

random_arr = Array.new(number) { rand(1..9) }

puts 'Random array:'
puts random_arr.inspect

sub_arr = []
sub_arrs = []
for idx in 0..random_arr.length - 1
  num = random_arr[idx]
  if idx == 0 || num > random_arr[idx - 1]
    sub_arr << num
  else
    sub_arrs << sub_arr if sub_arr.size > 1
    sub_arr = [num]
  end
end
sub_arrs << sub_arr

sub_arrs.each_with_index do |sub_arr, index|
  puts "sub array #{index + 1}: #{sub_arr}"
end
