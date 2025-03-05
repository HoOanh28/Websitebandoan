using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_AccessModule : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["_id"] = 0;
        }
        loadData();
    }
    private void loadData()
    {
        var getData = from tb in db.admin_Modules
                      select tb;
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void setNULL()
    {
        txtModule.Text = "";
        txtPosition.Value = "1";
        txtIcon.Text = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupShow();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "module_id" }));
        Session["_id"] = _id;
        var getData = (from tb in db.admin_Modules
                       where tb.module_id == _id
                       select tb).Single();
        txtModule.Text = getData.module_name;
       
        txtIcon.Text = getData.module_icon;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupShow();", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_AccessModule query;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "module_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                query = new cls_AccessModule();
                if (query.Module_Xoa(Convert.ToInt32(item)))
                    alert.alert_Success(Page, "Xóa thành công", "");
                else
                    alert.alert_Error(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "Guide: Check vào ô đầu dòng.");
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_AccessModule query = new cls_AccessModule();
        if (Session["_id"].ToString() == "0")
            if (query.Module_Them(txtModule.Text, Convert.ToInt32(txtPosition.Value), txtIcon.Text))
                alert.alert_Success(Page, "Thêm thành công", "");
            else
                alert.alert_Error(Page, "Thêm thất bại", "");
        else
            if (query.Module_Sua(Convert.ToInt32(Session["_id"].ToString()), txtModule.Text, Convert.ToInt32(txtPosition.Value), txtIcon.Text))
                alert.alert_Success(Page, "Cập nhật thành công", "");
            else
                alert.alert_Error(Page, "Cập nhật thất bại", "");
    }
}