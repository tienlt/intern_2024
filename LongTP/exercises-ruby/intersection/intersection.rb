
def intersection (first, second)
  res = []
  first.sort!
  second.sort!
  i = 0
  j = 0 
  while (i < first.length && j < second.length)
      if first[i] == second[j]
      res << first[i]
      i += 1
      j += 1
    elsif first[i] < second[j]
      i += 1
    else
      j += 1
    end
  end
  res.uniq
end

a = [1, 2, 3, 4]
b = [3, 4, 5 ,6]
p intersection(a,b)
 