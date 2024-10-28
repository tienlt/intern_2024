def intersection(arr1, arr2)
    arr1_hash = {}
    arr1.each {|num| arr1_hash[num] = true }
    
    result = []
    arr2.each do |num|
        next unless arr1_hash[num]
        result << num
        arr1_hash[num] = nil
    end
    result
end


# puts(intersection([1, 2, 3, 4], [3, 4, 5, 6]).inspect)
