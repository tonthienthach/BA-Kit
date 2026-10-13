---
name: ba-brainstorm
description: "Phỏng vấn sâu 7 bước để khơi gợi và làm rõ ý tưởng thô khi mới bắt đầu dự án, trước khi có tài liệu hay cuộc họp cụ thể. USE WHEN the user says 'brainstorm ý tưởng', 'khơi gợi yêu cầu', 'phỏng vấn làm rõ ý tưởng', 'chưa rõ ý tưởng cần làm gì', '/brainstorm', or wants deep requirements elicitation from a vague concept."
---

# Phỏng Vấn Sâu 7 Bước Khơi Gợi Yêu Cầu (Requirements Elicitation)

Kỹ năng này đóng vai trò như một **Chuyên Gia Tư Vấn Nghiệp Vụ Cấp Cao (Lead BA Consultant)**, tiến hành phỏng vấn có cấu trúc với Product Owner hoặc Khách hàng khi họ **chỉ mới có một ý tưởng mơ hồ** ("Tôi muốn làm một app giao hàng...", "Tôi muốn quản lý bãi xe thông minh...") nhằm đào sâu vấn đề và định hình sản phẩm trước khi bước vào quy trình tài liệu hóa.

---

## 🎯 Quy Trình Phỏng Vấn 7 Bước Có Cấu Trúc

Agent sẽ tương tác qua từng bước hoặc tổng hợp bảng câu hỏi/phân tích theo 7 trụ cột:

### Bước 1: Vấn Đề Cốt Lõi & Lý Do Tồn Tại (Problem & "5 Whys")
- Vấn đề thực sự khách hàng đang gặp phải là gì? Nỗi đau lớn nhất (Pain points) hiện tại là gì?
- Tại sao phải giải quyết vấn đề này ngay bây giờ? Nếu không làm thì tổn thất điều gì?

### Bước 2: Chân Dung Người Dùng Hưởng Lợi (Target Personas)
- Ai là người trực tiếp bấm trên màn hình (Direct Users)?
- Ai là người gián tiếp hưởng lợi hoặc xem báo cáo (Stakeholders / Executives)?
- Hành vi và thói quen công nghệ của họ ở mức nào?

### Bước 3: Mục Tiêu Kinh Doanh & Chỉ Số Thành Công (Goals & Success Metrics)
- Sản phẩm này thành công khi đạt được điều gì?
- Các chỉ số đo lường (KPIs / OKRs): Giảm bao nhiêu % thời gian thao tác, giảm bao nhiêu sai sót, tăng bao nhiêu doanh thu?

### Bước 4: Giới Hạn Phạm Vi Giải Pháp (Scoping: Must vs Nice-to-have)
- Phiên bản tối thiểu (MVP) bắt buộc phải có những tính năng sống còn nào?
- Những tính năng nào "thấy hay nhưng có thể dời sang giai đoạn 2" (Out-of-scope for MVP)?

### Bước 5: Ràng Buộc Kỹ Thuật & Giả Định (Constraints & Assumptions)
- Ràng buộc về hạ tầng: Chạy trên Web, Mobile, thiết bị cầm tay chuyên dụng (Zebra/Honeywell)?
- Có phải tích hợp với hệ thống cũ (Legacy ERP, CRM, Cổng thanh toán, Hải quan) không?
- Giả định về đường truyền mạng (Có cần chế độ Offline khi mất mạng không)?

### Bước 6: Trải Nghiệm Người Dùng Lý Tưởng (Ideal User Journey)
- Phác họa hành trình từ lúc người dùng mở ứng dụng đến khi họ hoàn thành mục tiêu.
- Cảm xúc mong muốn: Tốc độ cực nhanh (dưới 3 click) hay tính chặt chẽ, bảo mật cao?

### Bước 7: Đề Xuất Phương Án & Kiến Trúc Giải Pháp (Solution Blueprint)
- Tổng hợp lại toàn bộ thông tin thành bản định hướng sản phẩm (Product Concept Sheet).
- Đề xuất mô hình nghiệp vụ sơ bộ và sẵn sàng kích hoạt lệnh `/analyze-raw` hoặc `/diagram`.

---

## 📋 Mẫu Báo Cáo Định Hướng Sản Phẩm (Product Concept Sheet)

```markdown
# [Tên Ý Tưởng Sản Phẩm] - Báo Cáo Khám Phá & Định Hướng (Concept Blueprint)

- **Ngày thực hiện:** [YYYY-MM-DD]
- **Tác giả:** [Lead BA]
- **Trạng thái:** [Concept Approved / Under Clarification]

---

### 1. Tuyên Bố Vấn Đề (Problem Statement)
- **Bối cảnh hiện tại:** [Mô tả hiện trạng và các trở ngại]
- **Nỗi đau chính (Pain Points):** [Liệt kê 3 nỗi đau lớn nhất]

### 2. Giá Trị Cốt Lõi (Core Value Proposition)
- [Hệ thống này giúp ai, làm được việc gì, nhanh hơn hoặc tốt hơn bao nhiêu lần]

### 3. Đối Tượng Người Dùng Chính (Key Personas)
| Persona | Vai Trò Thực Tế | Nhu Cầu Cốt Lõi |
|---|---|---|
| Persona 1 | ... | ... |
| Persona 2 | ... | ... |

### 4. Ranh Giới Phạm Vi MVP (Scope Definition)
- **IN-SCOPE (Bắt buộc cho MVP):**
  - Chức năng A...
  - Chức năng B...
- **OUT-OF-SCOPE (Giai đoạn sau):**
  - Chức năng C (Báo cáo nâng cao, AI dự đoán)...

### 5. Ràng Buộc & Giả Định Chính (Constraints & Assumptions)
- Thiết bị triển khai: ...
- Tích hợp bắt buộc: ...

### 6. Đề Xuất Bước Kế Tiếp
- Kích hoạt `/diagram` để dựng Sơ đồ luồng tổng quan (Context / User Flow).
- Kích hoạt `/story` hoặc `/srs` để bắt đầu phân rã yêu cầu.
```
