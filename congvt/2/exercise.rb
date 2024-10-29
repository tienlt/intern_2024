def word_frequency(large_file_path, word)
  regex = /\b#{word}\b/
  File.foreach(large_file_path).sum{|line| line.scan(regex).count}
end
# puts word_frequency("1.txt", "ruby")