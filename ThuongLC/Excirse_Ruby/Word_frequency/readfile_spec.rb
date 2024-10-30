require 'rspec'
require_relative 'readfile.rb'


RSpec.describe '#readfile' do
  let(:file_path) { 'test_data.txt' }

  before do
    # Tạo một file tạm để test
    File.open(file_path, 'w') do |file|
      file.write("ruby RUBY RuBy Ruby ruby")
    end
  end

  after do
    # Xóa file sau khi hoàn thành test
    File.delete(file_path) if File.exist?(file_path)
  end

  it 'đếm chính xác từ phân biệt chữ hoa chữ thường' do
    expect(word_frequency(file_path, 'ruby')).to eq(2)
    expect(word_frequency(file_path, 'RUBY')).to eq(1)
    expect(word_frequency(file_path, 'RuBy')).to eq(1)
    expect(word_frequency(file_path, 'Ruby')).to eq(1)
  end

  it 'trả về 0 nếu từ không có trong file' do
    expect(word_frequency(file_path, 'nonexistent')).to eq(0)
  end

  it 'trả về 0 và hiển thị thông báo khi file không tồn tại' do
    expect { word_frequency('non_existent_file.txt', 'ruby') }.to output("File không tồn tại.\n").to_stdout
    expect(word_frequency('non_existent_file.txt', 'ruby')).to eq(0)
  end
end
