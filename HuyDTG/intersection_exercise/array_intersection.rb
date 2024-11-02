def array_intersection(array1, array2)
  result = []
  return result if array1.empty? || array2.empty?
  index = 0
  temple_hash = Hash.new(0)
  array1.uniq!
  array2.uniq!
  while index <= array1.length - 1 || index <= array2.length - 1
    if temple_hash[array1[index]] < 2
      temple_hash[array1[index]] += 1
    end
    if temple_hash[array2[index]] < 2
      temple_hash[array2[index]] += 1
    end
    if temple_hash[array1[index]] == 2 && array1[index]
      temple_hash[array1[index]] += 1
      result.push(array1[index])
    end
    if temple_hash[array2[index]] == 2 && array2[index]
      temple_hash[array2[index]] += 1
      result.push(array2[index])
    end
    index += 1
  end
  result
end


# p array_intersection([1, 2, 3, 4], [3, 4, 5, 6])
# p array_intersection([1, 3, 5, 8, 7, 9], [3, 1, 2, 7, 6, 9])
# p array_intersection([1, 1, 3, 4], [1, 3, 4, 5])

