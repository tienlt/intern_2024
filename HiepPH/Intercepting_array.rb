require 'set'

def count_unique_numbers(array1, array2)
  counts = Hash.new(0)
  seen = Set.new

  [array1, array2].each do |array|
    seen.clear 
    array.each do |num|
      unless seen.include?(num)
        counts[num] += 1
        seen.add(num)
      end
    end
  end

  result = counts.select { |_, count| count >= 2 }.keys

end

# Main program flow
if __FILE__ == $0 #prevent this block of code from being executed when testing.
  puts "Enter integers for the first array (separated by spaces):"
  array1 = gets.chomp.split.map(&:to_i)
  puts "Enter integers for the second array (separated by spaces):"
  array2 = gets.chomp.split.map(&:to_i)

  result = count_unique_numbers(array1, array2)
  puts "Numbers that appear in both arrays (or multiple times in one):"
  puts result.empty? ? "None" : result.join(" ")
end
