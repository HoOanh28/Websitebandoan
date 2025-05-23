﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
//using System.Web.Mail;
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
		grvList.DataSource = from ct in db.tb_Books
							 orderby ct.book_id descending
							 select ct;
		grvList.DataBind();
	}

	protected void btnThem_Click(object sender, EventArgs e)
	{
		Session["_id"] = 0;
		ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Insert", "popupShow();", true);
	}

	protected void btnChiTiet_Click(object sender, EventArgs e)
	{
		_id = Convert.ToInt32(grvList.GetRowValues(grvList.FocusedRowIndex, new string[] { "cate_id" }));
		Session["_id"] = _id;
		var getData = from ct in db.tb_Categories
					  where ct.cate_id == _id
					  select ct;
		txtName.Text = getData.FirstOrDefault().cate_name;
		txtKeywords.Text = getData.FirstOrDefault()._keywords;
		txtDescription.Text = getData.FirstOrDefault()._description;
		txtLink.Text = getData.FirstOrDefault().link;
		ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Detail", "popupShow();", true);
	}

	protected void btnXoa_Click(object sender, EventArgs e)
	{
		List<object> selectedKey = grvList.GetSelectedFieldValues(new string[] { "book_id" });
		if (selectedKey.Count > 0)
		{
			foreach (var item in selectedKey)
			{
				tb_Book del = db.tb_Books.Where(x => x.book_id == Convert.ToInt32(item)).FirstOrDefault();
				del.book_status = "Đã duyệt";
				//get email của người nhận
				string email = del.book_email;
				//gửi mail thông báo
				SendMail(email);
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
			insert.cate_name = txtName.Text;
			insert._keywords = txtKeywords.Text;
			insert._description = txtDescription.Text;
			insert.link = txtLink.Text;
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
			update.cate_name = txtName.Text;
			update._keywords = txtKeywords.Text;
			update._description = txtDescription.Text;
			update.link = txtLink.Text;
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
				subject = "<!DOCTYPE html><html><head><title></title></head><body ><div>" +
				"<h3 style=\"margin-top:0px; text-align:center; color:#000\">Chúc mừng bạn đã đặt bàn thành công! Nhà hàng đã nhận được thông tin đặt bàn của bạn và sẽ sớm liên hệ để xác nhận chi tiết. Cảm ơn bạn đã tin tưởng và lựa chọn nhà hàng.</h3>" +
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
				mm.From = new MailAddress(fromAddress, "Admin Nét Huế");
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
}