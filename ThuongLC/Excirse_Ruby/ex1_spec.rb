require 'rspec'
require_relative 'ex1_refactor'

RSpec.describe NumberTracker do
  let(:tracker) { NumberTracker.new }

  describe '#add number' do
    it 'add a number to the list and updates min_number' do
      tracker.add_number(5)
      expect(tracker.numbers).to include(5)
      expect(tracker.min_number).to eq(5)

      tracker.add_number(3)
      expect(tracker.numbers).to include(3)
      expect(tracker.min_number).to eq(3)

      tracker.add_number(10)
      expect(tracker.numbers).to include(10)
      expect(tracker.min_number).to eq(3)
    end
  end

  describe '#input number' do
    it 'stop input when -1 is entered' do
      allow_any_instance_of(Object).to receive(:gets).and_return('5', '3', '10', '-1')
      tracker.input_numbers
      expect(tracker.numbers).to contain_exactly(5, 3, 10)
      expect(tracker.min_number).to eq(3)
    end

    it 'limits input to 100 numbers' do
      allow_any_instance_of(Object).to receive(:gets).and_return(*Array.new(100) { '1' }, '-1')
      tracker.input_numbers
      expect(tracker.numbers.length).to eq(99)
    end
  end
end
