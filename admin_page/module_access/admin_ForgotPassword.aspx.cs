using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_ForgotPassword : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SendMail()
    {
        if (txtEmail.Value != "")
        {
            Random rand = new Random((int)DateTime.Now.Ticks);
            //cls_security md5 = new cls_security();
            int numIterations = 0;
            numIterations = rand.Next(1, 100000);
            admin_User update = (from u in db.admin_Users where u.username_email == txtEmail.Value select u).SingleOrDefault();
           // update.username_password = md5.HashCode(numIterations.ToString());
            update.username_password =numIterations.ToString();
            db.SubmitChanges();
            var fromAddress = "tinnhankhachhang@gmail.com";//  tinnhankhachhang@gmail.com
            // pass : abc123#!
            var toAddress = txtEmail.Value; // 
            const string fromPassword = "jcstiaveptusqrxm";//Password of your Email address jcstiaveptusqrxm
            string subject = "Mật khẩu mới của admin";
            string body = "Mật khẩu mới để vào lại website quản trị : " + numIterations.ToString();
            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            smtp.Send(fromAddress, toAddress, subject, body);
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Thành công', 'Vui lòng check mail để xác nhận mật khẩu mới','success').then(function(){window.location = '/admin-login';})", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Lỗi', 'Vui lòng kiểm trả lại email','error').then(function(){window.location = '/admin-login';})", true);
        }
    }
    protected void btnReset_ServerClick(object sender, EventArgs e)
    {
        SendMail();
    }
}