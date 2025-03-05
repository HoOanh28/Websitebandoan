using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_Login : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["AdminLogined"] != null)
        //{
        //    Response.Redirect("/Admin_Default.aspx");
        //}
        if (!IsPostBack)
        {
            if (Request.Cookies["UserName"] != null)
            {
                txtUser.Value = Request.Cookies["UserName"].Value;
            }
        }
    }
    protected void btnLogin_ServerClick(object sender, EventArgs e)
    {
        cls_security md5 = new cls_security();
        string passmd5 = md5.HashCode(txtPassword.Value);
        string userName = txtUser.Value.Trim();
        var viewUserName = from tb in db.admin_Users
                           where tb.username_username == userName.ToLower()
                           && tb.username_password == passmd5
                           && tb.username_active == true
                           select tb;

        if (viewUserName.Count() > 0)
        {
            admin_User list = viewUserName.Single();
            HttpCookie ck = new HttpCookie("UserName");
            string s = ck.Value;
            ck.Value = userName;
            ck.Expires = DateTime.Now.AddDays(365);
            Response.Cookies.Add(ck);
            Response.Redirect("/admin-home");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Sai tên đăng nhập / mật khẩu!', '','warning')", true);
        }
    }
}