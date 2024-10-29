require 'minitest/autorun'
require_relative 'intersection'

class TestIntersection < Minitest::Test
  def test_intersection_with_common_elements
    a = [1, 3, 5, 8, 7, 9]
    b = [3, 1, 2, 7, 6, 9]
    expected = [1, 3, 7, 9]
    assert_equal expected, intersection(a, b)
  end

  def test_intersection_with_no_common_elements
    a = [1, 2, 3]
    b = [4, 5, 6]
    expected = []
    assert_equal expected, intersection(a, b)
  end

  def test_intersection_with_empty_arrays
    a = []
    b = []
    expected = []
    assert_equal expected, intersection(a, b)
  end

  def test_intersection_with_duplicates_in_input
    a = [1, 2, 2, 3, 4]
    b = [2, 2, 4, 4]
    expected = [2, 4]
    assert_equal expected, intersection(a, b)
  end

  def test_intersection_with_one_empty_array
    a = [1, 2, 3]
    b = []
    expected = []
    assert_equal expected, intersection(a, b)
  end
end
