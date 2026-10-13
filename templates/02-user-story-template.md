# Biểu Mẫu User Story & Acceptance Criteria (Gherkin Style)

### US-[ID]: [Tên ngắn gọn của User Story]

**Mô tả cốt lõi (Story Statement):**
- **As a** [Đối tượng / Vai trò người dùng]
- **I want to** [Hành động muốn làm]
- **So that** [Mục đích / Giá trị đạt được]

- **Mức độ ưu tiên:** Must Have / Should Have / Could Have
- **Story Points:** [1 / 2 / 3 / 5 / 8]
- **Phụ thuộc:** [Story tiền đề nếu có]

---

#### Quy Tắc Nghiệp Vụ (Business Rules):
- **BR-01:** [Quy tắc ràng buộc 1]
- **BR-02:** [Quy tắc ràng buộc 2]

---

#### Tiêu Chí Chấp Nhận (Acceptance Criteria - AC):

##### Kịch bản 1: Luồng thành công chính (Happy Path)
- **Given** [Tiền điều kiện của người dùng và hệ thống]
- **When** [Người dùng thực hiện hành động]
- **Then** [Hệ thống phản hồi thành công]
- **And** [Trạng thái bản ghi được cập nhật]

##### Kịch bản 2: Bỏ trống trường dữ liệu bắt buộc (Validation Error)
- **Given** [Người dùng đang mở form nhập liệu]
- **When** [Người dùng bỏ trống trường bắt buộc và bấm "Lưu"]
- **Then** [Hệ thống không gửi yêu cầu lưu dữ liệu]
- **And** [Hiển thị cảnh báo lỗi viền đỏ tại trường tương ứng]

##### Kịch bản 3: Vi phạm logic nghiệp vụ (Business Rule Conflict)
- **Given** [Dữ liệu đang ở trạng thái không cho phép chỉnh sửa]
- **When** [Người dùng bấm nút sửa / cập nhật]
- **Then** [Hệ thống hiển thị thông báo từ chối với lý do rõ ràng]

##### Kịch bản 4: Phân quyền truy cập (Access Control)
- **Given** [Người dùng không được cấp quyền [Permission Name]]
- **When** [Người dùng truy cập màn hình hoặc thao tác]
- **Then** [Nút chức năng bị ẩn hoặc trả về lỗi không đủ quyền]
