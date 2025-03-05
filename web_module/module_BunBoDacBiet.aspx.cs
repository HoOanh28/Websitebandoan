using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_BunBoChiTiet : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string _Name, _Info, _Link;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = RouteData.Values["url-san-pham"].ToString();
        var getData = from pr in db.tb_Products
                      where pr.link == url
                      select pr;
        rpChiTiet.DataSource = getData;
        rpChiTiet.DataBind();
        var getCate = (from cate in db.tb_Categories
                      where cate.cate_id == getData.FirstOrDefault().cate_id
                      select cate).FirstOrDefault();
        _Name = getCate.cate_name;
        _Info = getData.FirstOrDefault().pr_information;
        _Link = getCate.link;
    }

    protected void btnAdd_ServerClick(object sender, EventArgs e)
    {
        if (Request.Cookies["User"] == null)
        {
            Response.Redirect("/login");
        }
        else
        {
            cls_Cart _cart = new cls_Cart
            {
                id = Convert.ToInt32(txtId.Value),
                number = 1,
                name = (from pr in db.tb_Products
                        where pr.pr_id == Convert.ToInt32(txtId.Value)
                        select pr).FirstOrDefault().pr_name,
                image = (from pr in db.tb_Products
                         where pr.pr_id == Convert.ToInt32(txtId.Value)
                         select pr).FirstOrDefault().pr_image,
                total = Convert.ToInt32((from pr in db.tb_Products
                                         where pr.pr_id == Convert.ToInt32(txtId.Value)
                                         select pr).FirstOrDefault().pr_price),
                price = Convert.ToInt32((from pr in db.tb_Products
                                         where pr.pr_id == Convert.ToInt32(txtId.Value)
                                         select pr).FirstOrDefault().pr_price),
            };
            List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];
            cart.Add(_cart);
            Session["Cart"] = cart;
            Response.Redirect("/gio-hang");
        }
    }
}