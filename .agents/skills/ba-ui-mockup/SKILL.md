---
name: ba-ui-mockup
description: "Phác thảo ASCII Wireframe và sinh prompt dán sẵn (paste-ready prompts) cho Figma Make, Google Stitch hoặc v0.dev để tạo UI Mockup trực tiếp từ spec BA. USE WHEN the user says 'phác thảo wireframe', 'sinh prompt figma', 'tạo UI mockup từ spec', 'vẽ wireframe ascii', '/mockup', '/wireframe', or wants to bridge BA specifications into UI mockups."
---

# Phác Thảo Wireframe & Sinh Prompt Thiết Kế Giao Diện (UI Mockup Bridge)

Kỹ năng này đóng vai trò cầu nối trực tiếp giữa **Đặc tả nghiệp vụ của BA** và **Đội ngũ thiết kế UI/UX**, giúp:
1. Phác thảo nhanh bố cục màn hình bằng **ASCII Wireframe** chuẩn cấu trúc 5 cột trực tiếp trên tài liệu Markdown.
2. Tự động sinh ra **Prompt dán sẵn (Paste-Ready Prompts)** cho các công cụ AI Design hiện đại như **Figma Make, Google Stitch, v0.dev** để sinh bản thiết kế tương tác thực tế chỉ sau 1 click mà không cần BA phải tự vẽ tay.

---

## 📐 1. Cấu Trúc Bố Cục ASCII Wireframe (Per-Flow Table)

Khi mô tả giao diện trong tài liệu, sử dụng định dạng ASCII Wireframe trực quan:

```text
+-----------------------------------------------------------------------------------+
|  [Logo] S-TOS Port Operation System          [User: Nguyen Van A (Operator) v] [Log]
+-----------------------------------------------------------------------------------+
| [Sidebar]       |  BÀN LÀM VIỆC / QUẢN LÝ QUÉT MÃ CONTAINER TẠI CỔNG               |
| - Tổng quan     |-----------------------------------------------------------------|
| - Quét cổng     |  BỘ LỌC TÌM KIẾM                                                |
| - Bãi bốc dỡ    |  [ Số Cont: [________] ] [ Loại Cont: [Tất cả v] ] [ [🔍 Tìm] ] |
| - Báo cáo ca    |-----------------------------------------------------------------|
| - Cài đặt       |  DANH SÁCH CONTAINER ĐÃ QUÉT TRONG CA                           |
|                 |  +----+--------------+--------+-------------+----------+-------+|
|                 |  | STT| SỐ CONTAINER | KÍCH CỠ| THỜI GIAN   | TRẠNG THÁI| THAO TÁC||
|                 |  +----+--------------+--------+-------------+----------+-------+|
|                 |  | 01 | CMAU1234567  | 40HC   | 14:20 13/10 | [Đã duyệt]| [Xem] ||
|                 |  | 02 | OOCU9876543  | 20DC   | 14:15 13/10 | [Chờ quét]| [Sửa] ||
|                 |  +----+--------------+--------+-------------+----------+-------+|
|                 |  Hiển thị 1-10 của 120 bản ghi               [<] [1] [2] [3] [>]|
+-----------------+-----------------------------------------------------------------+
|  Phím tắt: [F2: Quét mới] | [F4: Xuất báo cáo] | [ESC: Đóng hộp thoại]            |
+-----------------------------------------------------------------------------------+
```

---

## 🎨 2. Sinh Prompt Dán Sẵn Cho Các Công Cụ AI Design

Khi người dùng muốn chuyển spec thành giao diện trực quan, skill sẽ sinh ra 2 khối prompt chuẩn:

### 2.1 Prompt dành cho Figma Make / Google Stitch
```text
[SYSTEM CONTEXT]:
You are a senior UI/UX designer creating high-fidelity, clean enterprise dashboard interfaces.
Target theme: Professional Enterprise, Modern Clean, Deep Blue & Slate Gray Palette, High contrast for operational clarity.

[SCREEN LAYOUT & REQUIREMENTS]:
- Screen Title: [Tên Màn Hình / Phân Hệ]
- Primary Users: [Chân Dung Người Dùng]
- Layout Architecture:
  1. Top Navigation Bar: Breadcrumbs, Global Search, Notification Bell, User Avatar & Role.
  2. Main Work Area:
     - Header: Title, Action Buttons ([+ Tạo Mới - Primary Blue Button], [Xuất Excel - Secondary Outline Button]).
     - Search / Filter Card: Inline form containing inputs for [Field 1], [Field 2 (Dropdown)], and [Apply Filter Button].
     - Data Table: Sticky header, zebra-striping rows, status badges ([Green for Approved], [Orange for Pending], [Red for Rejected]). Action column with inline action icons (View, Edit, More options).
     - Pagination footer: Items per page selector, total count display, and page navigation buttons.

[DESIGN SYSTEM CONSTRAINTS]:
- Typography: Inter or Roboto, clear hierarchy (H1 24px semi-bold, body 14px regular, captions 12px).
- Spacing: 8pt grid system.
- Components: Accessible inputs with floating labels, hover states on buttons, clear empty-state illustrations when no records exist.
```

### 2.2 Prompt dành cho v0.dev / HTML Prototype (Tạo mã React + Tailwind)
```text
Create a modern, responsive enterprise management interface using Next.js (App Router), Tailwind CSS, Lucide Icons, and Shadcn UI components.
The screen is a [Tên Màn Hình] featuring:
- A filter bar with inputs: [Danh sách ô lọc].
- A responsive data table with columns: [Danh sách cột].
- Status badges with distinct semantic colors.
- A sliding sheet / modal for creating or editing records.
- Realistic mock data (5-7 rows).
Keep the design sleek, professional, and accessible.
```

---

## 📋 Đầu Ra Của Kỹ Năng
1. Bản phác thảo ASCII Wireframe nhúng trực tiếp vào tài liệu Markdown.
2. Khối lệnh Copy-Paste để người dùng ném thẳng vào Figma Make hoặc Google Stitch hoặc v0.dev.
