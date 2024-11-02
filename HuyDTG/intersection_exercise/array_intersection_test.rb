require 'minitest/autorun'
require_relative 'array_intersection'

class TestArrayIntersection < Minitest::Test
  def test_common_elements
    expected = [3, 4]
    result = array_intersection([1, 2, 3, 4], [3, 4, 5, 6])
    assert expected.all? { |element| result.include?(element) }
    assert_equal expected.length, result.length, "Expected and actual arrays should have the same length"
  end

  def test_common_elements_with_duplicates
    expected = [1, 3, 7, 9]
    result = array_intersection([1, 3, 5, 8, 7, 9], [3, 1, 2, 7, 6, 9])
    assert expected.all? { |element| result.include?(element) }
    assert_equal expected.length, result.length, "Expected and actual arrays should have the same length"
  end

  def test_common_elements_with_duplicates_in_both_arrays
    expected = [1, 3, 4]
    result = array_intersection([1, 1, 3, 4], [1, 3, 4, 5])
    assert expected.all? { |element| result.include?(element) }
    assert_equal expected.length, result.length, "Expected and actual arrays should have the same length"
  end

  def test_no_common_elements
    assert_equal [], array_intersection([1, 2, 3], [4, 5, 6, 7])
  end

  def test_one_empty_array
    assert_equal [], array_intersection([], [1, 2, 3])
    assert_equal [], array_intersection([2, 2, 3, 4], [])
  end

  def test_both_empty_arrays
    assert_equal [], array_intersection([], [])
  end
end
