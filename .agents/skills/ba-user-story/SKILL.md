---
name: ba-user-story
description: "Phân rã tính năng thành các User Story độc lập và viết Acceptance Criteria (AC) chi tiết theo chuẩn Given-When-Then (Gherkin style). USE WHEN the user says 'viết user story', 'tạo acceptance criteria', 'viết AC cho tính năng', 'soạn user story', '/story', '/ac', or asks to break down requirements into Agile User Stories and Acceptance Criteria."
---

# Soạn Thảo User Stories & Acceptance Criteria Chuẩn Agile

Kỹ năng này giúp BA phân rã một Feature/Epic lớn thành các **User Story** độc lập, có giá trị nghiệp vụ rõ ràng và kèm theo bộ **Acceptance Criteria (AC)** chi tiết theo phong cách BDD (Behavior-Driven Development) / Gherkin để Dev và QA có thể triển khai và kiểm thử chính xác.

---

## 1. Tiêu Chí Đánh Giá User Story Chuẩn (INVEST)

Mỗi User Story sinh ra cần thỏa mãn 6 nguyên tắc **INVEST**:
- **I**ndependent (Độc lập): Hạn chế tối đa phụ thuộc lẫn nhau, có thể phát triển riêng rẽ.
- **N**egotiable (Có thể thương lượng): Mô tả ý định và giá trị, không áp đặt cứng ngắc cách hiện thực hóa kỹ thuật.
- **V**aluable (Có giá trị): Luôn mang lại giá trị thiết thực cho người dùng cuối hoặc doanh nghiệp.
- **E**stimable (Có thể ước lượng): Đủ rõ ràng để đội kỹ thuật đánh giá độ phức tạp và story point.
- **S**mall (Vừa vặn): Vừa đủ thực hiện trong 1 sprint (1–3 ngày làm việc của 1 dev).
- **T**estable (Có thể kiểm thử): Có Acceptance Criteria rõ ràng để QA viết test case.

---

## 2. Cấu Trúc Khung Chuẩn Của Một User Story

```markdown
### US-[ID]: [Tiêu đề súc tích phản ánh hành động chính]

**Mô tả cốt lõi (User Story Statement):**
- **As a** [Đối tượng / Vai trò người dùng cụ thể, ví dụ: Nhân viên điều độ bãi / Kế toán viên / Khách hàng vãng lai]
- **I want to** [Hành động / Tính năng muốn thực hiện]
- **So that** [Mục đích / Giá trị nghiệp vụ mang lại]

**Mức độ ưu tiên (Priority):** Must Have / Should Have / Could Have (MoSCoW)
**Story Points ước tính:** [1 / 2 / 3 / 5 / 8]
**Phụ thuộc (Dependencies):** [Các story hoặc API tiền đề nếu có]

---

#### Quy Tắc Nghiệp Vụ Liên Quan (Business Rules - BR):
- **BR-01:** [Ví dụ: Số container phải tuân theo chuẩn ISO 6346 gồm 4 chữ cái và 7 chữ số]
- **BR-02:** [Ví dụ: Không được phép cập nhật khi đơn hàng đã ở trạng thái ĐÃ DUYỆT]

---

#### Tiêu Chí Chấp Nhận (Acceptance Criteria - AC):

##### Kịch bản 1: Luồng thành công chính (Happy Path)
- **Given** [Tiền điều kiện: người dùng đã đăng nhập với vai trò X và đang ở màn hình Y]
- **When** [Người dùng nhập dữ liệu hợp lệ và bấm nút "Xác nhận"]
- **Then** [Hệ thống lưu thành công thông tin vào cơ sở dữ liệu]
- **And** [Hệ thống hiển thị thông báo thành công: "Tạo lệnh thành công"]
- **And** [Trạng thái của bản ghi chuyển thành "CHỜ XỬ LÝ"]

##### Kịch bản 2: Bỏ trống trường dữ liệu bắt buộc (Validation Error)
- **Given** [Người dùng đang ở form tạo mới]
- **When** [Người dùng bỏ trống trường bắt buộc [Field A] và bấm "Xác nhận"]
- **Then** [Hệ thống không gửi request lưu]
- **And** [Hiển thị cảnh báo màu đỏ dưới trường [Field A]: "[Tên trường] không được để trống"]

##### Kịch bản 3: Dữ liệu không hợp lệ / Vi phạm định dạng (Invalid Format)
- **Given** [Người dùng đang nhập thông tin]
- **When** [Người dùng nhập [Field B] sai định dạng quy định]
- **Then** [Hệ thống hiển thị lỗi: "Giá trị không đúng định dạng"]

##### Kịch bản 4: Vi phạm ràng buộc logic nghiệp vụ (Business Rule Conflict)
- **Given** [Đối tượng đang ở trạng thái không cho phép chỉnh sửa]
- **When** [Người dùng cố gắng thực hiện hành động]
- **Then** [Hệ thống chặn hành động và thông báo: "[Lý do từ chối]"]

##### Kịch bản 5: Phân quyền & Bảo mật (Access Control)
- **Given** [Người dùng không có quyền [Tên Permission]]
- **When** [Người dùng truy cập vào tính năng]
- **Then** [Hệ thống ẩn nút chức năng hoặc trả về lỗi 403 Forbidden]
```

---

## 3. Checklist Kiểm Tra Chất Lượng Trước Khi Hoàn Tất

1. [ ] Đã tách biệt rõ ràng giữa **What** (Cần làm gì, giá trị gì) và **How** (Không lạm dụng chỉ định chi tiết ngôn ngữ lập trình / công nghệ cụ thể trong story trừ khi bắt buộc)?
2. [ ] Đã bao quát đủ 4 nhóm kịch bản AC:
   - Happy Path (Luồng chuẩn).
   - Validation & Mandatory Fields (Kiểm tra dữ liệu đầu vào).
   - Business Constraints & Negative Cases (Điều kiện nghiệp vụ vi phạm).
   - Edge Cases & Concurrency (Giới hạn số ký tự, bấm 2 lần liên tiếp / double-click, quyền hạn).
3. [ ] Các thông báo lỗi (Error Messages) có được viết cụ thể, thân thiện với người dùng không?
