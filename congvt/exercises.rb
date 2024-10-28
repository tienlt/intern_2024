# test---------------------------------------------
def aray_intersection(first_arr, second_arr)
  hash = {}
  first_arr.each { |e| hash[e] = true }
  result = []
  second_arr.each do |e|
    if hash[e]
      hash.delete(e)
      result << e
    end
  end
  result
end
# puts aray_intersection([1, 2, 3, 4], [3, 3, 4, 5, 6]).inspect
