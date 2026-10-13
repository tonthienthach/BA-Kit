---
name: ba-raw-analysis
description: "Phân tích và chuyển hóa dữ liệu thô (Meeting transcripts, ghi chú phỏng vấn, voice-to-text, chat logs, tài liệu RFP sơ bộ) thành bản tóm tắt khám phá yêu cầu (Discovery Summary), bảng thuật ngữ, quyết định đã chốt, vấn đề bỏ ngỏ và bộ câu hỏi làm rõ (Clarification Questions). USE WHEN the user says 'phân tích dữ liệu thô', 'xử lý transcript họp', 'bóc tách yêu cầu từ biên bản họp', 'tổng hợp ghi chú họp', '/analyze-raw', '/raw', or inputs raw conversational transcripts or meeting notes."
---

# Phân Tích & Chuyển Hóa Dữ Liệu Thô (Raw Data Analysis & Ingestion)

Kỹ năng này hiện thực hóa bước **đầu chuỗi quan trọng nhất** trong quy trình BA của AI4BA: Chuyển đổi dữ liệu hỗn tạp, phi cấu trúc (Transcript cuộc họp Zoom/Teams/Otter, ghi chú vội, tin nhắn chat rời rạc) thành tài liệu khám phá có cấu trúc, đồng thời chỉ ra các "điểm mù" (blind spots) và lỗ hổng thông tin mà khách hàng chưa nói rõ.

---

## ⚠️ Nguyên Tắc Cốt Lõi: "Transcript Không Phải Là SRS"
1. **Dữ liệu thô luôn chứa nhiễu (Noise):** Lời chào hỏi, tranh luận dở dang, ý kiến cá nhân chưa được phê duyệt, thông tin bị đổi ý ở cuối buổi họp.
2. **Nguy cơ Garbage In - Garbage Out:** Nếu đưa trực tiếp transcript vào viết SRS ngay, AI sẽ bị ảo giác, đưa các thông tin chưa chốt vào tài liệu chính thức hoặc bỏ sót các ràng buộc ngầm.
3. **Mục tiêu của bước này:** Làm sạch -> Bóc tách sự thật (Facts) -> Tách biệt Quyết định (Decisions) vs Tồn đọng (Open Issues) -> Đặt câu hỏi làm rõ (Clarification Questions).

---

## 🔄 Quy Trình 5 Bước Phân Tích Dữ Liệu Thô

### Bước 1: Lọc Nhiễu & Phân Đoạn Ngữ Cảnh (Clean & Segment)
- Loại bỏ toàn bộ nội dung chào hỏi, tán gẫu, sự cố kỹ thuật micro/mạng.
- Xác định bối cảnh: Cuộc họp giữa ai với ai? Mục tiêu buổi họp là gì?

### Bước 2: Bóc Tách Thực Thể & Các Bên Liên Quan (Entity & Stakeholder Mapping)
- **Stakeholders tham gia:** Tên, vai trò (Khách hàng, Dev, PM, End-user).
- **Góc nhìn & Kỳ vọng:** Phía nghiệp vụ muốn gì? Phía kỹ thuật lo ngại điều gì?
- **Thuật ngữ chuyên ngành (Domain Glossary):** Liệt kê các từ viết tắt, tiếng lóng nghiệp vụ xuất hiện trong cuộc họp và định nghĩa ngắn.

### Bước 3: Phân Loại Quyết Định vs Vấn Đề Còn Bỏ Ngỏ (Decisions vs Open Issues)
- **Quyết định đã CHỐT (Agreed Decisions):** Các điểm mà các bên đã đồng thuận và thống nhất phương án xử lý.
- **Vấn đề CHƯA CHỐT (Open Issues / Pending):** Các điểm còn bất đồng ý kiến, cần xin ý kiến cấp trên, hoặc tạm hoãn lại.
- **Hành động tiếp theo (Action Items):** Ai làm gì, hạn chót khi nào.

