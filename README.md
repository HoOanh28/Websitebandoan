#Xây Dựng Website Bán đồ ăn  - ASP.NET C#

Giới thiệu
Website bán đồ ăn được xây dựng bằng ngôn ngữ C#, sử dụng công nghệ ASP.NET và công cụ phát triển Visual Studio 2019. Website cung cấp chức năng giúp người dùng xem thực đơn, chọn món, đặt hàng . Quản trị viên có thể quản lý món ăn, đơn hàng và khách hàng trên hệ thống. Giao diện website thân thiện, giúp nâng cao trải nghiệm người dùng và hỗ trợ hoạt động kinh doanh hiệu quả hơn.
Công nghệ sử dụng
Ngôn ngữ: C#
Framework: ASP.NET Web Forms 
IDE: Visual Studio 2019
Cơ sở dữ liệu: SQL Server
Giao diện: HTML, CSS, JavaScript, Bootstrap
Tính năng chính
✅ Trang chủ hiển thị sản phẩm nổi bật, 
✅ Xem danh mục và chi tiết sản phẩm
✅ Đăng ký / đăng nhập tài khoản người dùng
✅ Thêm vào giỏ hàng và đặt hàng
✅ Quản lý sản phẩm và đơn hàng (Admin)
✅ Đặt bàn
Cách chạy dự án
Bước 1: Mở dự án
Mở “Visual Studio 2019”
Chọn “File → Open → Web Site”
Trỏ đến thư mục dự án (nơi chứa các file .aspx và Web.config)
Bước 2: Kết nối cơ sở dữ liệu
Mở SQL Server Explorer (menu View → Server Explorer). Mở kết nối đến SQL Server chứa database bạn đã attach. Nếu chưa có kết nối, nhấn chuột phải vào Data Connections → Add Connection... Chọn SQL Server, đăng nhập và chọn database đã attach. Mở rộng danh sách Tables trong database. Kéo bảng (ví dụ: Products, Users, Orders...) vào vùng thiết kế của file .dbml.
Cập nhật chuỗi kết nối trong Web.config nếu cần
Bước 3: Thiết lập trang khởi động
Trong Solution Explorer, chuột phải vào Default.aspx → Chọn View in browser
Trình duyệt sẽ mở và hiển thị giao diện trang web
Tài khoản mẫu
Người dùng
Tài khoản: ho oanh
Mật khẩu: ho oanh
Quản trị viên
Tài khoản: root (admin)
Mật khẩu: 12345
Sinh viên thực hiện
Họ và tên: Hồ Thị Oanh  21CNTT1
           Đỗ Thị Quỳnh Nhi 21CNTT2
GVHD: Phạm Anh Phương
Trường Đại học Sư Phạm Đà Nẵng
