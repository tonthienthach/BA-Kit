# Biểu Mẫu Ma Trận Kịch Bản Kiểm Thử & UAT Test Cases

- **Tên Tính Năng:** [Tên Tính Năng]
- **Tài Liệu Tham Chiếu:** [Mã US / UC / SRS]
- **Người Tạo:** [BA / Tester]
- **Ngày Tạo:** [YYYY-MM-DD]

---

## 1. Ma Trận Kịch Bản Kiểm Thử (Test Scenarios)
| Scenario ID | Tên Kịch Bản | Mục Tiêu Nghiệp Vụ | Mức Độ Ưu Tiên |
|---|---|---|---|
| TS-01 | Kiểm thử luồng thành công chính (Happy path) | Đảm bảo tính năng hoạt động đúng kỳ vọng | P1 |
| TS-02 | Kiểm thử xác thực các trường bắt buộc | Chặn gửi dữ liệu khi thiếu thông tin cốt lõi | P1 |
| TS-03 | Kiểm thử giá trị biên và định dạng dữ liệu | Ngăn ngừa lỗi tràn chuỗi hoặc định dạng sai | P2 |
| TS-04 | Kiểm thử vi phạm quy tắc nghiệp vụ | Kiểm tra hệ thống thực thi đúng logic nghiệp vụ | P1 |
| TS-05 | Kiểm thử phân quyền truy cập chức năng | Xác nhận chỉ đúng role mới được thao tác | P2 |
| TS-06 | Kiểm thử gửi liên tiếp (Double-click submit) | Đảm bảo không tạo trùng lặp bản ghi | P3 |

---

## 2. Bảng Chi Tiết Test Cases

| Test Case ID | Scenario ID | Mô Tả Kịch Bản | Điều Kiện Tiền Đề | Các Bước Thực Hiện | Dữ Liệu Test | Kết Quả Kỳ Vọng | Loại Test | Mức Ưu Tiên |
|---|---|---|---|---|---|---|---|---|
| TC-01 | TS-01 | Tạo mới thành công với dữ liệu hợp lệ | Đang ở form tạo mới, tài khoản có quyền | 1. Nhập form hợp lệ<br>2. Nhấn "Lưu"<br>3. Kiểm tra thông báo | [Dữ liệu mẫu chuẩn] | - Lưu DB thành công<br>- Thông báo: "Thành công"<br>- Trạng thái: "MỚI" | Positive | P1 |
| TC-02 | TS-02 | Bỏ trống trường bắt buộc | Đang ở form tạo mới | 1. Bỏ trống trường X<br>2. Nhấn "Lưu" | Trường X = rỗng | - Chặn submit<br>- Báo lỗi viền đỏ trường X | Negative | P1 |
| TC-03 | TS-03 | Nhập độ dài vượt quá số ký tự cho phép | Đang ở form tạo mới | 1. Nhập trường Y vượt Max length<br>2. Nhấn "Lưu" | Ký tự = Max + 1 | - Giới hạn gõ hoặc thông báo lỗi độ dài | Boundary | P2 |
| TC-04 | TS-04 | Vi phạm quy tắc: Dữ liệu đã tồn tại | Bản ghi đã có trong DB | 1. Nhập mã trùng lặp<br>2. Nhấn "Lưu" | Mã đã tồn tại | - Chặn lưu<br>- Báo lỗi: "Mã đã tồn tại" | Business Rule | P1 |
| TC-05 | TS-05 | Tài khoản không có quyền thao tác | Tài khoản role Viewer | 1. Vào màn hình<br>2. Tìm nút chức năng | Role = Viewer | - Nút bị ẩn hoặc click vào báo lỗi 403 | Security | P2 |
| TC-06 | TS-06 | Click đúp nút Lưu thật nhanh | Dữ liệu hợp lệ | 1. Click nút Lưu 2-3 lần liên tiếp | Dữ liệu hợp lệ | - Nút disabled sau click đầu<br>- Chỉ sinh đúng 1 bản ghi | Concurrency | P3 |
