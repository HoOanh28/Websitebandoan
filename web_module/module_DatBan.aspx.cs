using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_DatBan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        HeThong();
    }
    protected void HeThong()
    {
        rpHeThong.DataSource = from ht in db.tb_Restaurants
                               select ht;
        rpHeThong.DataBind();
    }

	protected void btnDatBan_ServerClick(object sender, EventArgs e)
	{
        tb_Book ins = new tb_Book();
        ins.book_orderer = txtName.Value;
        ins.book_status = "Chưa duyệt";
        ins.book_number = Convert.ToInt32(txtNumber.Value);
        ins.book_email = txtEmail.Value;
        ins.book_phone = txtPhone.Value;
        ins.book_note = txtGhiChu.Value;
        ins.book_date = Convert.ToDateTime(txtDay.Value);
        ins.book_time = Convert.ToDateTime(txtTime.Value).TimeOfDay;
        db.tb_Books.InsertOnSubmit(ins);
        db.SubmitChanges();
        alert.alert_Success(Page, "Đặt bàn thành công", "");
    }
}