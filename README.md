# 🚀 BA-Kit for Multi-Agent & IT Business Analysts

> **Bộ công cụ, Kỹ năng AI thực chiến & Quy trình phân tích 5 giai đoạn (AI Skills & Workflows) dành cho IT Business Analyst (BA) và Product Owner (PO) chuẩn phương pháp luận AI4BA.**

---

## 🎯 Điểm Khác Biệt Cốt Lõi: Quy Trình Phân Tích 5 Giai Đoạn (WORKFLOW.md)
Khác với việc ném prompt rời rạc vào chat, **BA-Kit** chuẩn hóa toàn bộ công việc của BA thành một quy trình khép kín:
1. **Giai đoạn 1: Khám phá & Lọc sạch dữ liệu thô (`ba-raw-analysis`)**: Tiếp nhận Transcript cuộc họp, lọc nhiễu, bóc tách Quyết định vs Vấn đề bỏ ngỏ, và sinh **Bộ câu hỏi làm rõ (Clarification Questions)**.
2. **Giai đoạn 2: Mô hình hóa trực quan (`ba-diagram`)**: Sinh mã sơ đồ Mermaid (Flowchart, Sequence, State, ERD).
3. **Giai đoạn 3: Đặc tả chi tiết chuẩn mực (`ba-srs` / `ba-user-story` / `ba-use-case`)**: Sinh tài liệu chuẩn IEEE hoặc User Story + AC Given-When-Then.
4. **Giai đoạn 4: Đánh giá tác động & Quản lý thay đổi (`ba-impact-analysis`)**: Ma trận phân tích 6 chiều khi có Change Request (CR).
5. **Giai đoạn 5: Kiểm thử chấp nhận & Nghiệm thu (`ba-test-cases`)**: Ma trận Test Scenarios (P1-P4) và Test Cases chi tiết cho UAT.

👉 *Xem chi tiết phương pháp luận tại:* [`WORKFLOW.md`](WORKFLOW.md)

---

## 🤖 Hỗ Trợ Đa Agent Native (Multi-Agent)

BA-Kit tự động nhận diện và hoạt động trơn tru trên mọi Agent:
* **Google Antigravity / Gemini Agent:** `.agents/skills/*/SKILL.md`, `AGENTS.md`
* **Cursor AI:** `.cursorrules`, `.cursor/rules/ba-kit.mdc`
* **Claude Code CLI / Claude Desktop:** `CLAUDE.md`
* **Codeium Windsurf (Cascade):** `.windsurfrules`, `AGENTS.md`
* **GitHub Copilot Chat & Workspace:** `.github/copilot-instructions.md`
* **ChatGPT / Claude Web:** `cheat-sheets/web-prompts-guide.md`

---

## 📂 Cấu Trúc Thư Mục Project

```text
D:\PROJECT_2026\ba-kit\
├── WORKFLOW.md                        # QUY TRÌNH PHÂN TÍCH 5 GIAI ĐOẠN CHUẨN AI4BA
├── AGENTS.md                          # Tiêu chuẩn chỉ dẫn chung cho Multi-Agent
├── CLAUDE.md                          # Cấu hình riêng cho Claude Code
├── .cursorrules                       # Cấu hình cho Cursor IDE
├── .cursor/rules/ba-kit.mdc           # Rule chuyên sâu cho Cursor AI
├── .windsurfrules                     # Cấu hình cho Windsurf Cascade
├── .github/copilot-instructions.md    # Cấu hình cho GitHub Copilot
├── README.md                          # Giới thiệu & hướng dẫn tổng quan
├── package.json                       # Metadata project
│
├── .agents/skills/                    # Trọn bộ 7 AI Skills
│   ├── ba-raw-analysis/               # [GIAI ĐOẠN 1] Bóc tách dữ liệu thô, gap analysis, Q&A
│   ├── ba-diagram/                    # [GIAI ĐOẠN 2] Vẽ sơ đồ Mermaid (Flow, Sequence, ERD...)
│   ├── ba-user-story/                 # [GIAI ĐOẠN 3A] User Story & AC (Given-When-Then)
│   ├── ba-srs/                        # [GIAI ĐOẠN 3B] Đặc tả SRS chuẩn IEEE
│   ├── ba-use-case/                   # [GIAI ĐOẠN 3C] Đặc tả Use Case chi tiết (Cockburn)
│   ├── ba-impact-analysis/            # [GIAI ĐOẠN 4] Phân tích tác động Change Request 6 chiều
│   └── ba-test-cases/                 # [GIAI ĐOẠN 5] Ma trận Test Scenarios & UAT Test Cases
│
├── templates/                         # Biểu mẫu Markdown chuẩn
│   ├── 00-raw-analysis-summary-template.md # Template Báo cáo phân tích dữ liệu thô
│   ├── 01-srs-template.md             # Template SRS
│   ├── 02-user-story-template.md      # Template User Story & AC
│   ├── 03-use-case-template.md        # Template Use Case
│   ├── 04-impact-analysis-template.md # Template Phân tích tác động CR
│   └── 05-test-cases-template.md      # Template Ma trận kiểm thử
│
├── cheat-sheets/                      # Cẩm nang tra cứu nhanh
│   ├── mermaid-ba-cheat-sheet.md      # Cẩm nang sơ đồ Mermaid cho BA
│   └── web-prompts-guide.md           # Prompt copy-paste dùng trên Web AI
│
└── scripts/
    └── install-skills.ps1             # Cài đặt tự động sang Global hoặc Workspace khác
```

---

## ⚡ Bảng Lệnh Kích Hoạt (Slash Commands)

| Giai Đoạn | Lệnh Tắt Gọi Agent | Kỹ Năng Kích Hoạt | Đầu Ra Chính |
|---|---|---|---|
| **1. Khám phá** | `/analyze-raw` | `ba-raw-analysis` | Lọc nhiễu, bóc tách Quyết định vs Bỏ ngỏ, Clarification Q&A |
| **2. Mô hình** | `/diagram` | `ba-diagram` | Sơ đồ Mermaid (Flowchart, Sequence, State, ERD) |
| **3. Agile Spec** | `/story` hoặc `/ac` | `ba-user-story` | User Story chuẩn INVEST + AC Given-When-Then |
| **3. Formal Spec** | `/srs` | `ba-srs` | Tài liệu SRS chuẩn IEEE 830 (FR, NFR, Data Dict, UI) |
| **3. Use Case** | `/usecase` | `ba-use-case` | Đặc tả Use Case Cockburn (Main, Alt, Exception Flows) |
| **4. Đổi mới/CR** | `/cr` hoặc `/impact` | `ba-impact-analysis` | Ma trận tác động 6 chiều & Rollback Plan |
| **5. Nghiệm thu** | `/testcase` | `ba-test-cases` | Ma trận kịch bản kiểm thử (P1-P4) & UAT Test Cases |
