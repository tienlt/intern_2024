require 'set'

arr1 = [1, 2, 3, 4, 5]
arr2 = [3, 5]

def array_intersection(arr1, arr2)
  set1 = Set.new(arr1)
  set2 = Set.new(arr2)

  intersection = set1 & set2
  intersection.to_a
end

result = array_intersection(arr1, arr2)
puts result.inspect
