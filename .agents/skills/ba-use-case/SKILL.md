---
name: ba-use-case
description: "Đặc tả chi tiết Use Case (Use Case Specification) chuẩn Alistair Cockburn/UML gồm Actor, Preconditions, Trigger, Main Flow, Alternative Flows, Exception Flows, Postconditions và Business Rules. USE WHEN the user says 'đặc tả use case', 'viết use case chi tiết', 'soạn use case specification', '/usecase', or asks for formal Use Case documentation."
---

# Đặc Tả Chi Tiết Use Case (Use Case Specification)

Kỹ năng này cung cấp biểu mẫu và hướng dẫn chuẩn mực để BA viết tài liệu **Đặc tả Use Case chi tiết**, làm cầu nối trực tiếp giữa yêu cầu nghiệp vụ của người dùng và thiết kế kỹ thuật của lập trình viên.

---

## 1. Cấu Trúc Khung Chuẩn Của Use Case Specification

```markdown
# UC-[Mã Phân Hệ]-[Số Thứ Tự]: [Động từ + Danh từ đại diện hành động]
*Ví dụ: UC-INV-001: Lập Hóa Đơn Điện Tử Tạm Thu*

| Thuộc Tính | Chi Tiết |
|---|---|
| **Mã Use Case (ID)** | UC-[XXX]-[YYY] |
| **Tên Use Case** | [Tên ngắn gọn, rõ ràng theo cấu trúc Động từ + Danh từ] |
| **Phân hệ (Module)** | [Tên module / Microservice quản lý] |
| **Tác nhân chính (Primary Actor)** | [Người dùng trực tiếp kích hoạt luồng] |
| **Tác nhân phụ (Secondary Actors)** | [Hệ thống khác, Service khác, bên thứ 3 (Cổng thanh toán, ERP, HQ...)] |
| **Mô tả vắn tắt (Brief Description)** | [Mô tả ngắn gọn 2–3 câu về mục tiêu của Use Case] |
| **Sự kiện kích hoạt (Trigger)** | [Hành động làm bắt đầu Use Case (vd: Click nút, Nhận webhook, Cronjob)] |
| **Điều kiện tiên quyết (Preconditions)** | [1. Người dùng đã đăng nhập với quyền X]<br>[2. Bản ghi Y đang ở trạng thái Z] |
| **Điều kiện hậu thỏa mãn (Postconditions)** | - **Thành công:** [Dữ liệu mới được tạo, trạng thái chuyển sang A, gửi thông báo]<br>- **Thất bại:** [Dữ liệu giữ nguyên trạng thái cũ, ghi nhận log lỗi] |

---

## 2. Luồng Xử Lý Chi Tiết (Detailed Flows)

### 2.1 Luồng Chính (Main Success Flow / Happy Path)

| Bước | Hành Động Của Tác Nhân (Actor Action) | Phản Hồi Của Hệ Thống (System Response) |
|---|---|---|
| 1 | Actor truy cập vào màn hình [Tên màn hình] và chọn chức năng [Tên chức năng]. | Hệ thống hiển thị form nhập liệu với các thông tin mặc định (nếu có). |
| 2 | Actor nhập các thông tin: [Liệt kê các trường chính]. | |
| 3 | Actor bấm nút **[Xác nhận / Lưu / Thực hiện]**. | Hệ thống xác thực tính hợp lệ của dữ liệu đầu vào (Data Validation). |
| 4 | | Hệ thống kiểm tra các quy tắc nghiệp vụ liên quan [Tham chiếu BR-XX]. |
| 5 | | Hệ thống ghi nhận giao dịch vào cơ sở dữ liệu và cập nhật trạng thái mới. |
| 6 | | Hệ thống gửi thông báo thành công cho Actor và đóng/chuyển hướng màn hình. |

---

### 2.2 Luồng Rẽ Nhánh (Alternative Flows)

- **2a. Người dùng chọn áp dụng dữ liệu mẫu / nạp từ nguồn có sẵn:**
  - 2a1. Tại bước 2 của luồng chính, Actor chọn "Nhập từ file Excel" hoặc "Chọn từ danh sách có sẵn".
  - 2a2. Hệ thống hiển thị modal tải tệp / danh sách tra cứu.
  - 2a3. Actor chọn tệp/dữ liệu và xác nhận.
  - 2a4. Hệ thống điền tự động dữ liệu vào các ô tương ứng.
  - 2a5. Quay lại Bước 3 của luồng chính.

- **3a. Người dùng lưu nháp (Save as Draft):**
  - 3a1. Tại bước 3 của luồng chính, Actor bấm nút "Lưu nháp".
  - 3a2. Hệ thống bỏ qua một số quy tắc kiểm tra bắt buộc của bước hoàn tất.
  - 3a3. Hệ thống lưu bản ghi với trạng thái DRAFT. Use Case kết thúc thành công dạng nháp.

---

### 2.3 Luồng Xử Lý Ngoại Lệ & Lỗi (Exception Flows)

- **3b. Dữ liệu đầu vào không hợp lệ hoặc thiếu trường bắt buộc:**
  - 3b1. Tại bước 3, hệ thống phát hiện trường [Tên trường] bị để trống hoặc sai định dạng.
  - 3b2. Hệ thống đánh dấu đỏ trường vi phạm và hiển thị câu thông báo lỗi cụ thể.
  - 3b3. Luồng quay lại Bước 2 để Actor sửa lại dữ liệu.

- **4b. Vi phạm quy tắc nghiệp vụ (Business Rule Violation):**
  - 4b1. Tại bước 4, hệ thống phát hiện điều kiện nghiệp vụ không thỏa mãn (ví dụ: số dư không đủ, mã đã tồn tại, hết hạn mức).
  - 4b2. Hệ thống hiển thị hộp thoại cảnh báo: "[Nội dung thông báo lỗi cụ thể]".
  - 4b3. Không có dữ liệu nào được thay đổi trong DB. Quay lại Bước 2 hoặc hủy thao tác.

- **5b. Lỗi kết nối hệ thống ngoài / Timeout:**
  - 5b1. Tại bước 5, việc gọi sang hệ thống bên thứ 3 bị timeout hoặc lỗi mạng.
  - 5b2. Hệ thống rollback giao dịch nội bộ.
  - 5b3. Hiển thị thông báo: "Không thể kết nối đến hệ thống liên kết, vui lòng thử lại sau". Ghi log hệ thống.

---

## 3. Các Quy Tắc Nghiệp Vụ Cố Định (Business Rules)

- **BR-01:** [Nội dung quy tắc chi tiết, công thức tính toán, hoặc điều kiện cố định].
- **BR-02:** [Điều kiện về bảo mật hoặc logic hạn chế thao tác].

---

## 4. Ghi Chú Kỹ Thuật & Yêu Cầu Đặc Thù (Special Requirements)
- Thời gian phản hồi xử lý không vượt quá [X] giây.
- Có cơ chế chặn người dùng click đúp (Double-click prevention) khi đang gửi yêu cầu.
```

---

## 2. Tiêu Chí Nghiệm Thu Một Use Case Tốt
1. **Rõ ràng 2 phía:** Mỗi bước phải tách biệt rõ người dùng làm gì và hệ thống phản hồi gì.
2. **Không bỏ sót luồng rẽ:** Luôn có ít nhất 1 luồng chính, 1–2 luồng rẽ nhánh, và đầy đủ luồng ngoại lệ (lỗi validation, lỗi logic, lỗi hệ thống).
3. **Traceability:** Có mã định danh (UC-ID) rõ ràng để dễ dàng đối chiếu ngược lên Feature và đối chiếu xuôi sang Test Case.
