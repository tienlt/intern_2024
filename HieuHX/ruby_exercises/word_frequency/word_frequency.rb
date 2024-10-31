def word_frequency(file_path, word)
  count = 0
  File.open(file_path, "r") do |file|
    file.each_line do |line|
      words = line.gsub(/[^\w\s]/, ' ').split
      words.each do |w|
        count += 1 if w == word
      end
    end
  end
  count
end

puts(word_frequency("large_text_file.txt", "lorem"))
