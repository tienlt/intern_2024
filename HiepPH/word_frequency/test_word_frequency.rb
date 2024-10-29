require 'minitest/autorun'
require_relative './word_frequency'

class TestCountWordFrequency < Minitest::Test
  def setup
    @test_file_path = './test.txt' # Update this path
  end

  def test_count_single_word
    assert_equal 3, count_word_frequency(@test_file_path, 'evil')
  end

  def test_count_case_insensitivity
    assert_equal 3, count_word_frequency(@test_file_path, 'Evil')
  end

  def test_count_multi_word_phrase
    assert_equal 1, count_word_frequency(@test_file_path, 'choose between one evil')
  end

  def test_count_nonexistent_word
    assert_equal 0, count_word_frequency(@test_file_path, 'good')
  end

  def test_count_two_word_phrase
    assert_equal 1, count_word_frequency(@test_file_path, 'lesser, greater')
  end
end