using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_QuanLySanPham_admin_QuanLyNhomSanPham : System.Web.UI.Page
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
    protected void loadData()
    {
        grvList.DataSource = from us in db.tb_Users
                             join od in db.tb_Orders on us.us_id equals od.us_id
                             //join ordt in db.tb_OrderDetails on od.order_id equals ordt.order_id
                             //join pr in db.tb_Products on ordt.pr_id equals pr.pr_id
                             where od.order_status != "Đã xong"
                             orderby od.order_id descending
                             select new
                             {
                                 od.order_id,
                                 us.us_name,
                                 us.us_phone,
                                 us.us_email,
                                 us.us_address,
                                 od.order_status,
                                 od.order_creationdate,
                                 order_total = od.order_total + " vnđ",
                             };
        grvList.DataBind();
    }

    protected void btnThem_Click(object sender, EventArgs e)
    {
        Session["_id"] = 0;
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupShow();", true);
    }

    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        _id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "order_id" }));
        Session["_id"] = _id;
        var getData = from od in db.tb_OrderDetails
                      join pr in db.tb_Products on od.pr_id equals pr.pr_id
                      where od.order_id == _id
                      select new
                      {
                          pr.pr_name,
                          od.pr_number,
                          od.pr_pricecurrent,
                      };
        rpChiTiet.DataSource = getData;
        rpChiTiet.DataBind();
        ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupShow();", true);
    }

    protected void btnXoa_Click(object sender, EventArgs e)
    {
        List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "order_id" });
        if (selectedKey.Count > 0)
        {
            foreach (var item in selectedKey)
            {
                tb_Order del = db.tb_Orders.Where(x => x.order_id == Convert.ToInt32(item)).FirstOrDefault();
                del.order_status = "Đã xong";
            }
            db.SubmitChanges();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Duyệt thành công','','success').then(function(){grvList.Refresh();})", true);
        }
        else
            alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "Guide: Tích vào ô đầu dòng.");
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (Session["_id"].ToString() == "0")
        {
            tb_Category insert = new tb_Category();
            //insert.cate_name = txtName.Text;
            //insert._keywords = txtKeywords.Text;
            //insert._description = txtDescription.Text;
            //insert.link = txtLink.Text;
            db.tb_Categories.InsertOnSubmit(insert);
            try
            {
                db.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Thêm thành công','','success').then(function(){grvList.Refresh();})", true);
            }
            catch
            {
                alert.alert_Error(Page, "Thêm thất bại", "");
            }
        }
        else
        {
            tb_Category update = db.tb_Categories.Where(x => x.cate_id == Convert.ToInt32(Session["_id"].ToString())).FirstOrDefault();
            //update.cate_name = txtName.Text;
            //update._keywords = txtKeywords.Text;
            //update._description = txtDescription.Text;
            //update.link = txtLink.Text;
            try
            {
                db.SubmitChanges();
                ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thành công','','success').then(function(){grvList.Refresh();})", true);
            }
            catch
            {
                alert.alert_Error(Page, "Cập nhật thất bại", "");
            }
        }
    }
}