### Bước 4: Phân Tích Lỗ Hổng & Điểm Mù (Gap & Ambiguity Analysis)
Rà soát toàn bộ nội dung để tìm ra những điểm thiếu sót nghiêm trọng mà cuộc họp chưa bàn tới:
- Thiếu điều kiện ngoại lệ (Nếu mất mạng, lỗi hệ thống, số dư không đủ thì sao?).
- Thiếu giới hạn biên (Dữ liệu tối đa bao nhiêu, định dạng trường thế nào?).
- Thiếu phân quyền (Ai được phép xóa, ai chỉ được xem?).
- **Sinh Bộ Câu Hỏi Làm Rõ (Clarification Questions):** Soạn sẵn 3–7 câu hỏi trúng đích, chuyên nghiệp để BA gửi email hoặc phỏng vấn lại khách hàng.

### Bước 5: Tổng Hợp Bản Khám Phá Yêu Cầu (Requirements Discovery Summary)
Xuất ra tài liệu tóm tắt có cấu trúc theo khung chuẩn bên dưới để sẵn sàng chuyển tiếp sang các skill tiếp theo (`ba-diagram`, `ba-srs`, `ba-user-story`).

---

## 📋 Cấu Trúc Đầu Ra Chuẩn (Output Format)

```markdown
# [Tên Dự Án / Buổi Họp] - Báo Cáo Phân Tích Dữ Liệu Thô (Raw Data Analysis)

- **Ngày họp:** [YYYY-MM-DD]
- **Thành phần tham dự:** [Liệt kê người tham gia và vai trò]
- **Mục tiêu buổi làm việc:** [Mục tiêu cốt lõi]

---

### 1. Bảng Thuật Ngữ Nghiệp Vụ Phát Hiện Được (Domain Glossary)
| Thuật Ngữ | Ý Nghĩa Trong Ngữ Cảnh Này |
|---|---|
| Cont hạ bãi | Container hàng nhập được cẩu từ xe xuống bãi chờ lấy |
| EIR | Electronic Equipment Interchange Receipt (Phiếu giao nhận cont điện tử) |

---

### 2. Danh Sách Quyết Định Đã Thống Nhất (Agreed Decisions)
- **DEC-01:** [Ví dụ: Thống nhất chỉ cho phép tạo lệnh khi container đã thanh toán phí lưu bãi]
- **DEC-02:** [Ví dụ: Áp dụng cơ chế quét QR code thay vì nhập tay số container]

---

### 3. Vấn Đề Chưa Chốt & Điểm Cần Làm Rõ (Open Issues & Ambiguities)
- **ISSUE-01:** [Ví dụ: Chưa thống nhất thời gian timeout của cổng thanh toán là 5 hay 15 phút]
- **ISSUE-02:** [Ví dụ: Chưa quyết định nếu tài xế mất phiếu thì xử lý tại cổng hay vào văn phòng]

---

### 4. Bộ Câu Hỏi Làm Rõ Gửi Stakeholders (Clarification Questions)
*Dành cho BA gửi lại khách hàng/PO để xác nhận trước khi viết tài liệu chi tiết:*
1. **[Về luồng ngoại lệ]:** [Câu hỏi cụ thể 1]
2. **[Về phân quyền]:** [Câu hỏi cụ thể 2]
3. **[Về dữ liệu & tích hợp]:** [Câu hỏi cụ thể 3]

---

### 5. Danh Mục Tính Năng Sơ Bộ (Preliminary Feature Catalog)
| Mã Tính Năng | Tên Tính Năng | Mức Ưu Tiên Dự Kiến | Ghi Chú |
|---|---|---|---|
| FEAT-01 | Quét mã QR tại cổng | P1 (Must Have) | Thay thế nhập tay |
| FEAT-02 | Tra cứu lịch sử quét | P2 (Should Have) | Dành cho điều độ viên |

---

### 6. Đề Xuất Bước Tiếp Theo Trong Quy Trình BA
- [ ] Chạy lệnh `/diagram` để vẽ Sơ đồ quy trình (Flowchart) cho các quyết định đã chốt.
- [ ] Gửi Bộ câu hỏi làm rõ (Mục 4) cho khách hàng qua email.
- [ ] Chạy lệnh `/srs` hoặc `/story` ngay khi các điểm Issue được chốt phương án.
```
