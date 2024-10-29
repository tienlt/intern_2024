def array_intersection(arr1, arr2)
  memo = {}
  arr1.each do |a|
      memo[a] = true
  end

  result = []
  arr2.each do |a|
    if memo[a]
      result << a
      memo[a] = nil
    end
  end
  result
end

arr1 = [1, 2, 2, 1]
arr2 = [2, 2]
puts array_intersection(arr1, arr2).inspect

arr1 = [1, 3, 5]
arr2 = [2, 4, 6]
puts array_intersection(arr1, arr2).inspect

arr1 = []
arr2 = [1, 2, 3]
puts array_intersection(arr1, arr2).inspect

arr1 = [1, 2, 3, 4]
arr2 = [2, 3, 5, 2]
puts array_intersection(arr1, arr2).inspect

arr1 = [4, 9, 5]
arr2 = [9, 4, 9, 8, 4]
puts array_intersection(arr1, arr2).inspect
