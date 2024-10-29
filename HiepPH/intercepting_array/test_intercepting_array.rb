require 'minitest/autorun'
require_relative './Intercepting_array' 

class TestCountUniqueNumbers < Minitest::Test
  def test_unique_numbers
    assert_equal [2, 3], count_unique_numbers([1, 2, 3], [2, 3, 4])
    assert_equal [5], count_unique_numbers([5, 5, 5], [5])
    assert_equal [], count_unique_numbers([1, 2, 3], [4, 5, 6])
    assert_equal [1], count_unique_numbers([1, 1, 2], [1, 3, 4])
  end
end