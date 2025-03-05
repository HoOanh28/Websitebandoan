using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Web_MasterPage : System.Web.UI.MasterPage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Khởi tạo giỏ hàng nếu chưa tồn tại
            if (Session["Cart"] == null)
            {
                List<cls_Cart> cart = new List<cls_Cart>();
                Session["Cart"] = cart;
            }
        }
        Menu();
        HeThong();
    
    }
    protected void Menu()
	{
        rpMenu.DataSource = from m in db.tb_Categories
                            select m;
        rpMenu.DataBind();
	}
    protected void HeThong()
	{
        rpHeThong.DataSource = from ht in db.tb_Restaurants
                               select ht;
        rpHeThong.DataBind();
	}
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        HttpCookie ck = new HttpCookie("User");

        // Xóa giá trị của cookie
        ck.Value = "";

        // Đặt thời gian hết hạn cho cookie, đặt giá trị âm để ngay lập tức hết hiệu lực
        ck.Expires = DateTime.Now.AddDays(-1);

        // Thêm cookie đã sửa đổi vào Response
        Response.Cookies.Add(ck);

        // Chuyển hướng người dùng đến trang đăng nhập
        Response.Redirect("/login");
    }

}
