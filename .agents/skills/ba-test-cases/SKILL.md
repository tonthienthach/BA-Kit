---
name: ba-test-cases
description: "Thiết kế ma trận kịch bản kiểm thử (Test Scenarios) và Test Cases chi tiết từ User Story, Acceptance Criteria hoặc Use Case để phục vụ kiểm thử chấp nhận người dùng (UAT) và phối hợp cùng QA/QC. USE WHEN the user says 'viết test case', 'tạo kịch bản kiểm thử', 'tạo test scenarios', 'sinh test cases cho tính năng', '/testcase', or asks to create test scenarios and acceptance test cases."
---

# Thiết Kế Ma Trận Kiểm Thử Nghiệp Vụ & UAT Test Cases

Kỹ năng này giúp BA chuyển hóa các User Story, Acceptance Criteria (AC) và quy tắc nghiệp vụ thành **Ma trận Kịch bản Kiểm thử (Test Scenarios)** và **Test Cases chi tiết**, phục vụ cho việc kiểm thử chấp nhận người dùng (User Acceptance Testing - UAT) và hỗ trợ đội QA/QC bao quát toàn diện các góc cạnh của tính năng.

---

## 1. Phương Pháp Thiết Kế Test Case Toàn Diện

Để không bỏ sót kịch bản, áp dụng 5 kỹ thuật cốt lõi:
1. **Kiểm thử Luồng Chuẩn (Happy Path Testing):** Người dùng nhập đúng dữ liệu, đúng trình tự, hệ thống xử lý hoàn hảo.
2. **Phân Vùng Tương Đương (Equivalence Partitioning):** Gom nhóm dữ liệu hợp lệ và không hợp lệ thành từng vùng để chọn đại diện kiểm thử.
3. **Phân Tích Giá Trị Biên (Boundary Value Analysis - BVA):** Kiểm tra tại các cận: Min, Min-1, Min+1, Max, Max-1, Max+1, rỗng (Null/Empty).
4. **Kiểm thử Quy Tắc Nghiệp Vụ & Ngoại Lệ (Business Rule & Negative Testing):** Cố tình vi phạm các điều kiện ràng buộc để kiểm tra khả năng bắt lỗi và thông báo thân thiện.
5. **Kiểm thử Phân Quyền & Giới Hạn (Security & Concurrency Testing):** Tài khoản không đúng quyền truy cập, thao tác click đúp (Double-click) liên tiếp.

---

## 2. Bảng Ma Trận Kịch Bản Kiểm Thử (Test Scenarios Matrix)

| Scenario ID | Tên Kịch Bản Kiểm Thử | Mục Tiêu Nghiệp Vụ | Mức Độ Ưu Tiên |
|---|---|---|---|
| TS-01 | Kiểm thử tạo mới bản ghi thành công với dữ liệu hợp lệ | Xác nhận luồng chính hoạt động trơn tru | P1 (Cao nhất) |
| TS-02 | Kiểm thử xác thực các trường thông tin bắt buộc | Đảm bảo hệ thống chặn submit khi thiếu thông tin cốt lõi | P1 |
| TS-03 | Kiểm thử định dạng và độ dài tối đa các trường | Ngăn ngừa lỗi tràn bộ nhớ hoặc lưu dữ liệu rác | P2 |
| TS-04 | Kiểm thử vi phạm quy tắc nghiệp vụ đặc thù | Đảm bảo các logic kinh doanh được thực thi nghiêm ngặt | P1 |
| TS-05 | Kiểm thử phân quyền truy cập chức năng | Xác nhận chỉ người dùng đúng role mới được phép thao tác | P2 |
| TS-06 | Kiểm thử xử lý khi mạng gián đoạn hoặc bấm nhiều lần | Đảm bảo tính toàn vẹn và không tạo trùng lặp bản ghi | P3 |

---

## 3. Bảng Chi Tiết Test Cases Chuẩn UAT / QA

