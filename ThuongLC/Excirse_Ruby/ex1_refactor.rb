class NumberTracker
  attr_reader :numbers, :min_number

  def initialize
    @numbers = []
    @min_number = nil
  end

  def add_number(number)
    @min_number = number if @min_number.nil? || @min_number > number
    @numbers << number
  end

  def input_numbers
    loop do
      puts 'Enter number:'
      number = gets.chomp.to_i
      break if number == -1

      add_number(number)
      break if @numbers.length >= 100
    end
  end
end
