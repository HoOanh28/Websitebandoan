using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_ChangePassword : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"].Value != null)
        {
            if (!IsPostBack)
            {
                Session["_id"] = 0;

            }
        }
        else
        {
            Response.Redirect("/admin-login");
        }
    }
    private bool SendMail(string email)
    {

        if (email != "")
        {
            try
            {
                var fromAddress = "thongbaovietnhatschool@gmail.com";//  Email Address from where you send the mail 
                var toAddress = email;
                const string fromPassword = "neiabcekdjluofid";
                string subject, title;
                title = "Thông báo";
                subject = "<!DOCTYPE html><html><head><title></title></head><body style=\" width:600px; margin:0px;\"><div>" +
                "<p style=\"margin:0; text-align:left;color:#000000;font-size:17px\">Bạn đã thay đổi mật khẩu. Mật khẩu mới của bạn là: </p><p style=\"text-align:left;color:#1442e8;font-size:20px; margin:0\">" + txtMatKhauMoi.Text + "</p><p style=\"font-size:17px; margin:0\">Xin cảm ơn!</p>" +
                "</div></body></html>";
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 20000;
                }
                MailMessage mm = new MailMessage();
                mm.From = new MailAddress(fromAddress, "Trường Liên cấp Việt Nhật");
                mm.Subject = title;
                mm.To.Add(toAddress);
                mm.IsBodyHtml = true;
                mm.Body = subject;
                smtp.Send(mm);
                return true;
            }
            catch
            {
                return false;
            }
        }
        else
            return false;
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        //lấy thông tin của tk login
        var getuser = (from u in db.admin_Users
                       where u.username_username == Request.Cookies["UserName"].Value
                       select u).FirstOrDefault();
        cls_security md5 = new cls_security();
        string passmd5 = md5.HashCode(txtMatKhauCu.Text);
        //var checkTaiKhoan = (from tk in db.admin_Users where tk.username_username == Session["AdminLogined"].ToString() && tk.username_password == passmd5 select tk).SingleOrDefault();
        if (getuser.username_password != passmd5)
        {
            alert.alert_Warning(Page, "Mật khẩu cũ nhập không đúng!", "");

        }
        else if (getuser.username_password == passmd5)
        {
            if (txtMatKhauMoi.Text == "")
            {
                alert.alert_Warning(Page, "Bạn chưa nhập mật khẩu mới!", "");
            }
            else if (txtNhapLai.Text == "")
            {
                alert.alert_Warning(Page, "Vui lòng xác nhận lại mật khẩu!", "");
            }
            else if (txtMatKhauMoi.Text != txtNhapLai.Text)
            {
                alert.alert_Warning(Page, "Mật khẩu mới nhập không khớp!", "");
            }
            else
            {
                admin_User checkTaiKhoan1 = (from tk in db.admin_Users where tk.username_id == getuser.username_id select tk).SingleOrDefault();
                checkTaiKhoan1.username_password = md5.HashCode(txtNhapLai.Text);
                //checkTaiKhoan1.username_email = txtEmail.Text;
                db.SubmitChanges();
                //checkTaiKhoan1.username_email
                SendMail("luuvanquyet2612@gmail.com");
                //xóa cookie
                HttpCookie ck = new HttpCookie("UserName");
                string s = ck.Value;
                ck.Value = "";  //set a blank value to the cookie 
                ck.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(ck);
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Mật khẩu đã được thay đổi!', 'Vui lòng đăng nhập lại hệ thống','success').then(function(){window.location = '/admin-login';})", true);
            }
        }
    }
}