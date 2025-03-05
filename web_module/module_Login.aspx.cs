using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_Login : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["User"] != null)
            {
                Response.Redirect("/trang-chu");
            }
        }
    }

    protected void btnLogin_ServerClick(object sender, EventArgs e)
    {
        var viewUserName = from u in db.tb_Users
                           where u.us_username == txtTen.Value
                           && u.us_password == txtPass.Value
                           && u.us_acti == false
                           select u;

        if (viewUserName.Count() > 0)
        {
            tb_User list = viewUserName.Single();
            HttpCookie ck = new HttpCookie("User");
            string s = ck.Value;
            ck.Value = txtTen.Value;
            ck.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(ck);
            Response.Redirect("/trang-chu");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Sai tên đăng nhập / mật khẩu!', '','warning')", true);
        }
    }
}