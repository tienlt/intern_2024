#
require 'rspec'
require './intersection'

describe 'Unit test for intersection two array' do
  it 'returns the intersection of two array' do
    expect(intersection([1, 2, 3, 4, 5], [3, 4, 6, 7, 8, 9])).to eq([3, 4])
  end

  it 'return an empty array when there are no common elemnt' do
    expect(intersection([1, 2, 3, 4, 5], [6, 7, 8, 9])).to eq([])
  end

  it 'return all element when both arrays are the same' do
    expect(intersection([1, 2, 3, 4, 5], [1, 2, 3, 4, 5])).to eq([1, 2, 3, 4, 5])
  end

  it 'returns all unique elemnt when both arrays are the same with duplicates' do
    expect(intersection([1, 2, 9, 9, 9, 2], [1, 2, 2, 2, 3, 9, 9, 2])).to eq([1, 2, 9])
  end

  it 'handles large arrays efficiently' do
    large_array1 = (1..1_000_000).to_a
    large_array2 = (500_000..1_500_000).to_a
    result = intersection(large_array1, large_array2)

    expect(result.size).to eq(500_001)
    expect(result).to match_array((500_000..1_000_000).to_a)
  end

  it 'returns an empty array when one array is empty' do
    expect(intersection([], [32, 1, 399])).to eq([])
    expect(intersection([0, 3221, 123], [])).to eq([])
  end
 
  it 'returns an empty array when both arrays are empty' do
    expect(intersection([], [])).to eq([])
  end
 
  it 'handles nil elements correctly' do
    expect(intersection([321, nil, 232], [nil, 322, 411])).to eq([nil])
    expect(intersection([nil, 133, 1], [123, nil, 2323, 1])).to eq([nil, 1])
  end
 
  it 'handles arrays with different data types' do
    expect(intersection(%w[a b c m n l], %w[b d e x z q])).to eq(['b'])
    expect(intersection([132, 2.533, 'ab', 2.5], [2.544, 'ab', 321, 2.5])).to match_array(['ab', 2.5])
  end

end

