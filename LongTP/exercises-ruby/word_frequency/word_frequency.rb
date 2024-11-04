def word_frequency(file, word_to_find)
  unless word_to_find.is_a?(String) && !word_to_find.empty?
    puts "Warning: The word must be string and can not be empty"
    return nil
  end
  
  count = 0
  return 0 if File.zero?(file)
  
  File.open(file, "r") do |file|
    file.each do |line|
      count += line.scan(/\b#{word_to_find}\b/).size
    end
  end

  count
end

word_to_find = "ruby"
p word_frequency("random_text.txt", word_to_find)

