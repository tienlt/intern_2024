def word_frequency(file_path, word)
  return nil if invalid_input_word?(word) || invalid_file_type?(file_path, [".txt"])
  return 0 if File.zero?(file_path)
  
  count = 0
  File.foreach(file_path) do |line|
    count += line.scan(/\b#{Regexp.escape(word)}\b/).size
  end
  count
end

def invalid_input_word?(word)
  unless word.is_a?(String) && !word.empty?
    puts "Warning: The word must be string and can not be empty"
    return true
  end
  false
end

def invalid_file_type?(file_path, valid_types)
  unless valid_types.include?(File.extname(file_path))
    puts "Error: The file must be one of the following types: #{valid_types.join(', ')}"
    return true
  end
  false
end

# p word_frequency("./exercise_2_sp_test/random_text.txt", "well")
# p word_frequency("./exercise_2_sp_test/random_text.txt", "well")
# p word_frequency("./exercise_2_sp_test/andom_text.txt", nil)
# p word_frequency("./exercise_2_sp_test/andom_text.txt", "")
# p word_frequency("./exercise_2_sp_test/andom_text.txt", 123)
# p word_frequency("./exercise_2_sp_test/test_data.md", "well")
# p word_frequency("./exercise_2_sp_test/empty_data.txt", "well")