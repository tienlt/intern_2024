# frozen_string_literal: true

require_relative "intersection_of_two_arrays_spec/version"

module IntersectionOfTwoArraysSpec
  class Error < StandardError; end

  # Your code goes here...

  def self.array_intersection(arr1, arr2)
    memo = {}
    nums1.each do |a|
        memo[a] = true
    end

    result = []
    nums2.each do |a|
      if memo[a]
        result << a
        memo[a] = nil
      end
    end
    result
  end
end
