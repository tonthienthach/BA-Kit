# Hướng Dẫn Sử Dụng Prompts Trên Giao Diện Web (ChatGPT / Claude / Gemini)

Nếu bạn không sử dụng AI trong IDE/Agent mà làm việc trên web ChatGPT hoặc Claude, hãy copy các mẫu prompt dưới đây để nhận kết quả chuẩn BA:

---

## 1. Prompt Viết SRS Hoàn Chỉnh
```text
Bạn là một IT Business Analyst chuyên nghiệp. Dựa vào mô tả tính năng dưới đây, hãy soạn thảo tài liệu Software Requirements Specification (SRS) chi tiết theo chuẩn IEEE gồm:
1. Mục tiêu và phạm vi (In-scope, Out-of-scope).
2. Danh sách Actor và quyền hạn.
3. Đặc tả yêu cầu chức năng (FR) chi tiết: input validation, main flow, exception flows, business rules.
4. Yêu cầu phi chức năng (NFR): hiệu năng, bảo mật, tính khả dụng.
5. Từ điển dữ liệu (Data Dictionary).

[DÁN MÔ TẢ TÍNH NĂNG HOẶC GHI CHÚ CUỘC HỌP VÀO ĐÂY]
```

---

## 2. Prompt Viết User Story & Acceptance Criteria
```text
Bạn là một IT BA theo mô hình Agile. Hãy phân rã tính năng dưới đây thành các User Story độc lập thỏa mãn tiêu chuẩn INVEST.
Mỗi User Story phải có:
- Cấu trúc: As a [User], I want to [Action], So that [Value].
- Business Rules liên quan.
- Bộ Acceptance Criteria (AC) chi tiết theo chuẩn Given-When-Then bao gồm: Happy path, Validation failure, Business rule conflict, RBAC.

[DÁN MÔ TẢ TÍNH NĂNG VÀO ĐÂY]
```

---

## 3. Prompt Vẽ Sơ Đồ Mermaid
```text
Dựa vào luồng nghiệp vụ sau đây, hãy viết mã nguồn sơ đồ Mermaid chuẩn (render được trong Markdown).
Loại sơ đồ yêu cầu: [Flowchart / Sequence Diagram / State Diagram / ERD]
Yêu cầu:
- Đặt tên tiếng Việt rõ ràng, dễ hiểu.
- Các nhãn chứa ký tự đặc biệt phải bọc trong ngoặc kép.
- Thể hiện rõ các điểm rẽ nhánh và luồng xử lý lỗi.

[DÁN LUỒNG NGHIỆP VỤ VÀO ĐÂY]
```

---

## 4. Prompt Phân Tích Tác Động (CR & Impact Analysis)
```text
Khách hàng vừa yêu cầu thay đổi tính năng sau đây. Bạn là Lead BA, hãy phân tích tác động toàn diện 6 chiều:
1. As-Is vs To-Be.
2. Tác động màn hình giao diện (UI/UX).
3. Tác động API & logic Backend (chỉ rõ nếu có Breaking change).
4. Tác động Cơ sở dữ liệu và xử lý dữ liệu cũ (Legacy Data).
5. Tác động tích hợp chéo (Cross-service / 3rd party).
6. Rủi ro và kế hoạch Rollback.

[DÁN YÊU CẦU THAY ĐỔI VÀO ĐÂY]
```

---

## 5. Prompt Viết Ma Trận Test Cases
```text
Từ mô tả chức năng / User Story dưới đây, hãy thiết kế:
1. Bảng ma trận kịch bản kiểm thử (Test Scenarios Matrix) đánh giá mức ưu tiên từ P1 đến P4.
2. Bảng chi tiết Test Cases chuẩn UAT gồm: Test Case ID, Description, Preconditions, Test Steps, Test Data, Expected Results, Type (Positive/Negative/Boundary/Security), Priority.

[DÁN YÊU CẦU HOẶC AC VÀO ĐÂY]
```
