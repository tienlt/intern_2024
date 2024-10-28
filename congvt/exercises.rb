# frozen_string_literal: true

require 'csv'
require 'rspec'
require 'faker'
require 'pg'
require 'time'

def connect_db
  PG.connect(
    dbname: '', # modify the db name
    user: '', # modify the username
    password: '', # modify the password
    host: 'localhost', # modify the host
    port: 5432 # modify the port
  )
end

# cau 1--------------------------------------------
def nhap_mang
  print 'Input n (0 < n <= 99): '
  n = gets.chomp.to_i
  arr = []
  if n.positive? && n < 99
    n.times do |i|
      print "Nhap so thu #{i + 1}: "
      input =  gets.chomp.to_i
      break if input == -1

      arr << input
    end
  else
    print 'n must be > 0 and < 99!'
  end
  print 'Min: '
  puts arr.min
  print 'Array: '
  puts arr.inspect
end

# cau 2--------------------------------------------
num_rows = 500_000

def tao_csv(filename, num_rows)
  CSV.open(filename, 'wb') do |csv|
    csv << %w[id name email address phone]
    num_rows.times do |i|
      csv << [i + 1, Faker::Name.name, Faker::Internet.email, Faker::Address.full_address,
              Faker::PhoneNumber.phone_number]
      puts i
    end
  end
  puts 'csv created'
end

def nhap_file_vao_db(conn, filename)
  start_time = Time.now
  conn.copy_data('COPY users (id, name, email, address, phone) FROM STDIN WITH CSV') do
    CSV.foreach(filename, headers: true) do |row|
      conn.put_copy_data("#{[row['id'], row['name'], row['email'], row['address'], row['phone']].join(',')}\n")
    end
  end
  end_time = Time.now
  puts 'input to db'
  elapsed_time = end_time - start_time
  puts "time input: #{elapsed_time.round(2)} giay"
end

begin
  filename = './users.csv'
  tao_csv(filename, num_rows)

  conn = connect_db

  nhap_file_vao_db(conn, filename)
  # conn.exec('delete from users;')
ensure
  conn&.close
end

# cau 3--------------------------------------------
def nhap_va_hien_thi_mang_con
  print 'Input n: '
  n = gets.chomp.to_i

  return unless n >= 0 && n < 100

  arr = Array.new(n) { rand(1..9) }
  puts arr
  puts tim_mang_con_tang(arr)
end

def tim_mang_con_tang(arr)
  subseq = []
  start_id = 0
  while start_id < arr.size
    temp = start_id
    end_id = temp + 1
    while end_id < arr.size
      break unless arr[temp] <= arr[end_id]

      temp += 1
      end_id += 1
    end
    if temp != start_id
      subseq << arr[start_id..end_id - 1]
      start_id = end_id
    else
      subseq << arr[start_id].to_a
      start_id += 1
    end
  end
  subseq
end

# cau 4--------------------------------------------
def tim_hai_phan_tu(arr, target_sum)
  return [] if arr.empty? || has_dup?(arr)

  hash = {}
  arr.each do |e|
    return [target_sum - e, e] if hash[target_sum - e]

    hash[e] = true
  end
  []
end

# cau 5--------------------------------------------
def b_la_mang_con_cua_a?(a, b)
  return false if a.empty? || b.empty? || b.size > a.size

  b_idx = 0
  a_idx = 0
  while a_idx < a.size && b_idx < b.size
    b_idx += 1 if a[a_idx] == b[b_idx]
    a_idx += 1
  end
  b_idx == b.size
end

# cau 6--------------------------------------------
RSpec.describe 'nhap_mang' do
  it 'stops when input is -1 and prints the correct min and array' do
    allow_any_instance_of(Object).to receive(:print)
    input_sequence = ['3', '5', '1', '-1']
    allow_any_instance_of(Object).to receive(:gets).and_return(*input_sequence)

    expect { nhap_mang }.to output(/Min: 1\nArray: \[5, 1\]/).to_stdout
  end

  it 'handles invalid n input (n <= 0 or n > 99)' do
    allow_any_instance_of(Object).to receive(:print)
    input_sequence = ['0']
    allow_any_instance_of(Object).to receive(:gets).and_return(*input_sequence)

    expect { nhap_mang }.to output(/n phai lon hon 0 va be hon 99!/).to_stdout
  end

  it 'prints array and min when n is valid and no -1 is input' do
    allow_any_instance_of(Object).to receive(:print)
    input_sequence = %w[3 7 2 4]
    allow_any_instance_of(Object).to receive(:gets).and_return(*input_sequence)

    expect { nhap_mang }.to output(/Min: 2\nArray: \[7, 2, 4\]/).to_stdout
  end
end

# cau 7--------------------------------------------
def tim_ba_phan_tu(nums, target_sum)
  subseq = []
  nums.sort!
  (0..nums.size - 2).each do |i|
    j = i + 1
    k = nums.size - 1
    while j < k
      current_sum = nums[i] + nums[j] + nums[k]
      if current_sum == target_sum
        subseq << [nums[i], nums[j], nums[k]]
        j += 1
        k -= 1
      elsif current_sum < target_sum
        j += 1
      else
        k -= 1
      end
    end
  end
  subseq
end

# test---------------------------------------------
def aray_intersection(first_arr, second_arr)
  hash = {}
  first_arr.each { |e| hash[e] = true }
  result = []
  second_arr.each do |e|
    if hash[e]
      hash.delete(e)
      result << e
    end
  end
  result
end
# puts aray_intersection([1, 2, 3, 4], [3, 3, 4, 5, 6]).inspect
