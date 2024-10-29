def word_frequency(file_path, word)
    return 0 unless File.exist?(file_path) && File.size(file_path) > 0
  
    word_regex = /\b#{Regexp.escape(word)}\b/
    count_words = 0
    File.foreach(file_path) do |line|
      count_words += line.scan(word_regex).size
    end
    count_words
  end