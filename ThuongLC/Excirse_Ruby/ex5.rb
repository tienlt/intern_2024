arr1 = [5, 1, 22, 6, -1, 8, 10]
arr2 = [1, 6, -1, 10]
arr2_index = 0
check = false
for i in 0...arr1.length
  arr2_index += 1 if arr1[i] == arr2[arr2_index]
  check = true if arr2_index == arr2.length - 1
end

puts "after check, arr2 is sub of arr1 is #{check}"
