File.open("random_text.txt", "w") do |file|
  words = ["word", "example", "text", "random", "ruby", "code", "language", "computer", "testing", "phi long", "bestarion"]
  10000.times do
    file.print("#{words.sample} ")
  end
end