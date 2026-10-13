---
name: ba-srs
description: "Soạn thảo tài liệu đặc tả yêu cầu phần mềm (SRS - Software Requirements Specification) hoàn chỉnh từ yêu cầu thô, ghi chú cuộc họp, hoặc mô tả tính năng. USE WHEN the user says 'viết SRS', 'soạn tài liệu SRS cho <tính năng>', 'tạo đặc tả yêu cầu phần mềm', 'lập tài liệu SRS', '/srs', or asks to write a formal Software Requirements Specification document."
---

# Soạn Thảo Tài Liệu Đặc Tả Yêu Cầu Phần Mềm (SRS)

Kỹ năng này giúp Business Analyst (BA) chuyển hóa yêu cầu nghiệp vụ thô (ghi chú phỏng vấn, biên bản họp, tóm tắt ý tưởng khách hàng) thành một tài liệu **Software Requirements Specification (SRS)** chuyên nghiệp, có cấu trúc chặt chẽ, sẵn sàng bàn giao cho đội ngũ phát triển (Dev) và kiểm thử (QC).

---

## 1. Quy Trình 4 Bước Soạn Thảo SRS

### Bước 1: Tiếp nhận và làm rõ đầu vào (Input Ingestion & Clarification)
- **Thu thập thông tin:**
  - Mục tiêu nghiệp vụ (Business Goal & Problem Statement)
  - Đối tượng người dùng chính (Target Users / Personas)
  - Phạm vi tính năng (In-scope) và các phần nằm ngoài phạm vi (Out-of-scope)
  - Ràng buộc kỹ thuật / hệ sinh thái hiện tại (nếu có)
- **Đặt câu hỏi làm rõ:** Nếu đầu vào thiếu thông tin cốt lõi (như xử lý ngoại lệ, phân quyền, tích hợp hệ thống ngoài), liệt kê 2–4 câu hỏi trọng tâm trước khi hoàn thiện tài liệu.

### Bước 2: Xây dựng khung cấu trúc tài liệu SRS chuẩn

Tài liệu xuất ra cần tuân theo khung chuẩn công nghiệp (dựa trên IEEE 830 / ISO/IEC/IEEE 29148) gồm các phần sau:

```markdown
# [Tên Hệ Thống / Phân Hệ] - Tài Liệu Đặc Tả Yêu Cầu Phần Mềm (SRS)
**Mã tài liệu / Feature Code:** [Mã tính năng, ví dụ: SRS-OP-001]
**Tác giả (BA):** [Tên BA]
**Phiên bản:** [1.0]
**Trạng thái:** [Draft / Review / Approved]
**Ngày cập nhật:** [YYYY-MM-DD]

---

## 1. Giới Thiệu & Bối Cảnh (Introduction & Context)
### 1.1 Mục tiêu (Purpose & Objective)
- Nêu rõ vấn đề cần giải quyết và giá trị mang lại cho người dùng/doanh nghiệp.
### 1.2 Phạm vi (Scope)
- **Trong phạm vi (In-Scope):** Các chức năng sẽ phát triển trong giai đoạn này.
- **Ngoài phạm vi (Out-of-Scope):** Các tính năng hoãn lại sang phase sau hoặc không hỗ trợ.
### 1.3 Đối tượng người dùng & Quyền hạn (User Personas & Roles)
- Bảng liệt kê các vai trò tham gia hệ thống và quyền tương ứng.

---

## 2. Mô Tả Tổng Quan Hệ Thống (Overall Description)
### 2.1 Kiến trúc luồng tương tác tổng quát (System Workflow / Context Diagram)
- Sơ đồ hoặc mô tả tổng quan luồng đi của dữ liệu/nghiệp vụ.
### 2.2 Giả định và phụ thuộc (Assumptions & Dependencies)
- Phụ thuộc vào dịch vụ bên thứ 3, hạ tầng phần cứng, hoặc dữ liệu từ hệ thống khác.

---

## 3. Đặc Tả Yêu Cầu Chức Năng (Functional Requirements - FR)
Đối với từng chức năng cụ thể:
### FR-[ID]: [Tên chức năng]
- **Mô tả:** Ý nghĩa chức năng.
- **Actor:** Người thực hiện.
- **Điều kiện tiên quyết (Pre-conditions):** Trạng thái hệ thống trước khi thực hiện.
- **Dữ liệu đầu vào (Input Data & Validation):** Bảng chi tiết trường dữ liệu (Field Name, Type, Required, Validation rule).
- **Luồng xử lý chính (Main Flow / Happy Path):** Từng bước hệ thống và người dùng tương tác.
- **Luồng rẽ nhánh / Xử lý ngoại lệ (Alternative & Exception Flows):** Xử lý khi lỗi mạng, sai dữ liệu, vi phạm ràng buộc nghiệp vụ.
- **Điều kiện sau khi hoàn thành (Post-conditions):** Dữ liệu được lưu trữ, trạng thái mới, thông báo trả về.
- **Quy tắc nghiệp vụ (Business Rules - BR):** Liệt kê các quy tắc cố định (e.g., BR-01, BR-02).

---

## 4. Đặc Tả Yêu Cầu Phi Chức Năng (Non-Functional Requirements - NFR)
- **Hiệu năng (Performance):** Thời gian phản hồi API (e.g. < 500ms cho 95% request), khả năng chịu tải đồng thời.
- **Bảo mật & Phân quyền (Security & Authorization):** Xác thực (JWT/OAuth2), mã hóa dữ liệu nhạy cảm, log kiểm toán (Audit Log).
- **Tính khả dụng (Usability & Accessibility):** Giao diện thân thiện, hỗ trợ responsive, phím tắt.
- **Độ tin cậy & Toàn vẹn dữ liệu (Reliability & Data Integrity):** Cơ chế Retry, Idempotency, Transaction Rollback.

---

## 5. Từ Điển Dữ Liệu & Ràng Buộc Cơ Sở Dữ Liệu (Data Dictionary)
Bảng mô tả các trường thông tin chính liên quan đến tính năng:
| Tên Trường (Field) | Kiểu Dữ Liệu | Bắt Buộc | Ràng Buộc / Format | Mô Tả Nghiệp Vụ |
|---|---|---|---|---|
| ... | ... | Có/Không | ... | ... |

---

## 6. Mô Tả Bố Cục Giao Diện (UI/UX Wireframe Specs)
- Mô tả các thành phần trên màn hình (Bảng danh sách, Bộ lọc tìm kiếm, Form nhập liệu, Modal xác nhận).
- Trạng thái các nút bấm (Enable/Disable/Loading theo quyền và điều kiện nghiệp vụ).
```

### Bước 3: Đánh giá chất lượng tài liệu (SRS Quality Checklist)
Trước khi bàn giao, kiểm tra theo nguyên tắc **INVEST & SMART**:
- [ ] Tính rõ ràng, không mập mờ (Unambiguous): Tránh các từ ngữ chung chung như "nhanh", "đẹp", "dễ dùng", "tự động khi cần".
- [ ] Tính hoàn thiện (Complete): Có đầy đủ luồng thành công (Happy Path) và mọi luồng lỗi (Error/Exception).
- [ ] Tính kiểm thử được (Verifiable / Testable): Mọi yêu cầu đều có tiêu chí đánh giá đạt/không đạt rõ ràng.
- [ ] Tính nhất quán (Consistent): Không có mâu thuẫn giữa các quy tắc nghiệp vụ.

### Bước 4: Đóng gói và lưu trữ
- Xuất tài liệu ra định dạng Markdown chuẩn để dễ dàng lưu trữ vào Git, Confluence hoặc hệ thống Wiki của dự án.
