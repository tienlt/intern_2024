def word_frequency(large_file_path, word)
  regex = /\b#{word}\b/i
  File.foreach(large_file_path).sum{|line| line.scan(regex).count}
end