```markdown
### Tính Năng: [Tên Tính Năng / Phân Hệ]
**Tài liệu tham chiếu:** [Mã User Story / Use Case liên quan]
**Người tạo:** [BA / Tester]
**Ngày tạo:** [YYYY-MM-DD]

| Test Case ID | Scenario ID | Tóm Tắt Mục Tiêu (Description) | Điều Kiện Tiên Quyết (Preconditions) | Các Bước Thực Hiện (Test Steps) | Dữ Liệu Kiểm Thử (Test Data) | Kết Quả Kỳ Vọng (Expected Results) | Loại Test (Type) | Mức Ưu Tiên |
|---|---|---|---|---|---|---|---|---|
| **TC-01** | TS-01 | Tạo mới thành công với toàn bộ thông tin hợp lệ | Tài khoản đã đăng nhập với quyền Quản trị viên; đang ở màn hình tạo mới | 1. Nhập đầy đủ các trường bắt buộc và tùy chọn<br>2. Nhấn nút "Lưu"<br>3. Quan sát phản hồi | Mã: "CONT-1029", Loại: "40HC", Trọng lượng: 24.5 | - Bản ghi được lưu vào DB với trạng thái "MỚI"<br>- Hiển thị toast thông báo: "Tạo mới thành công"<br>- Màn hình chuyển về danh sách, hiển thị dòng vừa tạo | Positive | P1 |
| **TC-02** | TS-02 | Bỏ trống trường bắt buộc [Tên trường A] | Đang ở form tạo mới | 1. Nhập các trường khác<br>2. Bỏ trống trường [Tên trường A]<br>3. Nhấn "Lưu" | [Tên trường A] = rỗng (Empty) | - Form không được gửi đi<br>- Đánh dấu viền đỏ trường [Tên trường A]<br>- Hiển thị thông báo: "[Tên trường A] không được để trống" | Negative | P1 |
| **TC-03** | TS-03 | Nhập độ dài vượt quá số ký tự cho phép | Đang ở form tạo mới | 1. Nhập trường [Tên trường B] dài hơn quy định<br>2. Nhấn "Lưu" | Chuỗi ký tự có độ dài Max + 1 | - Hệ thống giới hạn không cho gõ tiếp HOẶC báo lỗi: "Tối đa [X] ký tự" | Boundary | P2 |
| **TC-04** | TS-04 | Vi phạm quy tắc nghiệp vụ: Mã đã tồn tại | Đã có bản ghi "ABC-123" trong hệ thống | 1. Nhập mã "ABC-123"<br>2. Nhập các thông tin khác<br>3. Nhấn "Lưu" | Mã = "ABC-123" | - Hệ thống không lưu bản ghi<br>- Hiển thị thông báo lỗi: "Mã ABC-123 đã tồn tại trong hệ thống" | Business Rule | P1 |
| **TC-05** | TS-05 | Người dùng không có quyền truy cập chức năng | Đăng nhập bằng tài khoản "Khách" (Viewer) | 1. Truy cập vào đường dẫn tính năng<br>2. Hoặc kiểm tra sự xuất hiện của nút "Tạo mới" | Role = "Viewer" | - Nút "Tạo mới" bị ẩn (hoặc disabled)<br>- Nếu truy cập URL trực tiếp thì trả về trang 403 Forbidden | Security / RBAC | P2 |
| **TC-06** | TS-06 | Kiểm thử bấm liên tiếp nút Lưu (Double-click submit) | Đang ở form tạo mới với dữ liệu hợp lệ | 1. Nhập form hợp lệ<br>2. Click nút "Lưu" 2–3 lần thật nhanh | Dữ liệu hợp lệ | - Nút "Lưu" chuyển trạng thái Loading và bị vô hiệu hóa ngay sau click đầu tiên<br>- Chỉ có đúng 1 bản ghi được tạo ra trong DB | Concurrency / UI | P3 |
```

---

## 4. Tiêu Chuẩn Đạt Nghiệm Thu (Exit / Sign-off Criteria)
- 100% Test Cases độ ưu tiên P1 (Critical) phải **Pass**.
- Không còn bất kỳ lỗi nào gây nghẽn luồng (Blocker / Critical bug) chưa được giải quyết.
- Các lỗi P2/P3 còn tồn đọng phải có sự chấp thuận bằng văn bản của Product Owner trước khi release.
