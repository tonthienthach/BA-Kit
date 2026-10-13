# 🔌 Hướng Dẫn Tích Hợp Reqwise Figma MCP (Bridge AI & Figma Canvas)

> **Reqwise (reqwise-figma-mcp) là công cụ MCP Server + Figma Plugin do tác giả hệ sinh thái AI4BA phát triển, cho phép AI Agent trực tiếp ĐỌC và VẼ lên canvas Figma.**

---

## 🎯 1. Reqwise Khác Gì So Với BA-Kit?

| Tiêu Chí | BA-Kit (Bộ Não Nghiệp Vụ) | Reqwise (Cánh Tay Nối Sang Figma) |
|---|---|---|
| **Bản chất** | Thư viện AI Skills & Quy trình phân tích 9 giai đoạn | MCP Server (Model Context Protocol) + Figma Plugin |
| **Đầu ra chính** | Markdown specs (SRS, User Story, Use Case, Test Cases, Mermaid) | Các frame, vector shapes, connector vẽ trực tiếp trên Figma/FigJam |
| **Mục đích** | Bóc tách logic, làm rõ yêu cầu, đảm bảo tính chặt chẽ nghiệp vụ | Tự động hóa vẽ sơ đồ và wireframe lên canvas của Designer |
| **Mối quan hệ** | **Tương hỗ hoàn hảo:** BA-Kit tạo ra cấu trúc logic chuẩn -> Reqwise nhận spec để vẽ thẳng lên Figma! |

---

## 🛠️ 2. Các Tính Năng Đột Phá Của Reqwise Figma MCP

1. **Vẽ sơ đồ nghiệp vụ trực tiếp trên Figma/FigJam:**
   - Thay vì chỉ xuất mã Mermaid, Reqwise điều khiển Figma tạo ra các node hình chữ nhật, hình thoi, mũi tên kết nối (connectors) có thể kéo thả chỉnh sửa được.
   - Hỗ trợ: Flowcharts, BPMN (có swimlane), Sequence Diagram, ERD, State Machine.
2. **Safe-by-Default Drawing & Layout Audit:**
   - Cơ chế tự động tính toán tọa độ (x, y), chống đè chồng các frame, chống tràn khỏi artboard.
   - Đảm bảo tuân thủ Auto-layout và khoảng cách padding chuẩn 8pt.
3. **Đọc Design ngược lại để viết Spec (Design-to-Spec):**
   - AI Agent có thể inspect một frame giao diện trên Figma để nhận diện các nút, trường nhập liệu, bảng danh sách và tự động viết ngược thành User Story & Acceptance Criteria.

---

## 🚀 3. Hướng Dẫn Cài Đặt Reqwise Figma MCP

### Bước 1: Clone và Build Reqwise
Yêu cầu: Node.js >= 18 và ứng dụng Figma Desktop.
```bash
git clone https://github.com/hoangpm96/reqwise-figma-mcp.git
cd reqwise-figma-mcp
npm install
npm run build
```

### Bước 2: Import Plugin Vào Figma Desktop
1. Mở Figma Desktop.
2. Vào **Menu** -> **Plugins** -> **Development** -> **Import plugin from manifest...**
3. Chọn file `manifest.json` trong thư mục `reqwise-figma-mcp/plugin`.
4. Chạy plugin: **Plugins** -> **Development** -> **Reqwise Figma MCP** và giữ cửa sổ plugin mở khi làm việc.

### Bước 3: Cấu Hình MCP Client Cho AI Agent

#### Cho Claude Desktop (`claude_desktop_config.json`):
```json
{
  "mcpServers": {
    "reqwise-figma": {
      "command": "node",
      "args": ["D:/path/to/reqwise-figma-mcp/dist/index.js"]
    }
  }
}
```

#### Cho Cursor / Antigravity (`mcp_config.json`):
```json
{
  "mcpServers": {
    "reqwise-figma": {
      "command": "node",
      "args": ["D:/path/to/reqwise-figma-mcp/dist/index.js"]
    }
  }
}
```

---

## 💡 Ví Dụ Phối Hợp BA-Kit + Reqwise

1. **Bước 1 (Dùng BA-Kit):** Gõ `/analyze-raw` để xử lý transcript họp -> Gõ `/usecase` để sinh đặc tả luồng thanh toán.
2. **Bước 2 (Dùng Reqwise):** Prompt cho AI Agent:
   > *"Dựa trên use case thanh toán vừa tạo ở trên, hãy dùng công cụ reqwise-figma vẽ trực tiếp Sequence Diagram tương tác giữa Mobile App, Gateway và VNPay lên trang FigJam đang mở."*
