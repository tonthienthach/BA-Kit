# Cẩm Nang Tra Cứu Nhanh Mermaid Cho BA (Mermaid Cheat Sheet)

Mermaid giúp BA phác thảo sơ đồ trực quan ngay trong tài liệu Markdown mà không cần mở Visio, Draw.io hay Miro.

---

## 1. Flowchart (Sơ Đồ Quy Trình Nghiệp Vụ)
```mermaid
flowchart TD
    Start([Bắt đầu]) --> Step1[Nhập dữ liệu]
    Step1 --> Check{Hợp lệ?}
    Check -- Có --> Save[(Lưu Database)]
    Check -- Không --> Error[Báo lỗi]
    Error --> Step1
    Save --> Done([Hoàn tất])
```

## 2. Sequence Diagram (Sơ Đồ Tương Tác Giữa Các Hệ Thống)
```mermaid
sequenceDiagram
    autonumber
    actor User as Người dùng
    participant UI as Giao diện
    participant API as Backend Service
    participant DB as Cơ sở dữ liệu

    User->>UI: Nhập thông tin & bấm Gửi
    UI->>API: POST /api/v1/resource
    API->>DB: INSERT into table
    DB-->>API: Trả về ID mới
    API-->>UI: 200 OK (Thành công)
    UI-->>User: Hiển thị thông báo hoàn tất
```

## 3. State Diagram (Vòng Đời Trạng Thái)
```mermaid
stateDiagram-v2
    [*] --> DRAFT : Tạo mới
    DRAFT --> SUBMITTED : Gửi duyệt
    SUBMITTED --> APPROVED : Duyệt
    SUBMITTED --> REJECTED : Từ chối
    REJECTED --> DRAFT : Sửa lại
    APPROVED --> COMPLETED : Hoàn thành
    COMPLETED --> [*]
```

## 4. Entity Relationship Diagram (ERD - Cấu Trúc Dữ Liệu)
```mermaid
erDiagram
    ORDER ||--|{ ORDER_ITEM : contains
    CUSTOMER ||--o{ ORDER : places
    
    ORDER {
        string order_id PK "Mã đơn hàng"
        string customer_id FK "Mã khách hàng"
        datetime created_at "Ngày tạo"
        string status "Trạng thái"
    }
```
