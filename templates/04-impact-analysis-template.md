# Biểu Mẫu Báo Cáo Phân Tích Tác Động Thay Đổi (CR & Impact Analysis)

- **Mã CR:** CR-[YYYY]-[XXX]
- **Tên Yêu Cầu:** [Tóm tắt nội dung thay đổi]
- **Người Yêu Cầu:** [Khách hàng / PO]
- **BA Phụ Trách:** [Họ tên BA]
- **Đánh Giá Mức Rủi Ro:** [Thấp / Trung Bình / Cao]

---

## 1. So Sánh As-Is vs To-Be
| Tiêu Chí | Hiện Tại (As-Is) | Đề Xuất Mới (To-Be) | Lý Do & Giá Trị Mang Lại |
|---|---|---|---|
| Quy trình | ... | ... | ... |
| Trạng thái | ... | ... | ... |

---

## 2. Ma Trận Đánh Giá Tác Động 6 Chiều

1. **Giao diện (UI/UX):**
   - Màn hình bị ảnh hưởng: [Tên màn hình]
   - Chi tiết: Thêm/ẩn nút bấm, đổi vị trí, thêm cảnh báo...

2. **API & Logic Xử Lý (Backend):**
   - Endpoint: `[POST/PUT/GET] /api/...`
   - Breaking Change: Có / Không. Giải pháp tương thích ngược nếu có.

3. **Cơ Sở Dữ Liệu (Database):**
   - Thay đổi bảng/cột mới: [Tên bảng, tên cột, kiểu dữ liệu, null/not null]
   - Xử lý dữ liệu lịch sử (Legacy Data): Có cần script migrate dữ liệu cũ không?

4. **Tích Hợp Liên Phân Hệ (Cross-Service / 3rd Party):**
   - Các dịch vụ liên quan: [Tên service / Hệ thống ngoài]
   - Event message / Webhook bị ảnh hưởng.

5. **Báo Cáo & Thống Kê (Reporting):**
   - Các báo cáo bị ảnh hưởng công thức tính hoặc điều kiện lọc.

6. **Rủi Ro & Phương Án Rollback:**
   - Kế hoạch dự phòng nếu gặp sự cố khi triển khai (Feature toggle, script rollback).
