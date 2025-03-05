using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_AccessForm : System.Web.UI.Page
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
        var getData = from tb in db.admin_Forms
                      join module in db.admin_Modules on tb.module_id equals module.module_id
                    
                      select new
                      {
                          tb.form_id,
                          tb.form_name,
                          tb.form_link,
                         
                          module.module_name
                      };
        grvList.DataSource = getData;
        grvList.DataBind();
    }
    private void loadDDL()
    {
        ddlModule.DataSource = from tb in db.admin_Modules  select tb;
        ddlModule.DataBind();
    }
    private void setNULL()
    {
        txtForm.Text = "";
        txtPosition.Value = "1";
        txtLink.Text = "";
    }
    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        loadDDL();
        setNULL();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupShow();", true);
    }
    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        loadDDL();
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "form_id" }));
        Session["_id"] = _id;
        var getData = (from tb in db.admin_Forms
                       where tb.form_id == _id
                       select tb).Single();
        txtForm.Text = getData.form_name;
       
        txtLink.Text = getData.form_link;
        ddlModule.Items.FindByValue(getData.module_id.ToString()).Selected = true;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupShow();", true);
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        cls_AccessForm query;
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "form_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                query = new cls_AccessForm();
                if (query.Form_Xoa(Convert.ToInt32(item)))
                    alert.alert_Success(Page, "Xóa thành công", "");
                else
                    alert.alert_Success(Page, "Xóa thất bại", "");
            }
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "Guide: Tích vào ô đầu dòng.");
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        cls_AccessForm query = new cls_AccessForm();
        if (Session["_id"].ToString() == "0")
        {
            if (query.Form_Them(txtForm.Text, txtLink.Text, Convert.ToInt32(txtPosition.Value), Convert.ToInt32(ddlModule.SelectedItem.Value)))
                alert.alert_Success(Page, "Thêm thành công", "");
            else
                alert.alert_Error(Page, "Thêm thất bại", "");
        }
        else
        {
            if (query.Form_Sua(Convert.ToInt32(Session["_id"].ToString()), txtForm.Text, txtLink.Text, Convert.ToInt32(txtPosition.Value), Convert.ToInt32(ddlModule.SelectedItem.Value)))
                alert.alert_Success(Page, "Cập nhật thành công", "");
            else
                alert.alert_Error(Page, "Cập nhật thất bại", "");
        }
    }
}