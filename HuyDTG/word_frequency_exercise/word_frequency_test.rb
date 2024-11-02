require 'minitest/autorun'
require_relative 'word_frequency.rb'
require_relative './exercise_2_sp_test/generate_random_text.rb'

class TestArrayIntersection < Minitest::Test
  def setup
    words = %w[Just between us, do you remember it all too well?]
    @random_text_path = "./exercise_2_sp_test/random_text.txt"
    @expect_random_text = 100
    @word = "well"
    target_index = words.length - 1
    @invalid_word_message = "Warning: The word must be string and can not be empty"
    @invalid_file_message = "Error: The file must be one of the following types:"
    generate_random_text_file(@random_text_path, 1000, words, target_index, @expect_random_text)
  end

  def test_common_file_data
    assert_equal @expect_random_text, word_frequency(@random_text_path, @word) , "Expected and actual count of words in file should be equal."
  end

  def test_word_not_in_file
    assert_equal 0, word_frequency(@random_text_path, "noexist"), "Expected 0 for a word that does not exist in the file"
  end

  def test_empty_file
    assert_equal 0, word_frequency("./exercise_2_sp_test/empty_data.txt", @word), "Expected 0 for empty file"
  end

  def test_invalid_word_nil
    output, _ = capture_io do
      result = word_frequency(@random_text_path, nil)
      assert_equal nil, result, "Expected return nil for nil word"
    end
    assert_match @invalid_word_message, output, "Expected warning message for nil word"
  end
  
  def test_invalid_word_empty_string
    output, _ = capture_io do
      result = word_frequency(@random_text_path, "")
      assert_equal nil, result, "Expected return nil for empty word"
    end
    assert_match @invalid_word_message, output, "Expected warning message for empty word"
  end

  def test_invalid_word_non_string
    output, _ = capture_io do
      result = word_frequency(@random_text_path, 123)
      assert_equal nil, result, "Expected return nil for non-string word"
    end
    assert_match @invalid_word_message, output, "Expected warning message for non-string word"
  end

  def test_invalid_file_type
    output, _ = capture_io do
      result = word_frequency("./exercise_2_sp_test/test_file.md", @word)
      assert_equal nil, result, "Expected return nil for unsupported file type"
    end
    assert_match @invalid_file_message, output, "Expected error message for unsupported file type"
  end
end