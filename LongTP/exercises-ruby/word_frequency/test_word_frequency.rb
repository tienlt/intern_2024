require 'minitest/autorun'
require_relative 'word_frequency'

class TestWordFrequency < Minitest::Test
  def test_count_word_in_file_with_empty_file
    word_to_find = "ruby"
    expected = 0
    assert_equal expected, word_frequency("empty_file.txt", word_to_find)
  end

  def test_count_word_in_file_with_random_file
    word_to_find = "ruby"
    expected = 915
    assert_equal expected, word_frequency("random_text.txt", word_to_find)
  end

end