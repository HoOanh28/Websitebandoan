using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_QuanLySanPham_admin_QuanLyNhomSanPham : System.Web.UI.Page
{
	dbcsdlDataContext db = new dbcsdlDataContext();
	cls_Alert alert = new cls_Alert();
	private int _id;
	private string image;
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Session["_id"] = 0;

			//loadCate();
		}
		loadData();
	}

	protected void loadData()
	{
		ddlCate.DataSource = from cate in db.tb_Categories select cate;
		ddlCate.DataBind();

		grvList.DataSource = from pr in db.tb_Products
							 join cate in db.tb_Categories on pr.cate_id equals cate.cate_id
							 orderby pr.pr_id descending
							 select new
							 {
								 pr.pr_id,
								 pr.pr_name,
								 pr.pr_price,
								 pr.pr_status,
								 pr.pr_information,
								 pr.pr_image,
								 cate.cate_name,
								 pr._keywords,
								 pr._description,
								 pr.pr_content,
								 pr.link,
							 };
		grvList.DataBind();
	}

	protected void btnThem_Click(object sender, EventArgs e)
	{
		txtName.Text = "";
		txtKeywords.Text = "";
		txtDescription.Text = "";
		txtLink.Text = "";
		edtnoidung.Html = "";
		txt_Image.Value = "";
		txtPrice.Text = "";
		ddlCate.Text = "";
		txtContent.Text = "";
		Session["_id"] = 0;
		ddlCate.DataSource = from ct in db.tb_Categories select ct;
		ddlCate.DataBind();
		//ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupShow();", true);
		ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupControl.Show();showImg('');", true);
	}

	protected void btnChiTiet_Click(object sender, EventArgs e)
	{
		_id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "pr_id" }));
		Session["_id"] = _id;
		var getData = from pr in db.tb_Products
					  join cate in db.tb_Categories on pr.cate_id equals cate.cate_id
					  where pr.pr_id == _id
					  
					  select new
					  {
						  cate.cate_name,
						  pr.pr_image,
						  pr.pr_information,
						  pr.pr_name,
						  pr.pr_price,
						  pr._description,
						  pr._keywords,
						  pr.pr_content,
						  pr.link
					  };
		txtName.Text = getData.FirstOrDefault().pr_name;
		txtKeywords.Text = getData.FirstOrDefault()._keywords;
		txtDescription.Text = getData.FirstOrDefault()._description;
		txtLink.Text = getData.FirstOrDefault().link;
		edtnoidung.Html = getData.FirstOrDefault().pr_information;
		txt_Image.Value = getData.FirstOrDefault().pr_image;
		txtPrice.Text = getData.FirstOrDefault().pr_price;
		ddlCate.Text = getData.FirstOrDefault().cate_name;
		txtContent.Text = getData.FirstOrDefault().pr_content;
		ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupControl.Show();", true);
	}

	protected void btnXoa_Click(object sender, EventArgs e)
	{
		List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "pr_id" });
		if (selectedKey.Count > 0)
		{
			foreach (var item in selectedKey)
			{
				tb_Product del = db.tb_Products.Where(x => x.pr_id == Convert.ToInt32(item)).FirstOrDefault();
				del.pr_status = "Hết";
			}
			try
			{
				db.SubmitChanges();
				ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Xoá thành công','','success').then(function(){grvList.Refresh();})", true);
			}
			catch
			{
				alert.alert_Error(Page, "Xoá thất bại", "");
			}
		}
		else
			alert.alert_Warning(Page, "Bạn chưa chọn dữ liệu", "Guide: Tích vào ô đầu dòng.");
	}

	protected void btnLuu_Click(object sender, EventArgs e)
	{
		if (Session["_id"].ToString() == "0")
		{
			if (Page.IsValid && FileUpload1.HasFile)
			{
				String folderUser = Server.MapPath("~/uploadimages/");
				if (!Directory.Exists(folderUser))
				{
					Directory.CreateDirectory(folderUser);
				}
				//string filename;
				string ulr = "uploadimages/";
				HttpFileCollection hfc = Request.Files;
				//string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
				string filename = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
				string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
				FileUpload1.SaveAs(fileName_save);
				image = ulr + filename;
			}

			tb_Product insert = new tb_Product();
			insert.pr_name = txtName.Text;
			insert._keywords = txtKeywords.Text;
			insert._description = txtDescription.Text;
			insert.link = txtLink.Text;
			insert.pr_price = txtPrice.Text;
			insert.pr_content = txtContent.Text;
			insert.pr_information = edtnoidung.Html;
			insert.cate_id = Convert.ToInt32(ddlCate.Value);
			insert.pr_image = image;
			insert.pr_status = "Còn";
			db.tb_Products.InsertOnSubmit(insert);
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
			if (Page.IsValid && FileUpload1.HasFile)
			{
				String folderUser = Server.MapPath("~/uploadimages/");
				if (!Directory.Exists(folderUser))
				{
					Directory.CreateDirectory(folderUser);
				}
				//string filename;
				string ulr = "/uploadimages/";
				HttpFileCollection hfc = Request.Files;
				//string filename = Path.GetRandomFileName() + Path.GetExtension(FileUpload1.FileName);
				string filename = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + FileUpload1.FileName;
				string fileName_save = Path.Combine(Server.MapPath("~/uploadimages"), filename);
				FileUpload1.SaveAs(fileName_save);
				image = ulr + filename;
			}
			tb_Product update = db.tb_Products.Where(x => x.pr_id == Convert.ToInt32(Session["_id"].ToString())).FirstOrDefault();
			update.pr_name = txtName.Text;
			update._keywords = txtKeywords.Text;
			update._description = txtDescription.Text;
			update.link = txtLink.Text;
			update.pr_price = txtPrice.Text;
			update.pr_content = txtContent.Text;
			update.pr_information = edtnoidung.Html;
			update.cate_id = Convert.ToInt32(ddlCate.Value);
			if (image != null)
			{
				update.pr_image = image;
			}
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