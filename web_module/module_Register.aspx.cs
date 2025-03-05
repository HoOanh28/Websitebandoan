using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_Register : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_ServerClick(object sender, EventArgs e)
    {
        if (txtAddress.Value != "" && txtCfPass.Value != "" && txtEmail.Value != "" && txtPass.Value != "" && txtPhone.Value != "" && txtTen.Value != "" && txtUsername.Value != "")
        {
            if (txtPass.Value == txtCfPass.Value)
            {
                tb_User ins = new tb_User();
                ins.us_address = txtAddress.Value;
                ins.us_email = txtEmail.Value;
                ins.us_password = txtPass.Value;
                ins.us_phone = txtPhone.Value;
                ins.us_name = txtTen.Value;
                ins.us_username = txtUsername.Value;
                try
                {
                    db.tb_Users.InsertOnSubmit(ins);
                    db.SubmitChanges();
                    alert.alert_Success(Page, "Đăng kí thành công", "");
                }
                catch
                {
                    alert.alert_Warning(Page,"Đăng kí thất bại","");
                }
            }
            else
            {
                alert.alert_Warning(Page, "Mật khẩu xác nhận không đúng","");
            }
        }
        else
        {
            alert.alert_Warning(Page, "Vui lòng điều đầy đủ thông tin", "");
        }
    }
}