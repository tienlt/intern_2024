require 'rspec'
require_relative '../problem'

RSpec.describe Problem do
  it 'returns the intersection of two  arrays' do
    expect(array_intersection([1, 2, 3, 4, 5], [3, 4, 6, 7, 8, 9])).to eq([3, 4])
  end

  it 'return an emty array when there are no common elemnt' do
    expect(array_intersection([1, 2, 3, 4, 5, 6], [7, 8, 9, 10, 11])).to eq([])
  end

  it 'return all elemnt when both arrays are the same' do
    expect(array_intersection([1, 2, 3], [1, 2, 3])).to eq([1, 2, 3])
  end

  it 'returns all unique elemnt when both arrays are the same with duplicates' do
    expect(array_intersection([1, 2, 3, 3, 3, 2], [1, 2, 2, 2, 3])).to eq([1, 2, 3])
  end

  it 'handles large arrays efficiently' do
    large_array1 = (1..1_000_000).to_a
    large_array2 = (500_000..1_500_000).to_a
    result = array_intersection(large_array1, large_array2)

    expect(result.size).to eq(500_001) # Từ 500000 đến 1000000 là 500001 số
    expect(result).to match_array((500_000..1_000_000).to_a)
  end

  it 'returns an empty array when one array is empty' do
    expect(array_intersection([], [1, 2, 3])).to eq([])
    expect(array_intersection([1, 2, 3], [])).to eq([])
  end

  it 'returns an empty array when both arrays are empty' do
    expect(array_intersection([], [])).to eq([])
  end

  it 'handles nil elements correctly' do
    expect(array_intersection([1, nil, 2], [nil, 3, 4])).to eq([nil])
    expect(array_intersection([nil, 1], [1, nil, 2])).to eq([nil, 1])
  end

  it 'handles arrays with different data types' do
    expect(array_intersection(%w[a b c], %w[b d e])).to eq(['b'])
    expect(array_intersection([1, 2.5, 'a'], [2.5, 'a', 3])).to match_array([2.5, 'a'])
  end

  it 'returns an empty array when all elements are unique' do
    expect(array_intersection([1, 3, 5], [2, 4, 6])).to eq([])
  end
end
