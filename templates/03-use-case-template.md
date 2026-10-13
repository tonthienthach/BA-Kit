# Biểu Mẫu Đặc Tả Use Case Chi Tiết (Use Case Specification)

## UC-[ID]: [Động từ + Danh từ]

| Thuộc Tính | Chi Tiết |
|---|---|
| **Mã Use Case** | UC-[XXX]-[YYY] |
| **Tên Use Case** | [Tên Use Case] |
| **Phân hệ** | [Tên phân hệ / Service] |
| **Tác nhân chính (Primary Actor)** | [Người dùng thao tác] |
| **Tác nhân phụ (Secondary Actors)** | [Hệ thống khác, Service khác] |
| **Mô tả ngắn** | [Tóm tắt 1–2 câu mục tiêu] |
| **Sự kiện kích hoạt (Trigger)** | [Hành động kích hoạt] |
| **Điều kiện tiên quyết (Preconditions)** | [Trạng thái trước khi chạy] |
| **Điều kiện hậu thỏa mãn (Postconditions)** | - Thành công: [Dữ liệu mới tạo/cập nhật]<br>- Thất bại: [Dữ liệu rollback, log lỗi] |

---

### Luồng Xử Lý Chi Tiết

#### 1. Luồng Chính (Main Success Flow)
| Bước | Hành Động Của Tác Nhân | Phản Hồi Của Hệ Thống |
|---|---|---|
| 1 | Người dùng truy cập... | Hệ thống hiển thị... |
| 2 | Người dùng nhập... | |
| 3 | Người dùng bấm Xác nhận | Hệ thống kiểm tra tính hợp lệ |
| 4 | | Hệ thống lưu vào DB và trả về kết quả |

#### 2. Luồng Rẽ Nhánh (Alternative Flows)
- **2a. [Tên nhánh phụ 1]:**
  - 2a1. [Mô tả bước rẽ nhánh]
  - 2a2. [Hệ thống phản hồi]
  - 2a3. Quay lại bước [X] của luồng chính.

#### 3. Luồng Xử Lý Ngoại Lệ (Exception Flows)
- **3a. Dữ liệu không hợp lệ:**
  - 3a1. Hệ thống báo lỗi chi tiết.
  - 3a2. Người dùng sửa lại thông tin và thử lại.
- **4a. Lỗi hệ thống ngoài / Timeout:**
  - 4a1. Hệ thống rollback giao dịch.
  - 4a2. Hiển thị thông báo thân thiện và ghi log.
