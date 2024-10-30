def word_frequency(file_path, word)
  begin
    content = File.read(file_path)
    count = content.scan(/\b#{Regexp.escape(word)}\b/).size
    count
  rescue Errno::ENOENT
    puts "File không tồn tại."
    0
  end
end

# Ví dụ sử dụng
frequency = word_frequency("data.txt", "the")

puts "Từ cần kiểm tra  xuất hiện #{frequency} lần trong file."

