# [Tên Dự Án / Phân Hệ] - Tài Liệu Đặc Tả Yêu Cầu Phần Mềm (SRS)

- **Mã Tài Liệu:** SRS-[MODULE]-[XXX]
- **Tác Giả (BA):** [Họ và tên BA]
- **Phiên Bản:** 1.0
- **Ngày Tạo:** [YYYY-MM-DD]
- **Trạng Thái:** [Draft / Under Review / Approved]

---

## 1. Mục Tiêu & Bối Cảnh (Introduction)
### 1.1 Mục đích (Purpose)
[Mô tả vấn đề thực tế cần giải quyết và giá trị nghiệp vụ đem lại cho người dùng/doanh nghiệp].

### 1.2 Phạm vi (Scope)
- **Trong phạm vi (In-Scope):**
  - Chức năng 1...
  - Chức năng 2...
- **Ngoài phạm vi (Out-of-Scope):**
  - Các chức năng hoãn lại sang Phase 2 hoặc không hỗ trợ...

### 1.3 Đối tượng người dùng (User Personas & Roles)
| Vai Trò (Role) | Mô Tả | Quyền Hạn Chính |
|---|---|---|
| Admin | Quản trị hệ thống | Toàn quyền cấu hình |
| Operator | Nhân viên vận hành | Tạo, xem, cập nhật giao dịch |
| Viewer | Khách hàng / Xem báo cáo | Chỉ đọc |

---

## 2. Đặc Tả Yêu Cầu Chức Năng (Functional Requirements - FR)

### FR-01: [Tên Chức Năng 1]
- **Mô tả:** [Ý nghĩa tính năng]
- **Tác nhân (Actor):** [Role thực hiện]
- **Điều kiện tiên quyết (Preconditions):** [Hệ thống đang ở trạng thái nào]
- **Dữ liệu đầu vào (Input & Validations):**
| Tên Trường | Kiểu Dữ Liệu | Bắt Buộc | Ràng Buộc / Format |
|---|---|---|---|
| Mã đối tượng | String | Có | Tối đa 20 ký tự, không chứa ký tự đặc biệt |
| Trọng lượng | Number | Không | Lớn hơn 0, tối đa 999.99 |

- **Luồng xử lý chính (Main Flow):**
  1. Người dùng truy cập chức năng...
  2. Người dùng nhập liệu...
  3. Người dùng bấm nút Lưu...
  4. Hệ thống kiểm tra hợp lệ và lưu vào DB...
  5. Hệ thống trả về thông báo thành công.

- **Luồng ngoại lệ (Exception Flows):**
  - Nếu thiếu trường bắt buộc: Báo lỗi đỏ tại trường đó.
  - Nếu mã bị trùng lặp: Thông báo "Mã đã tồn tại".

- **Quy tắc nghiệp vụ liên quan (Business Rules):**
  - **BR-01:** [Quy tắc 1]
  - **BR-02:** [Quy tắc 2]

---

## 3. Đặc Tả Yêu Cầu Phi Chức Năng (Non-Functional Requirements - NFR)
- **Hiệu năng:** Thời gian phản hồi < 500ms cho 95% số lượng request.
- **Bảo mật:** Xác thực bằng JWT, phân quyền RBAC, mã hóa dữ liệu nhạy cảm.
- **Tính khả dụng:** Hỗ trợ phím Enter để tìm kiếm, tự động focus vào trường đầu tiên.

---

## 4. Từ Điển Dữ Liệu (Data Dictionary)
| Tên Cột / Trường | Ý Nghĩa Nghiệp Vụ | Kiểu Dữ Liệu | Giá Trị Mặc Định | Ràng Buộc Khóa |
|---|---|---|---|---|
| id | Mã định danh duy nhất | UUID / BigInt | Auto-generated | PK |
| status | Trạng thái bản ghi | Varchar(20) | 'NEW' | - |
