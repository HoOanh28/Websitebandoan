using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
		grvList.DataSource = from ct in db.tb_Restaurants
							 where ct.acti == "true"
							 select ct;
		grvList.DataBind();
	}
	protected void setNULL()
	{
		txtName.Text = "";
		txtAddress.Text = "";
		txtPhone.Text = "";
		txtEmail.Text = "";
	}
	protected void btnThem_Click(object sender, EventArgs e)
	{
		setNULL();
		Session["_id"] = 0;
		ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupShow();", true);
	}

	protected void btnChiTiet_Click(object sender, EventArgs e)
	{
		_id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "re_id" }));
		Session["_id"] = _id;
		var getData = from ct in db.tb_Restaurants
					  where ct.re_id == _id
					  select ct;
		txtName.Text = getData.FirstOrDefault().re_name;
		txtAddress.Text = getData.FirstOrDefault().re_address;
		txtPhone.Text = getData.FirstOrDefault().phone;
		txtEmail.Text = getData.FirstOrDefault().email;
		ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupShow();", true);
	}

	protected void btnXoa_Click(object sender, EventArgs e)
	{
		List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "cate_id" });
		if (selectedKey.Count > 0)
		{
			foreach (var item in selectedKey)
			{
				tb_Restaurant del = db.tb_Restaurants.Where(x => x.re_id == Convert.ToInt32(item)).FirstOrDefault();
				del.acti = "false";
			}
			try
			{
				db.SubmitChanges();
				ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Xoá thành công','','success').then(function(){grvList.Refresh();})", true);
			}
			catch
			{
				alert.alert_Error(Page, "Cập nhật thất bại", "");
			}
		}
		else
			alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "Guide: Tích vào ô đầu dòng.");
	}

	protected void btnLuu_Click(object sender, EventArgs e)
	{
		if (Session["_id"].ToString() == "0")
		{
			tb_Restaurant insert = new tb_Restaurant();
			insert.re_name = txtName.Text;
			insert.re_address = txtAddress.Text;
			insert.phone = txtPhone.Text;
			insert.email = txtEmail.Text;
			db.tb_Restaurants.InsertOnSubmit(insert);
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
			tb_Restaurant update = db.tb_Restaurants.Where(x => x.re_id == Convert.ToInt32(Session["_id"].ToString())).FirstOrDefault();
			update.re_name = txtName.Text;
			update.re_address = txtAddress.Text;
			update.phone = txtPhone.Text;
			update.email = txtEmail.Text;
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