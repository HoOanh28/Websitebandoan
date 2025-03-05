using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_GioHang : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int total = 0;
    public string none;
    cls_Alert alert = new cls_Alert();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["User"] == null)
            {
                Response.Redirect("/login");
            }
        }

        List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];
        rpGioHang.DataSource = cart;
        rpGioHang.DataBind();
        if (Session["Cart"] != null)
        {
            foreach (var item in cart)
            {
                total += item.total;
            }
        }
        if (total == 0)
        {
            none = "style='display: none'";
        }

    }


    protected void btnAdd_ServerClick(object sender, EventArgs e)
    {
        List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];

        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
        cls_Cart existingProduct = cart.FirstOrDefault(p => p.id == Convert.ToInt32(txtId.Value));

        if (existingProduct != null)
        {
            existingProduct.number += 1;
            existingProduct.total = existingProduct.number * existingProduct.price;
        }
        txtId.Value = "";
        Session["Cart"] = cart;
        Response.Redirect("/gio-hang");
    }

    protected void btnGiam_ServerClick(object sender, EventArgs e)
    {
        List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];

        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
        cls_Cart existingProduct = cart.FirstOrDefault(p => p.id == Convert.ToInt32(txtId.Value));

        if (existingProduct != null)
        {
            if (existingProduct.number > 1)
            {
                existingProduct.number -= 1;
                existingProduct.total = existingProduct.number * existingProduct.price;
            }
            else
            {
                cart.Remove(existingProduct);
            }
        }
        txtId.Value = "";
        Session["Cart"] = cart;
        Response.Redirect("/gio-hang");
    }

    protected void btnDel_ServerClick(object sender, EventArgs e)
    {
        List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];

        // Xóa sản phẩm khỏi giỏ hàng dựa trên ID
        cls_Cart productToRemove = cart.FirstOrDefault(p => p.id == Convert.ToInt32(txtId.Value));

        if (productToRemove != null)
        {
            cart.Remove(productToRemove);
        }
        Session["Cart"] = cart;
        Response.Redirect("/gio-hang");
    }

    protected void btnSave_ServerClick(object sender, EventArgs e)
    {
        try
        {
            tb_Order ins = new tb_Order();
            ins.order_creationdate = DateTime.Now;
            ins.us_id = (from u in db.tb_Users
                         where u.us_username == Request.Cookies["User"].Value
                         select u).FirstOrDefault().us_id;
            ins.order_status = "Đang chờ";
            ins.order_total = Convert.ToString(total);
            db.tb_Orders.InsertOnSubmit(ins);
            db.SubmitChanges();

            List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];
            foreach (var item in cart)
            {
                tb_OrderDetail insd = new tb_OrderDetail();
                insd.pr_id = item.id;
                insd.pr_pricecurrent = Convert.ToString(item.price);
                insd.pr_number = item.number;
                insd.order_id = (from o in db.tb_Orders orderby o.order_id descending select o).FirstOrDefault().order_id;
                db.tb_OrderDetails.InsertOnSubmit(insd);
                db.SubmitChanges();
            }
            Session["Cart"] = null;
            //alert.alert_Success(Page, "Đặt hàng thành công", "");
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Đặt hàng thành công','','success').then(function(){window.location = '/trang-chu';})", true);
            //Response.Redirect("/trang-chu");
        }
        catch
        {
            alert.alert_Warning(Page, "Đặt hàng thất bại", "");
        }
    }
}