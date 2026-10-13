---
name: ba-impact-analysis
description: "Đánh giá và phân tích tác động toàn diện khi có yêu cầu thay đổi (Change Request - CR) hoặc nâng cấp tính năng: As-Is vs To-Be, tác động UI, API, DB Schema, dữ liệu lịch sử, tích hợp liên phân hệ, và rủi ro tương thích ngược. USE WHEN the user says 'đánh giá tác động', 'phân tích impact', 'làm impact analysis cho CR', 'phân tích yêu cầu thay đổi', '/cr', '/impact', or asks to assess the impact of a system change."
---

# Đánh Giá Tác Động Thay Đổi Nghiệp Vụ & Hệ Thống (CR & Impact Analysis)

Kỹ năng này giúp BA phân tích đa chiều mọi góc cạnh bị ảnh hưởng khi phát sinh một **Yêu Cầu Thay Đổi (Change Request - CR)** hoặc khi nâng cấp một tính năng sẵn có, tránh tình trạng "sửa chỗ này hỏng chỗ khác" (side effects).

---

## 1. Khung Phân Tích Tác Động Toàn Diện (6 Chiều)

Mỗi thay đổi cần được rà soát qua ma trận 6 chiều sau:

1. **Nghiệp vụ & Người dùng (Business & User Workflows):**
   - Luồng As-Is (Hiện tại) vs Luồng To-Be (Sau thay đổi).
   - Ai được lợi, ai bị thay đổi thói quen thao tác, có cần đào tạo lại người dùng không?
2. **Giao diện & Trải nghiệm (UI/UX Specs):**
   - Màn hình nào bị sửa đổi (Thêm cột, ẩn nút, đổi màu trạng thái, thêm bộ lọc)?
   - Các màn hình liên quan có bị ảnh hưởng bố cục hoặc hiển thị không?
3. **Logic Backend & API (Application & Services):**
   - API nào cần sửa request/response payload? Có vi phạm tính tương thích ngược (Backward Compatibility) không?
   - Các service nội bộ khác đang gọi API này có bị ảnh hưởng (Breaking Change) không?
4. **Cơ sở dữ liệu & Dữ liệu lịch sử (Database & Data Migration):**
   - Thêm cột mới có cho phép `NULL` không? Có cần giá trị mặc định (`DEFAULT`)?
   - Các bản ghi cũ (Historical Data) đã tạo từ trước sẽ được xử lý ra sao? Có cần script migrate dữ liệu quá khứ không?
5. **Tích hợp bên ngoài & Tích hợp chéo (Third-party & Cross-service):**
   - Có ảnh hưởng đến các đối tác, cổng thanh toán, Hải quan, ERP, hệ thống báo cáo (Reporting)?
   - Có event realtime / message queue nào cần thay đổi cấu trúc không?
6. **Báo cáo & Thống kê (Reports & BI):**
   - Các báo cáo tổng hợp hiện tại đang tính toán dựa trên trạng thái hoặc cột cũ có bị sai số liệu không?

---

## 2. Mẫu Báo Cáo Phân Tích Tác Động Chuẩn (Impact Analysis Report)

