numbers = [12, 3, 1, 2, -6, 5, -8, 6]
target_number = 0
result = []
seen_number = {}
numbers.sort!

puts "arr: #{numbers}"
for i in 0..numbers.length - 2
  next if i > 0 && numbers[i] == numbers[i - 1]

  for j in i + 1..numbers.length - 1
    next if j > 0 && numbers[j] == numbers[j - 1]

    complement = target_number - numbers[i] - numbers[j]
    next unless numbers.include?(complement) && complement != numbers[i] && complement != numbers[j]

    triplet = [complement, numbers[i], numbers[j]].sort
    unless seen_number[triplet]
      result << triplet
      seen_number[triplet] = true
    end

  end
end

puts "result is #{result.inspect}"
