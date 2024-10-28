require 'pg'

# Kết nối cơ sở dữ liệu
conn = PG.connect(
  dbname: 'my_database', # Thay đổi với tên cơ sở dữ liệu của bạn
  user: 'congthuong',    # Thay đổi với tên người dùng của bạn
  password: '123456',     # Thay đổi với mật khẩu của bạn
  host: 'localhost',      # Địa chỉ máy chủ
  port: 5432              # Cổng mặc định
)

# Đường dẫn tệp CSV
csv_file_path = 'users_fake.csv'

# Thời gian bắt đầu
start_time = Time.now

begin
  # Sử dụng lệnh \copy để nhập dữ liệu từ tệp CSV
  conn.exec("COPY users (name, email, phone, address, day_of_birth, profile) FROM STDIN WITH (FORMAT CSV, DELIMITER ',', HEADER false);") do |copy|
    File.open(csv_file_path, 'r') do |file|
      while (line = file.gets)
        copy.puts line
      end
    end
  end
rescue PG::Error => e
  puts "Lỗi khi truy vấn cơ sở dữ liệu: #{e.message}"
ensure
  # Đóng kết nối
  conn.close
end

# Thời gian kết thúc
end_time = Time.now
elap_time = end_time - start_time

puts "Đã nhập dữ liệu vào cơ sở dữ liệu thành công. Tổng thời gian: #{elap_time.round(2)} giây."
#tổng thời gian là : 16s
