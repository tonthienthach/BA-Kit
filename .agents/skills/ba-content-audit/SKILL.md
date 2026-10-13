---
name: ba-content-audit
description: "Rà soát toàn diện tài liệu yêu cầu, phát hiện mâu thuẫn giữa các phần, kiểm tra chất lượng và chấm điểm mức độ sẵn sàng bàn giao cho Dev & Test (QA Readiness Review). USE WHEN the user says 'kiểm tra tài liệu', 'audit tài liệu', 'rà soát mâu thuẫn', 'review spec', 'chấm điểm SRS', '/audit', '/review', or asks to audit requirement quality and detect conflicts."
---

# Kiểm Tra Chất Lượng & Rà Soát Mâu Thuẫn Tài Liệu (Content Audit & QC Gate)

Kỹ năng này hoạt động như một **Quality Gate độc lập (Trưởng ban thẩm định tài liệu)**, tự động soi chiếu toàn bộ tài liệu đặc tả (SRS, User Story, Use Case, ERD, API Specs) để phát hiện các lỗ hổng logic, mâu thuẫn chéo giữa các phần, và chấm điểm mức độ sẵn sàng bàn giao cho đội ngũ Dev và QA/QC.

---

## 🛡️ 4 Cổng Kiểm Định Chất Lượng (The 4 Quality Gates)

### Gate 1: Scope Gate (Cổng Phạm Vi)
- Kiểm tra tính phân định rõ ràng giữa In-Scope và Out-of-Scope.
- Phát hiện rủi ro "Phình phạm vi" (Scope Creep): Liệu có chức năng nào đang được mô tả lấn sân sang các phân hệ khác không?
- Kiểm tra mã hóa Feature/Story có thống nhất từ đầu đến cuối không.

### Gate 2: Behavior Gate (Cổng Hành Vi & Logic)
- **Tính đầy đủ của luồng xử lý:** Mọi luồng chính (Happy Path) có đầy đủ ít nhất 2–3 luồng ngoại lệ (Validation error, Business conflict, Timeout/System error) không?
- **Logic trạng thái (State Consistency):** Các trạng thái trong Use Case có khớp với Sơ đồ máy trạng thái (State Diagram) không? Có trạng thái nào bị "kẹt" (dead-end state không có đường thoát) không?

### Gate 3: Specification Gate (Cổng Ràng Buộc Kỹ Thuật)
- **Tính nhất quán của dữ liệu (Data Consistency):** Tên trường, kiểu dữ liệu, độ dài tối đa giữa Từ điển dữ liệu (Data Dictionary), Bảng DB ERD và Form UI có bị đá nhau không?
- **Quy tắc phân quyền (RBAC):** Mọi hành động Create, Read, Update, Delete có được gán Role rõ ràng không? Có hành động nào bị bỏ ngỏ quyền không?

### Gate 4: Testability Gate (Cổng Khả Năng Kiểm Thử - QC Readiness)
- Acceptance Criteria có đo lường được (Testable) không, hay còn dùng từ ngữ mơ hồ ("nhanh", "dễ dùng", "hợp lý")?
- Chấm điểm **QA Readiness Score (Thang điểm 0–100)**: Đạt từ 85/100 trở lên mới đủ điều kiện bàn giao sang đội Test.

---

## 📋 Mẫu Báo Cáo Thẩm Định Tài Liệu (Audit & QC Review Report)

```markdown
# Báo Cáo Thẩm Định & Kiểm Soát Chất Lượng Tài Liệu (Quality Audit Report)

- **Tài liệu thẩm định:** [Tên tài liệu / Đường dẫn file]
- **Phiên bản:** [1.0]
- **Người thẩm định:** [AI Lead Auditor]
- **QA Readiness Score:** [85/100] -> [PASSED / NEEDS REVISION]

---

### 1. Bảng Điểm 4 Cổng Kiểm Định
| Cổng Kiểm Định | Tiêu Chí Đánh Giá | Điểm Số | Trạng Thái |
|---|---|---|---|
| Gate 1: Scope | Rõ ràng ranh giới in/out-scope, không phình dự án | 25/25 | ✅ Đạt |
| Gate 2: Behavior | Đủ luồng chính, luồng rẽ và xử lý lỗi | 20/25 | ⚠️ Thiếu luồng timeout |
| Gate 3: Specification | Nhất quán tên trường, kiểu dữ liệu, DB & UI | 22/25 | ⚠️ Lệch kiểu dữ liệu |
| Gate 4: Testability | Tiêu chí nghiệm thu rõ ràng, đo lường được | 18/25 | ⚠️ Một số AC còn mơ hồ |
| **TỔNG ĐIỂM** | **Mức độ sẵn sàng bàn giao** | **85/100** | **ĐẠT ĐIỀU KIỆN (Có lưu ý)** |

---

### 2. Danh Sách Mâu Thuẫn & Lỗ Hổng Phát Hiện Được (Findings)

#### 🔴 Lỗi Nghiêm Trọng (Critical - Cần sửa ngay):
- **ISSUE-01 [Mâu thuẫn kiểu dữ liệu]:** Tại Mục 3.1 quy định trường `container_no` dài 11 ký tự, nhưng tại Bảng DB ERD lại khai báo `varchar(20)`. Cần chuẩn hóa về `varchar(11)`.

#### 🟡 Cảnh Báo Logic (Warning - Cần bổ sung):
- **WARN-01 [Thiếu luồng ngoại lệ]:** Tại Use Case UC-02, khi người dùng mất mạng trong lúc thanh toán chưa mô tả cơ chế retry hoặc thông báo lỗi cho người dùng.
- **WARN-02 [AC chưa đo lường được]:** Tại Story US-03, AC viết "Hệ thống tải trang nhanh chóng" -> Cần đổi thành "Thời gian phản hồi không quá 1000ms".

---

### 3. Đề Xuất Hành Động Chỉnh Sửa (Action Items)
1. Cập nhật lại trường `container_no` trong file SRS để khớp với ERD.
2. Bổ sung Luồng ngoại lệ 4b (Xử lý lỗi timeout mạng) vào Use Case UC-02.
3. Chỉnh sửa AC của Story US-03 theo chuẩn Gherkin có số đo định lượng.
```
