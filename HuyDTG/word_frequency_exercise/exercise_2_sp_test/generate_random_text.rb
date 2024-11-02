def generate_random_text_file(file_path, num_lines, words, target_index, target_count)
  raise ArgumentError, "Error target index" if target_index < 0 || target_index >= words.size
  target_word = words[target_index]
  words = words.reject { |word| word == target_word }
  words.uniq!
  
  count = 0
  File.open(file_path, "w") do |file|
    num_lines.times do
      line = Array.new(100){words.sample}
      if count < target_count
        random_position = rand(line.size)  
        line[random_position] = target_word
        count += 1
      end
      file.puts(line.join(" "))
    end
  end
end
# words = %w[Just between us, do you remember it all too well?]
# generate_random_text_file("random_text.txt", 10, words, 2, 5)

