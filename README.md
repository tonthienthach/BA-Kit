# 🚀 BA-Kit for AI Coding Agents & IT Business Analysts

> **Bộ công cụ & Kỹ năng AI thực chiến (AI Skills & Workflows) dành cho IT Business Analyst (BA) và Product Owner (PO).**

---

## 📌 Giới Thiệu Tổng Quan

**BA-Kit** được thiết kế để tự động hóa 70–80% các tác vụ tài liệu thủ công lặp đi lặp lại của BA, bao gồm: viết đặc tả yêu cầu (SRS), tạo User Stories & Acceptance Criteria (Gherkin), đặc tả Use Cases, thiết kế sơ đồ nghiệp vụ trực quan (Mermaid), phân tích tác động thay đổi (Change Request / Impact Analysis), và sinh ma trận kịch bản kiểm thử (UAT Test Cases).

Bộ kit tương thích trực tiếp với:
* **Antigravity IDE / Gemini Agent**
* **Cursor AI / Windsurf / Claude Code / Roo Code / Cline**
* **ChatGPT / Claude / Gemini Web** (thông qua thư mục `cheat-sheets/web-prompts-guide.md`)

---

## 📂 Cấu Trúc Thư Mục Project

```text
D:\PROJECT_2026\ba-kit\
├── README.md                          # Tài liệu hướng dẫn sử dụng tổng quan
├── package.json                       # Định danh project & metadata
├── .agents/skills/                    # Thư mục chứa 6 AI Skills chuẩn Antigravity / Cursor
│   ├── ba-srs/                        # Skill soạn thảo SRS hoàn chỉnh
│   ├── ba-user-story/                 # Skill sinh User Stories & Acceptance Criteria
│   ├── ba-use-case/                   # Skill đặc tả Use Case chi tiết
│   ├── ba-diagram/                    # Skill vẽ sơ đồ Mermaid (Flow, Sequence, State, ERD)
│   ├── ba-impact-analysis/            # Skill phân tích tác động Change Request
│   └── ba-test-cases/                 # Skill sinh ma trận Test Scenarios & Test Cases
├── templates/                         # Các biểu mẫu tài liệu chuẩn Markdown
│   ├── 01-srs-template.md             # Biểu mẫu SRS
│   ├── 02-user-story-template.md      # Biểu mẫu User Story & AC
│   ├── 03-use-case-template.md        # Biểu mẫu Use Case
│   ├── 04-impact-analysis-template.md # Biểu mẫu phân tích tác động CR
│   └── 05-test-cases-template.md      # Biểu mẫu ma trận kiểm thử
├── cheat-sheets/                      # Cẩm nang tra cứu nhanh
│   ├── mermaid-ba-cheat-sheet.md      # Hướng dẫn vẽ nhanh các sơ đồ Mermaid
│   └── web-prompts-guide.md           # Prompt copy-paste dùng trên Web AI
└── scripts/                           # Script tiện ích
    └── install-skills.ps1             # Cài đặt tự động sang Global hoặc Workspace khác
```

---

## 🛠️ Hướng Dẫn Sử Dụng Trong AI Agent / IDE

Khi làm việc cùng AI Agent (như Antigravity hoặc Cursor), các kỹ năng sẽ tự động kích hoạt khi bạn sử dụng các từ khóa hoặc slash command:

### 1. Soạn thảo SRS (`ba-srs`)
* **Cách gọi:** Gõ `/srs`, *"viết SRS cho tính năng [Tên tính năng]"*, *"lập tài liệu đặc tả yêu cầu cho phân hệ [Tên phân hệ]"*.
* **Kết quả:** Sinh tài liệu SRS chuẩn IEEE gồm: Giới thiệu, Phạm vi, FR, NFR, Data Dictionary, UI Specs.

### 2. User Stories & Acceptance Criteria (`ba-user-story`)
* **Cách gọi:** Gõ `/story`, `/ac`, *"viết user story cho tính năng [Tên]"*, *"tạo acceptance criteria cho chức năng [Tên]"*.
* **Kết quả:** User Story chuẩn INVEST, kèm 4–5 kịch bản AC (Happy path, Validation, Business rule violation, RBAC) chuẩn Given-When-Then.

### 3. Đặc tả Use Case chi tiết (`ba-use-case`)
* **Cách gọi:** Gõ `/usecase`, *"đặc tả use case cho [Tên]"*, *"viết use case chi tiết"*.
* **Kết quả:** Bảng Use Case chuẩn Cockburn gồm Actor, Preconditions, Trigger, Main Flow (từng bước Actor vs System), Alternative Flows, Exception Flows, Business Rules.

### 4. Vẽ sơ đồ nghiệp vụ bằng Mermaid (`ba-diagram`)
* **Cách gọi:** Gõ `/diagram`, *"vẽ sequence diagram cho luồng [Tên]"*, *"vẽ flowchart"*, *"vẽ state diagram cho đơn hàng"*, *"vẽ ERD"*.
* **Kết quả:** Mã nguồn Mermaid chuẩn cú pháp, render trực quan ngay trên Markdown.

### 5. Đánh giá tác động Change Request (`ba-impact-analysis`)
* **Cách gọi:** Gõ `/cr`, `/impact`, *"đánh giá tác động khi [mô tả thay đổi]"*, *"làm impact analysis cho CR này"*.
* **Kết quả:** Ma trận 6 chiều: Nghiệp vụ As-Is vs To-Be, Màn hình UI, Logic API, DB Schema & dữ liệu lịch sử, Tích hợp chéo, Rủi ro & Rollback plan.

### 6. Ma trận kiểm thử & UAT Test Cases (`ba-test-cases`)
* **Cách gọi:** Gõ `/testcase`, *"sinh test case cho tính năng [Tên]"*, *"tạo kịch bản kiểm thử UAT"*.
* **Kết quả:** Bảng Test Scenarios (P1-P4) và chi tiết Test Cases (Positive, Negative, Boundary BVA, Edge cases).

---

## 💻 Cài Đặt Cho Workspace Mới (1-Click Script)

Nếu bạn muốn copy toàn bộ 6 skills này vào một dự án khác:
Mở PowerShell tại thư mục `D:\PROJECT_2026\ba-kit` và chạy:

```powershell
# Cài đặt vào workspace mục tiêu
.\scripts\install-skills.ps1 -TargetPath "D:\Path\To\Your-Other-Project"

# Hoặc cài đặt vào Global Config của Antigravity/Gemini (dùng cho mọi dự án)
.\scripts\install-skills.ps1 -Global
```

---

## 📄 Bản Quyền & Giấy Phép
Dự án được khởi tạo và lưu trữ cục bộ phục vụ công việc phân tích nghiệp vụ tại `D:\PROJECT_2026\ba-kit`.
