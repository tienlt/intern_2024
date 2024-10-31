require 'rspec'
require './word_frequency'

describe 'Unit test for word count in the large file text' do
  it 'returns the right word count with speacial character' do
    expect(word_frequency('large_text_file.txt', 'lorem')).to eq(150000)
  end

  it 'returns the right if word have speacial character' do
    expect(word_frequency('test.txt', 'ruby')).to eq(8)
  end

  it 'returns the right word count with upcase words is diffirent downcase ones' do
    expect(word_frequency('large_text_file.txt', 'Lorem')).to eq(60000)
  end

  it 'returns the 0 when the word is not in the large text file' do
    expect(word_frequency('test.txt', 'HXHXH')).to eq(0)
  end

  it 'returns the the right word count with the long long keyword' do
    expect(word_frequency('test.txt', 'HXHXHheheheehewhiewhiqewhiqewjewooweoqew')).to eq(0)
  end
end
