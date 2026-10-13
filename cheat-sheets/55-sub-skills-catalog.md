# 📚 Bảng Tra Cứu Toàn Diện 55 Sub-Skills / Lệnh BA Theo 9 Giai Đoạn (AI4BA Command Catalog)

> **Giải thích kiến trúc: AI4BA đóng gói 55 sub-actions/lệnh vi mô chia theo 9 giai đoạn nghiệp vụ. Trong hệ thống BA-Kit, 55 sub-skills này được vận hành bởi 11 Core Engines.**

---

### Giai Đoạn 1: Khơi Gợi & Khám Phá Ý Tưởng (Ideation & Discovery)
*Engine vận hành:* `ba-brainstorm` & `ba-reverse-engineering`
1. `/brainstorm` — Phỏng vấn 7 bước đào sâu ý tưởng thô.
2. `/5-whys` — Tìm nguyên nhân gốc rễ và vấn đề cốt lõi.
3. `/persona` — Xây dựng chân dung người dùng mục tiêu.
4. `/options` — Đánh giá và so sánh các hướng giải pháp.
5. `/reverse-web` — Khảo sát và dịch ngược website đối thủ/hiện có.
6. `/reverse-legacy` — Dịch ngược hệ thống cũ cần làm mới.

---

### Giai Đoạn 2: Tiếp Nhận & Lọc Sạch Dữ Liệu Thô (Raw Ingestion & Triage)
*Engine vận hành:* `ba-raw-analysis`
7. `/analyze-raw` — Phân tích tổng thể dữ liệu thô.
8. `/transcript-clean` — Lọc nhiễu biên bản họp/audio transcript.
9. `/glossary` — Bóc tách bảng thuật ngữ và từ viết tắt.
10. `/decisions` — Tổng hợp danh sách quyết định đã thống nhất.
11. `/open-issues` — Bóc tách các vấn đề còn bỏ ngỏ.
12. `/clarification-qa` — Tạo bộ câu hỏi làm rõ gửi stakeholder.
13. `/gap-analysis` — Phân tích điểm mù và lỗ hổng thông tin.

---

### Giai Đoạn 3: Chiến Lược & Định Hình Phạm Vi (Strategy & Scoping)
*Engine vận hành:* `ba-srs` & `ba-raw-analysis`
14. `/prd` — Soạn tài liệu Product Requirement Document.
15. `/roadmap` — Lập lộ trình phát hành tính năng (Release Roadmap).
16. `/backbone` — Khóa source of truth (Actors, Core Modules).
17. `/feature-map` — Danh mục tính năng phân cấp (Feature Catalog).
18. `/scope-mvp` — Phân định ranh giới In-scope vs Out-of-scope.

---

### Giai Đoạn 4: Mô Hình Hóa Quy Trình & Dữ Liệu (Process & Data Modeling)
*Engine vận hành:* `ba-diagram`
19. `/flowchart` — Vẽ sơ đồ quy trình nghiệp vụ (Activity flow).
20. `/sequence` — Vẽ sơ đồ tuần tự tương tác API/Hệ thống.
21. `/state-machine` — Vẽ sơ đồ vòng đời trạng thái của đối tượng.
22. `/erd` — Vẽ sơ đồ quan hệ thực thể cơ sở dữ liệu.
23. `/bpmn` — Sinh sơ đồ chuẩn BPMN 2.0.
24. `/userflow` — Sơ đồ luồng di chuyển của người dùng trên màn hình.
25. `/context-diagram` — Sơ đồ ngữ cảnh hệ thống tổng quan.

---

### Giai Đoạn 5: Đặc Tả Yêu Cầu Chi Tiết (Formal Specification)
*Engine vận hành:* `ba-srs` & `ba-use-case`
26. `/srs` — Soạn thảo SRS hoàn chỉnh chuẩn IEEE 830.
27. `/frd` — Soạn Functional Requirements Document.
28. `/usecase` — Đặc tả Use Case chi tiết chuẩn Cockburn.
29. `/main-flow` — Chi tiết hóa luồng chính Actor vs System.
30. `/exception-flow` — Đặc tả mọi luồng lỗi và ngoại lệ.
31. `/business-rules` — Đóng gói danh mục quy tắc nghiệp vụ (BR-XX).
32. `/nfr` — Đặc tả yêu cầu phi chức năng (Performance, Security).
33. `/data-dict` — Bảng từ điển dữ liệu (Fields, types, constraints).
34. `/error-matrix` — Bảng mã lỗi và thông báo thân thiện.

---

### Giai Đoạn 6: Agile Stories & BDD (Agile Delivery)
*Engine vận hành:* `ba-user-story`
35. `/story` — Viết User Story chuẩn INVEST.
36. `/ac` — Viết Acceptance Criteria chuẩn Given-When-Then.
37. `/gherkin` — Xuất bản kịch bản kiểm thử BDD/Cucumber.
38. `/story-split` — Phân rã Epic lớn thành các Story nhỏ 1-3 ngày.
39. `/dor-dod` — Thiết lập Definition of Ready & Definition of Done.
40. `/invest-audit` — Kiểm tra tính độc lập và khả thi của Story.

---

### Giai Đoạn 7: Thiết Kế Giao Diện & Prototyping (UI/UX Mockups)
*Engine vận hành:* `ba-ui-mockup`
41. `/wireframe` — Bố cục tổng thể giao diện màn hình.
42. `/ascii-wireframe` — Phác thảo wireframe dạng bảng ASCII 5 cột.
43. `/figma-prompt` — Sinh prompt dán sẵn cho Figma Make.
44. `/stitch-sync` — Sinh prompt đồng bộ cho Google Stitch.
45. `/v0-prompt` — Sinh prompt tạo React/Tailwind trên v0.dev.
46. `/prototype-html` — Sinh mã HTML/CSS xem trước giao diện.

---

### Giai Đoạn 8: Thẩm Định Chất Lượng & Quality Gate (Audit & Review)
*Engine vận hành:* `ba-content-audit`
47. `/audit` — Rà soát toàn bộ tài liệu dự án.
48. `/qc-uc-review` — Chấm điểm QA Readiness Score (0-100).
49. `/conflict-check` — Soi mâu thuẫn chéo giữa SRS, ERD và UI.
50. `/scope-creep-check` — Phát hiện nguy cơ phình phạm vi dự án.
51. `/doc-drift` — Kiểm tra độ lệch giữa tài liệu và code thực tế.

---

### Giai Đoạn 9: Quản Lý Thay Đổi & Kiểm Thử (Change & QA Handoff)
*Engine vận hành:* `ba-impact-analysis` & `ba-test-cases`
52. `/cr` — Tiếp nhận yêu cầu thay đổi (Change Request).
53. `/impact` — Ma trận đánh giá tác động 6 chiều.
54. `/rollback-plan` — Kế hoạch hoàn tác dự phòng khi deploy.
55. `/testcase` — Ma trận kịch bản kiểm thử (P1-P4) & UAT Test Cases.
