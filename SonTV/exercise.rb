def intersection(nums1, nums2)
    set = Set.new
    array = []
    nums1.each do |element|
      set << element
    end
    nums2.each do |element|
      if set.include?(element)
        array << element
        set.delete(element)
      end
    end
    array
  end