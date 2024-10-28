import pandas as pd
from faker import Faker

# Khởi tạo Faker
fake = Faker()

# Số lượng người dùng
num_users = 500000  # Hoặc số lượng bạn muốn

# Tạo danh sách dữ liệu
data = []
for i in range(1, num_users + 1):
    name = f"Nguyen Van A {i}" if i != 2 else f"Nguyen Van A {i}"
    email = fake.email() if i != 2 else ""  # Dòng thứ hai không có email
    phone = "0123456789"
    address = "Ho Chi Minh city"
    day_of_birth = "2000/01/01"
    profile = f'Like TV 100", Some special character: \\ / \' $ ~ & @ # ( ; "'

    # Thêm dữ liệu vào danh sách
    data.append([name, email, phone, address, day_of_birth, profile])

# Tạo DataFrame từ dữ liệu
df = pd.DataFrame(data, columns=["name", "email", "phone", "address", "day_of_birth", "profile"])

# Lưu DataFrame thành tệp CSV
csv_file_path = "users_fake.csv"
df.to_csv(csv_file_path, index=False, header=False, sep=',')

print(f"Tạo tệp CSV với {num_users} dòng thành công: {csv_file_path}")

