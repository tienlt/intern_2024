def count_word_frequency(file_path, word)
  frequency = 0
  lines = IO.readlines(file_path)
  lines.each do |line|
    frequency += line.scan(/\b#{Regexp.escape(word)}\b/i).size
  end
  frequency
end