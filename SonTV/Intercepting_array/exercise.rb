def intersection(nums1, nums2)
    set = Set.new
    array = []
    nums1.each do |element|
      set << element
    end
    nums2.each do |element|
      if set(element)
        array << element
        set.delete(element)
      end
    end
    array
  end
  puts intersection([1,5,8,6,3], [1,1])