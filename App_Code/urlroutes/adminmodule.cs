using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminmodule
/// </summary>
public class adminmodule
{
    public adminmodule()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        // Quản lý sản phẩm
        list.Add("moduleadminquanlynhomsanpham|admin-quan-ly-nhom-san-pham|~/admin_page/module_function/module_QuanLySanPham/admin_QuanLyNhomSanPham.aspx");
        list.Add("moduleadminquanlysanpham|admin-quan-ly-san-pham|~/admin_page/module_function/module_QuanLySanPham/admin_QuanLySanPham.aspx");
        // Quản lý hệ thống
        list.Add("moduleadminquanlyhethong|admin-address|~/admin_page/module_function/admin_QuanLyHeThong.aspx");
        // Quản lý Website
        list.Add("moduleadmintraikhoangkhachhang|admin-account-user|~/admin_page/module_function/module_QuanLyWebsite/admin_TaiKhoangKhachHang.aspx");
        // Quản lý Đơn Hàng
        list.Add("moduleadminquanlydatban|admin-book|~/admin_page/module_function/module_QuanLyDonHang/admin_QuanLyDatBan.aspx");
        list.Add("moduleadminquanlydonhang|admin-order|~/admin_page/module_function/module_QuanLyDonHang/admin_QuanLyDonHang.aspx");
        list.Add("moduleadminquanlythongke|admin-statistical|~/admin_page/module_function/module_QuanLyDonHang/admin_QuanLyThongKe.aspx");
        return list;
    }
}