# 🚀 BA-Kit — Trọn Bộ 11 AI Skills Thực Chiến Cho IT Business Analyst

> **Hệ sinh thái AI Skills & Quy trình phân tích toàn diện dành cho IT Business Analyst (BA) và Product Owner (PO) chuẩn phương pháp luận AI4BA & Bakit flagship.**

---

## 🎯 Tổng Quan Hệ Sinh Thái 11 Kỹ Năng

BA-Kit bao quát 100% vòng đời của một dự án công nghệ thông tin từ khâu khơi gợi ý tưởng ban đầu đến lúc bàn giao và nghiệm thu:

| STT | Kỹ Năng | Lệnh Gọi Tắt | Giai Đoạn Vòng Đời | Mục Đích & Deliverable Chính |
|:---:|---|---|---|---|
| **1** | [`ba-brainstorm`](.agents/skills/ba-brainstorm/SKILL.md) | `/brainstorm` | Khởi tạo | Phỏng vấn sâu 7 bước khi khách hàng chỉ mới có ý tưởng mơ hồ |
| **2** | [`ba-reverse-engineering`](.agents/skills/ba-reverse-engineering/SKILL.md) | `/reverse` | Khảo sát | Dịch ngược website / app cũ thành tài liệu đặc tả & Data Model |
| **3** | [`ba-raw-analysis`](.agents/skills/ba-raw-analysis/SKILL.md) | `/analyze-raw` | Khám phá | Lọc nhiễu transcript họp, bóc tách Quyết định vs Bỏ ngỏ, Clarification Q&A |
| **4** | [`ba-diagram`](.agents/skills/ba-diagram/SKILL.md) | `/diagram` | Mô hình hóa | Sinh mã sơ đồ Mermaid (Flowchart, Sequence, State Machine, ERD) |
| **5** | [`ba-srs`](.agents/skills/ba-srs/SKILL.md) | `/srs` | Đặc tả Formal | Soạn thảo tài liệu SRS hoàn chỉnh chuẩn IEEE 830 (FR, NFR, Data Dict) |
| **6** | [`ba-user-story`](.agents/skills/ba-user-story/SKILL.md) | `/story`, `/ac` | Đặc tả Agile | Phân rã User Stories và viết Acceptance Criteria (Given-When-Then) |
| **7** | [`ba-use-case`](.agents/skills/ba-use-case/SKILL.md) | `/usecase` | Đặc tả chi tiết | Bảng Use Case chuẩn Cockburn (Main Flow, Alt, Exception Flows) |
| **8** | [`ba-ui-mockup`](.agents/skills/ba-ui-mockup/SKILL.md) | `/mockup`, `/wireframe` | Thiết kế UI | Phác thảo ASCII Wireframe và sinh prompt cho Figma Make / Stitch / v0 |
| **9** | [`ba-content-audit`](.agents/skills/ba-content-audit/SKILL.md) | `/audit`, `/review` | Thẩm định QC | Soi mâu thuẫn chéo giữa các tài liệu, chấm điểm QA Readiness Score |
| **10** | [`ba-impact-analysis`](.agents/skills/ba-impact-analysis/SKILL.md) | `/cr`, `/impact` | Quản lý thay đổi | Ma trận đánh giá tác động 6 chiều khi có Change Request & Rollback Plan |
| **11** | [`ba-test-cases`](.agents/skills/ba-test-cases/SKILL.md) | `/testcase` | Nghiệm thu | Thiết kế ma trận kịch bản kiểm thử (P1-P4) và chi tiết UAT Test Cases |

👉 *Xem chi tiết phương pháp luận và quy trình tại:* [`WORKFLOW.md`](WORKFLOW.md)

---

## 🤖 Hỗ Trợ Đa Agent Native (Multi-Agent Ready)

* **Google Antigravity / Gemini Agent:** Tự động đọc `.agents/skills/*/SKILL.md` và `AGENTS.md`
* **Cursor AI:** Đọc `.cursorrules` và `.cursor/rules/ba-kit.mdc`
* **Claude Code CLI & Claude Desktop:** Đọc `CLAUDE.md`
* **Codeium Windsurf (Cascade):** Đọc `.windsurfrules` và `AGENTS.md`
* **GitHub Copilot Chat & Workspace:** Đọc `.github/copilot-instructions.md`
* **ChatGPT / Claude / Gemini Web:** Copy prompt mẫu trong `cheat-sheets/web-prompts-guide.md`

---

## 📂 Cấu Trúc Thư Mục Project

```text
D:\PROJECT_2026\ba-kit\
├── WORKFLOW.md                        # QUY TRÌNH PHÂN TÍCH 11 KỸ NĂNG CHUẨN AI4BA
├── AGENTS.md                          # Hướng dẫn chung cho Multi-Agent
├── CLAUDE.md                          # Cấu hình riêng cho Claude Code
├── .cursorrules                       # Cấu hình cho Cursor IDE
├── .cursor/rules/ba-kit.mdc           # Rule chuyên sâu cho Cursor AI
├── .windsurfrules                     # Cấu hình cho Windsurf Cascade
├── .github/copilot-instructions.md    # Cấu hình cho GitHub Copilot
├── README.md                          # Giới thiệu & hướng dẫn tổng quan
├── package.json                       # Metadata project
│
├── .agents/skills/                    # Trọn bộ 11 AI Skills
│   ├── ba-brainstorm/                 # [SKILL 1] Phỏng vấn sâu 7 bước làm rõ ý tưởng
│   ├── ba-reverse-engineering/        # [SKILL 2] Dịch ngược website & hệ thống cũ
│   ├── ba-raw-analysis/               # [SKILL 3] Bóc tách transcript, gap analysis, Q&A
│   ├── ba-diagram/                    # [SKILL 4] Vẽ sơ đồ Mermaid (Flow, Sequence, ERD...)
│   ├── ba-srs/                        # [SKILL 5] Đặc tả SRS chuẩn IEEE
│   ├── ba-user-story/                 # [SKILL 6] User Story & AC (Given-When-Then)
│   ├── ba-use-case/                   # [SKILL 7] Đặc tả Use Case chi tiết (Cockburn)
│   ├── ba-ui-mockup/                  # [SKILL 8] ASCII Wireframe & Figma/Stitch Prompt
│   ├── ba-content-audit/              # [SKILL 9] QC Review & Chấm điểm QA Readiness
│   ├── ba-impact-analysis/            # [SKILL 10] Phân tích tác động Change Request 6 chiều
│   └── ba-test-cases/                 # [SKILL 11] Ma trận Test Scenarios & UAT Test Cases
│
├── templates/                         # Biểu mẫu Markdown chuẩn
│   ├── 00-raw-analysis-summary-template.md
│   ├── 01-srs-template.md
│   ├── 02-user-story-template.md
│   ├── 03-use-case-template.md
│   ├── 04-impact-analysis-template.md
│   └── 05-test-cases-template.md
│
├── cheat-sheets/
│   ├── mermaid-ba-cheat-sheet.md
│   └── web-prompts-guide.md
│
└── scripts/
    └── install-skills.ps1             # Cài đặt tự động sang Global hoặc Workspace khác
```

---

## 💻 Cài Đặt Vào Bất Kỳ Dự Án Nào (1-Click Script)

Chạy PowerShell tại `D:\PROJECT_2026\ba-kit`:

```powershell
# Cài đặt trọn bộ vào một thư mục dự án mới:
.\scripts\install-skills.ps1 -TargetPath "D:\Path\To\Your-Project"

# Hoặc cài đặt vào Global Config để dùng cho mọi dự án:
.\scripts\install-skills.ps1 -Global
```
