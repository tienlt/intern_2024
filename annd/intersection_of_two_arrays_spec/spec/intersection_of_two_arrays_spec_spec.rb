# frozen_string_literal: true

RSpec.describe IntersectionOfTwoArraysSpec do
  # it "has a version number" do
  #   expect(IntersectionOfTwoArraysSpec::VERSION).not_to be nil
  # end
  describe '.array_intersection' do
    context 'when both arrays have common elements' do
      it 'returns the intersection of the two arrays' do
        expect(IntersectionOfTwoArraysSpec.array_intersection([1, 2, 3, 4], [3, 4, 5, 6])).to eq([3, 4])
        expect(IntersectionOfTwoArraysSpec.array_intersection([1, 2, 2, 1], [2, 2])).to eq([2])
      end
    end

    context 'when there are no common elements' do
      it 'returns an empty array' do
        expect(IntersectionOfTwoArraysSpec.array_intersection([1, 2], [3, 4])).to eq([])
      end
    end

    context 'when the first array has duplicates' do
      it 'returns the unique intersection' do
        expect(IntersectionOfTwoArraysSpec.array_intersection([1, 1, 2, 3], [1, 2])).to eq([1, 2])
      end
    end

    context 'when the second array has duplicates' do
      it 'returns the unique intersection' do
        expect(IntersectionOfTwoArraysSpec.array_intersection([1, 2, 3], [2, 2, 3])).to eq([2, 3])
      end
    end

    context 'when handling large arrays' do
      it 'efficiently finds the intersection' do
        large_array1 = (1..1000000).to_a
        large_array2 = (500000..1500000).to_a
        expect(IntersectionOfTwoArraysSpec.array_intersection(large_array1, large_array2).sort).to eq((500000..1000000).to_a)
      end
    end
  end
end
