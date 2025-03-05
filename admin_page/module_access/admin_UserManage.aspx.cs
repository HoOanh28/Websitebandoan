using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_UserManage : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["userName"].Value != null)
        {
            //admin_User logedMember = Session["AdminLogined"] as admin_User;
            if (!IsPostBack)
            {
                Session["_id"] = 0;
            }
            ddlBophan.DataSource = from gr in db.admin_GroupUsers
                                   where gr.groupuser_id != 1 && gr.groupuser_id != 2
                                   && gr.groupuser_active==true
                                   select gr;
            ddlBophan.DataBind();
        }
        else
        {
            Response.Redirect("/admin-login");
        }
        loadData();
    }
    // Dành cho root
    private void loadData()
    {
        var getData = from u in db.admin_Users
                      join gr in db.admin_GroupUsers on u.groupuser_id equals gr.groupuser_id
                      where u.username_id >= 2 && u.username_active == true
                      select new
                      {
                          u.username_id,
                          u.username_fullname,
                          u.username_phone,
                          u.username_email,
                          u.username_username,
                          gr.groupuser_name,
                          gr.groupuser_id
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txtTenNV.Text = "";
        txtAccount.Text = "";
        txtEmail.Text = "";
        txtPhone.Text = "";
        txtPass.Text = "";
        ddlBophan.Text = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "username_id" }));
        Session["_id"] = _id;
        var getData = (from user in db.admin_Users
                       join gr in db.admin_GroupUsers on user.groupuser_id equals gr.groupuser_id
                       where user.username_id == _id
                       select new
                       {
                           user.username_id,
                           user.username_username,
                           user.username_password,
                           user.username_fullname,
                           user.username_phone,
                           user.username_email,
                           gr.groupuser_id,
                           gr.groupuser_name
                       }).Single();
        txtTenNV.Text = getData.username_fullname;
        ddlBophan.Text = getData.groupuser_name;
        txtEmail.Text = getData.username_email;
        txtPhone.Text = getData.username_phone;
        txtAccount.Text = getData.username_username;
        txtPass.Text = getData.username_password;
        txtPass.Visible = false;
        lbmk.Visible = false;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {

        cls_GiaoVien cls;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "username_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                cls = new cls_GiaoVien();
                if (cls.Linq_Xoa(Convert.ToInt32(item)))
                    alert.alert_Success(Page, "Xóa thành công", "");
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "");
    }

    public bool checknull()
    {
        if (txtAccount.Text != "" && txtPass.Text != "" && txtPhone.Text != "")
            return true;
        else return false;
    }
    //Kiểm tra Email
    private bool isEmail(string txtEmail)
    {
        Regex re = new Regex(@"^(?("")(""[^""]+?""@)|(([0-9a-z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-z])@))" +
        @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-z][-\w]*[0-9a-z]*\.)+[a-z0-9]{2,17}))$",
                      RegexOptions.IgnoreCase);
        return re.IsMatch(txtEmail);
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_GiaoVien cls = new cls_GiaoVien();
        cls_security md5 = new cls_security();
        string passWord = txtPass.Text.Trim();
        string passmd5;
        if (txtPass.Text != "")
            passmd5 = md5.HashCode(txtPass.Text.Trim());
        else
            passmd5 = "";
        //Kiểm tra email có tồn tại
        if (Session["_id"].ToString() == "0")
        {
            //Kiểm tra email có tồn tại
            //var checkemailphone = from check in db.admin_Users where check.username_phone == txtPhone.Text select check;
            //if (isEmail(txtEmail.Text) != true)
            //{
            //    alert.alert_Warning(Page, "Vui Lòng Kiểm tra lại mail của bạn", "");
            //}
            //else if (checkemailphone.Count() > 0)
            //{
            //    alert.alert_Warning(Page, "Số điện thoại đã tồn tại!, Vui lòng kiểm tra lại", "");
            //}
            //else 
            if (Convert.ToInt32(ddlBophan.Value) == 0)
            {
                alert.alert_Warning(Page, "Vui lòng chọn bộ phận nhân viên!", "");
            }
            else
            {
                if (cls.Linq_Them(txtTenNV.Text, Convert.ToInt32(ddlBophan.Value), txtEmail.Text, txtPhone.Text, txtAccount.Text, passmd5))
                {
                    popupControl.ShowOnPageLoad = false;
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Thêm thành công!', '','success').then(function(){window.location = '/admin-account';})", true);
                }
                else alert.alert_Error(Page, "Thêm thất bại", "");
            }
        }
        else
        {
            if (cls.Linq_Sua(Convert.ToInt32(Session["_id"].ToString()), txtTenNV.Text, Convert.ToInt32(ddlBophan.Value), txtEmail.Text, txtPhone.Text, txtAccount.Text, passmd5))
            {
                popupControl.ShowOnPageLoad = false;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "AlertBox", "swal('Cập nhật thành công!', '','success').then(function(){window.location = '/admin-account';})", true);
            }
            else alert.alert_Error(Page, "Cập nhật thất bại", "");
        }
    }

    //protected void grvList_HtmlRowCreated1(object sender, ASPxGridViewTableRowEventArgs e)
    //{
    //    if (e.RowType != GridViewRowType.Data) return;

    //    ASPxLabel label = grvList.FindRowCellTemplateControl(e.VisibleIndex, null,
    //    "txtGioitinh") as ASPxLabel;
    //    var getData = (from gr in db.admin_Users
    //                       //where gr.username_id == _id
    //                   select gr).FirstOrDefault();
    //    if (getData.username_gender == true)
    //    {
    //        label.Text = "Nam";
    //    }
    //}
}