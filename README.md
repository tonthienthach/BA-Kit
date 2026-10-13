# 🚀 BA-Kit for Multi-Agent & IT Business Analysts

> **Bộ công cụ & Kỹ năng AI thực chiến (AI Skills & Workflows) dành cho IT Business Analyst (BA) và Product Owner (PO) — Hỗ trợ Đa Nền Tảng AI Agent.**

---

## 🤖 Hỗ Trợ Đa Agent (Multi-Agent Native)

BA-Kit được cấu hình sẵn để **mọi AI Agent / IDE phổ biến nhất hiện nay** đều tự động nhận diện và hoạt động trơn tru ngay khi mở repo:

| AI Agent / IDE | Tệp Cấu Hình Tự Động Nhận Diện | Trạng Thái |
|---|---|---|
| **Google Antigravity / Gemini Agent** | `.agents/skills/*/SKILL.md`, `AGENTS.md` | ✅ Native Supported |
| **Cursor AI** | `.cursorrules`, `.cursor/rules/ba-kit.mdc` | ✅ Native Supported |
| **Claude Code CLI / Claude Desktop** | `CLAUDE.md` | ✅ Native Supported |
| **Codeium Windsurf (Cascade)** | `.windsurfrules`, `AGENTS.md` | ✅ Native Supported |
| **GitHub Copilot Chat & Workspace** | `.github/copilot-instructions.md` | ✅ Native Supported |
| **Roo Code / Cline** | `AGENTS.md`, `.roomodes` | ✅ Supported |
| **ChatGPT / Claude Web** | `cheat-sheets/web-prompts-guide.md` | ✅ Copy-Paste Ready |

---

## 📂 Cấu Trúc Thư Mục Project

```text
D:\PROJECT_2026\ba-kit\
├── AGENTS.md                          # Tiêu chuẩn chỉ dẫn chung cho Multi-Agent
├── CLAUDE.md                          # Cấu hình riêng cho Claude Code / Claude Desktop
├── .cursorrules                       # Cấu hình cho Cursor IDE
├── .cursor/rules/ba-kit.mdc           # Rule chuyên sâu cho Cursor AI
├── .windsurfrules                     # Cấu hình cho Windsurf Cascade
├── .github/copilot-instructions.md    # Cấu hình cho GitHub Copilot
├── README.md                          # Tài liệu hướng dẫn sử dụng tổng quan
├── package.json                       # Định danh project & metadata
│
├── .agents/skills/                    # Thư mục 6 AI Skills cốt lõi
│   ├── ba-srs/                        # Soạn thảo SRS chuẩn IEEE
│   ├── ba-user-story/                 # Sinh User Stories & Acceptance Criteria (Gherkin)
│   ├── ba-use-case/                   # Đặc tả Use Case chi tiết (Cockburn/UML)
│   ├── ba-diagram/                    # Thiết kế sơ đồ Mermaid (Flow, Sequence, State, ERD)
│   ├── ba-impact-analysis/            # Phân tích tác động Change Request 6 chiều
│   └── ba-test-cases/                 # Sinh ma trận Test Scenarios & UAT Test Cases
│
├── templates/                         # Biểu mẫu Markdown chuẩn
│   ├── 01-srs-template.md             # Biểu mẫu SRS
│   ├── 02-user-story-template.md      # Biểu mẫu User Story & AC
│   ├── 03-use-case-template.md        # Biểu mẫu Use Case
│   ├── 04-impact-analysis-template.md # Biểu mẫu phân tích tác động CR
│   └── 05-test-cases-template.md      # Biểu mẫu ma trận kiểm thử
│
├── cheat-sheets/                      # Cẩm nang tra cứu nhanh
│   ├── mermaid-ba-cheat-sheet.md      # Hướng dẫn vẽ nhanh các sơ đồ Mermaid
│   └── web-prompts-guide.md           # Prompt copy-paste dùng trên Web AI
│
└── scripts/
    └── install-skills.ps1             # Cài đặt tự động sang Global hoặc Workspace khác
```

---

## 🛠️ Danh Sách Lệnh Kích Hoạt (Slash Commands)

Trên bất kỳ Agent nào (Antigravity, Cursor, Claude, Windsurf), bạn có thể gọi tắt:

1. `/srs` hoặc *"viết SRS cho [Tính năng]"*: Tạo tài liệu SRS hoàn chỉnh.
2. `/story` hoặc `/ac`: Phân rã User Stories và viết Acceptance Criteria chuẩn Given-When-Then.
3. `/usecase`: Đặc tả bảng Use Case chi tiết (Main flow, Alt flows, Exception flows, Business rules).
4. `/diagram`: Sinh sơ đồ Mermaid (Flowchart, Sequence diagram, State diagram, ERD).
5. `/cr` hoặc `/impact`: Báo cáo đánh giá tác động thay đổi 6 chiều kèm kế hoạch rollback.
6. `/testcase`: Tạo ma trận kịch bản kiểm thử và Test Cases chi tiết cho UAT / QA.

---

## 💻 Cài Đặt Vào Dự Án Mới (1-Click Script)

Để mang trọn bộ cấu hình này sang một dự án khác:
Mở PowerShell tại `D:\PROJECT_2026\ba-kit` và chạy:

```powershell
# Cài đặt vào workspace mục tiêu
.\scripts\install-skills.ps1 -TargetPath "D:\Path\To\Your-Project"

# Hoặc cài đặt vào Global Config của Antigravity/Gemini (dùng cho mọi dự án)
.\scripts\install-skills.ps1 -Global
```
