---
name: ba-diagram
description: "Thiết kế và sinh mã sơ đồ nghiệp vụ trực quan bằng cú pháp Mermaid chuẩn (Flowchart, Sequence Diagram, State Diagram, ERD). USE WHEN the user says 'vẽ sơ đồ', 'vẽ sequence diagram', 'vẽ flowchart luồng', 'vẽ sơ đồ trạng thái', 'vẽ ERD', 'tạo diagram nghiệp vụ', '/diagram', or asks to create diagrams for business processes or architectures."
---

# Thiết Kế Sơ Đồ Nghiệp Vụ & Dữ Liệu Bằng Mermaid

Kỹ năng này giúp BA tự động chuyển hóa mô tả logic bằng lời, tài liệu quy trình, hoặc yêu cầu kỹ thuật thành các sơ đồ **Mermaid** chuẩn xác, thẩm mỹ cao và render được ngay lập tức trên Markdown, Notion, Confluence, GitHub hoặc IDE.

---

## 1. Các Loại Sơ Đồ Trọng Tâm & Cú Pháp Mẫu

### 1.1 Sơ Đồ Luồng Nghiệp Vụ (Flowchart / Activity Diagram)
**Mục đích:** Mô tả các bước thao tác của người dùng, các điểm rẽ nhánh logic (Decision points), và kết thúc luồng.

```mermaid
flowchart TD
    Start([Bắt đầu: Người dùng nhấn Xác nhận]) --> CheckAuth{Đã đăng nhập?}
    
    CheckAuth -- Chưa --> RedirectLogin[Chuyển hướng đến màn hình Đăng nhập]
    RedirectLogin --> EndFail([Kết thúc: Chưa xác thực])
    
    CheckAuth -- Rồi --> ValidateInput{Dữ liệu hợp lệ?}
    ValidateInput -- Không --> ShowError[Hiển thị thông báo lỗi trường dữ liệu]
    ShowError --> InputRetry[Người dùng sửa lại form]
    InputRetry --> ValidateInput
    
    ValidateInput -- Hợp lệ --> CheckBizRule{Thỏa quy tắc nghiệp vụ?}
    CheckBizRule -- Không --> AlertBiz[Cảnh báo vi phạm quy tắc]
    AlertBiz --> EndFail2([Kết thúc: Từ chối])
    
    CheckBizRule -- Đạt --> SaveDB[(Lưu vào Cơ sở dữ liệu)]
    SaveDB --> SendNotify[Gửi thông báo / Email xác nhận]
    SendNotify --> EndSuccess([Kết thúc: Thành công])
```

---

### 1.2 Sơ Đồ Tuần Tự (Sequence Diagram)
**Mục đích:** Thể hiện thứ tự gửi thông điệp (gọi API, truy vấn DB, gọi service ngoài) giữa Actor, Frontend, Backend Services và Database.

```mermaid
sequenceDiagram
    autonumber
    actor User as Người dùng / Khách hàng
    participant FE as Frontend / Web App
    participant GW as API Gateway / Service
    participant DB as Cơ sở dữ liệu
    participant ThirdParty as Dịch vụ Bên Thứ 3 (VNPay/SMS)

    User->>FE: 1. Nhập thông tin & bấm "Thanh toán"
    FE->>FE: 2. Client validation
    alt Dữ liệu không hợp lệ
        FE-->>User: Hiển thị lỗi form
    else Dữ liệu hợp lệ
        FE->>GW: POST /api/v1/payments (Payload)
        activate GW
        GW->>DB: Kiểm tra trạng thái đơn hàng
        DB-->>GW: Trả về trạng thái (PENDING)
        
        GW->>ThirdParty: Gọi tạo giao dịch thanh toán
        ThirdParty-->>GW: Trả về Payment URL / QR Code
        
        GW->>DB: Cập nhật mã giao dịch (TRANSACTION_ID)
        GW-->>FE: 200 OK (Payment URL)
        deactivate GW
        
        FE-->>User: Hiển thị màn hình / QR Code thanh toán
    end
```

---