```markdown
# [Mã CR] - Báo Cáo Đánh Giá Tác Động Thay Đổi (Impact Analysis)

- **Mã CR / Task:** [CR-2026-001]
- **Tên yêu cầu:** [Tóm tắt thay đổi, ví dụ: Bổ sung luồng duyệt 2 bước cho lệnh hạ cont rỗng]
- **Người đề xuất:** [Khách hàng / Bộ phận vận hành / Product Owner]
- **BA phụ trách:** [Tên BA]
- **Mức độ rủi ro:** [Thấp / Trung bình / Cao / Nghiêm trọng]

---

## 1. Tóm Tắt Thay Đổi (As-Is vs To-Be)

| Tiêu Chí | Hiện Tại (As-Is) | Đề Xuất Mới (To-Be) | Lý Do & Giá Trị |
|---|---|---|---|
| Luồng phê duyệt | Tạo lệnh xong là áp dụng ngay lập tức (1 bước). | Phải qua bước Trưởng ca duyệt trước khi có hiệu lực (2 bước). | Giảm thiểu rủi ro cấp sai vị trí bãi. |
| Trạng thái | DRAFT -> APPROVED | DRAFT -> PENDING_APPROVAL -> APPROVED | Quản lý minh bạch lịch sử duyệt. |

---

## 2. Ma Trận Đánh Giá Tác Động Chi Tiết

### 2.1 Tác Động Giao Diện (UI/UX)
- **Màn hình [Tên màn hình]:**
  - Bổ sung nút "Gửi duyệt" thay cho nút "Phê duyệt" đối với tài khoản Nhân viên.
  - Bổ sung tab danh sách "Chờ duyệt" dành riêng cho tài khoản Trưởng ca.
  - Hiển thị thêm badge trạng thái mới: `Chờ duyệt` (màu cam).

### 2.2 Tác Động Logic Nghiệp Vụ & API
- **Endpoint bị ảnh hưởng:**
  - `POST /api/v1/orders`: Đổi trạng thái mặc định từ `APPROVED` sang `PENDING_APPROVAL`.
  - Bổ sung endpoint mới: `PUT /api/v1/orders/{id}/approve` và `PUT /api/v1/orders/{id}/reject`.
- **Breaking Change Warning:**
  - Nếu Mobile App hoặc hệ thống đối tác đang trực tiếp gọi `POST /api/v1/orders` và kỳ vọng trạng thái `APPROVED` ngay lập tức -> **CÓ NGUY CƠ LỖI**.
  - Giải pháp tương thích ngược: Bổ sung cờ `auto_approve` cho các đối tác cũ trong giai đoạn chuyển tiếp.

### 2.3 Tác Động Cơ Sở Dữ Liệu & Dữ Liệu Quá Khứ
- **Thay đổi Schema:**
  - Bổ sung bảng/cột: `approved_by` (varchar), `approved_at` (timestamp), `reject_reason` (nvarchar).
- **Phương án cho dữ liệu cũ (Legacy Data):**
  - Toàn bộ đơn hàng đã tạo trước thời điểm release sẽ giữ nguyên trạng thái `APPROVED`.
  - Không cần sửa đổi các bản ghi lịch sử, chỉ áp dụng quy tắc mới cho các bản ghi tạo mới từ ngày release.

### 2.4 Tác Động Đến Báo Cáo & Hệ Thống Khác
- **Báo cáo sản lượng:**
  - Báo cáo chỉ đếm các đơn `APPROVED`. Các đơn đang ở `PENDING_APPROVAL` chưa được tính vào sản lượng trong ca.

---

## 3. Rủi Ro & Kế Hoạch Ứng Phó (Risks & Mitigation Plan)

| Rủi Ro Nhận Diện | Khả Năng Xảy Ra | Mức Độ Nghiêm Trọng | Phương Án Giảm Thiểu / Ứng Phó |
|---|---|---|---|
| Trưởng ca chậm duyệt làm ùn ứ xe tại cổng | Cao | Cao | Bổ sung thông báo Realtime / Chuông báo khi có đơn chờ duyệt quá 5 phút. |
| Dữ liệu cũ bị đơ khi mở form chỉnh sửa | Thấp | Trung bình | Viết kiểm thử hồi quy (Regression Test) cho các đơn hàng cũ. |

---

## 4. Kế Hoạch Rollback (Nếu Có Sự Cố Khi Release)
- Giữ cấu hình cờ tính năng (Feature Flag): `ENABLE_TWO_STEP_APPROVAL = false` trong file cấu hình để có thể lập tức quay về luồng cũ mà không cần deploy lại toàn bộ mã nguồn.
```

---

## 3. Khuyến Nghị Dành Cho BA Khi Làm CR
- Luôn kiểm tra danh sách đối tượng người dùng đang dùng tính năng hiện tại.
- Không bao giờ xóa cột trong DB mà phải qua chu kỳ Deprecation (đánh dấu cũ -> hỗ trợ song song -> gỡ bỏ sau).
- Luôn yêu cầu kiểm thử hồi quy (Regression Testing) đối với các tính năng phụ thuộc.