### 1.3 Sơ Đồ Máy Trạng Thái (State Diagram)
**Mục đích:** Thể hiện toàn bộ vòng đời (Lifecycle) của một thực thể (Đơn hàng, Container, Booking, Hóa đơn...), các điều kiện kích hoạt chuyển trạng thái và trạng thái cuối cùng.

```mermaid
stateDiagram-v2
    [*] --> DRAFT: Tạo mới / Lưu nháp
    
    DRAFT --> SUBMITTED: Người dùng gửi yêu cầu duyệt
    DRAFT --> CANCELLED: Người dùng hủy nháp
    
    SUBMITTED --> UNDER_REVIEW: Điều độ viên / Quản lý tiếp nhận
    
    UNDER_REVIEW --> REJECTED: Từ chối (Lý do: Không đủ điều kiện)
    REJECTED --> DRAFT: Người dùng chỉnh sửa lại
    
    UNDER_REVIEW --> APPROVED: Phê duyệt thành công
    
    APPROVED --> PROCESSING: Bắt đầu thực hiện (Phát hành lệnh)
    
    PROCESSING --> COMPLETED: Hoàn tất công việc / Xuất bến
    PROCESSING --> FAILED: Xảy ra sự cố bất khả kháng
    
    COMPLETED --> [*]
    CANCELLED --> [*]
```

---

### 1.4 Sơ Đồ Quan Hệ Thực Thể (Entity Relationship Diagram - ERD)
**Mục đích:** Mô tả các bảng dữ liệu, khóa chính (PK), khóa ngoại (FK), các trường dữ liệu và quan hệ giữa các thực thể (1-1, 1-N, N-N).

```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--|{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : "ordered in"
    ORDERS ||--|| INVOICES : generates

    CUSTOMERS {
        string customer_id PK "Mã khách hàng"
        string full_name "Họ và tên"
        string email "Địa chỉ email"
        string phone "Số điện thoại"
        string status "Trạng thái (ACTIVE/INACTIVE)"
    }

    ORDERS {
        string order_id PK "Mã đơn hàng"
        string customer_id FK "Khóa ngoại khách hàng"
        datetime order_date "Ngày đặt hàng"
        decimal total_amount "Tổng tiền"
        string status "Trạng thái (NEW/PAID/SHIPPED)"
    }

    ORDER_ITEMS {
        string item_id PK "Mã dòng hàng"
        string order_id FK "Khóa ngoại đơn hàng"
        string product_id FK "Khóa ngoại sản phẩm"
        int quantity "Số lượng"
        decimal unit_price "Đơn giá tại thời điểm mua"
    }

    PRODUCTS {
        string product_id PK "Mã sản phẩm"
        string product_name "Tên sản phẩm"
        string sku "Mã SKU"
        decimal price "Giá niêm yết"
        int stock_qty "Tồn kho"
    }

    INVOICES {
        string invoice_id PK "Mã hóa đơn"
        string order_id FK "Khóa ngoại đơn hàng"
        string invoice_no "Số hóa đơn điện tử"
        datetime issued_at "Ngày phát hành"
        string tax_code "Mã số thuế"
    }
```

---

## 2. Quy Tắc Tránh Lỗi Khi Viết Mermaid Cho BA

1. **Bọc nhãn chứa ký tự đặc biệt:** Nếu tên node hoặc mô tả chứa dấu ngoặc đơn `()`, dấu phẩy `,`, dấu hai chấm `:`, luôn bọc nội dung trong ngoặc kép: `id["Nhãn có (thông tin thêm)"]`.
2. **Tránh thẻ HTML phức tạp:** Không sử dụng các thẻ HTML lồng nhau trong nhãn node để tránh lỗi parser trên các viewer markdown khác nhau.
3. **Màu sắc và phân nhóm trực quan:** Dùng `subgraph` trong flowchart để nhóm các phân hệ, hệ thống liên quan (ví dụ: `subgraph Frontend`, `subgraph Core Banking`).
4. **Luôn có chú thích nghiệp vụ:** Đặt tên tiếng Việt rõ ràng, dễ hiểu cho cả người làm nghiệp vụ lẫn lập trình viên.
