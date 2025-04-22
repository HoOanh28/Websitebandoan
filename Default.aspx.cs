using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var getMenu1 = (from pr in db.tb_Products
                        where pr.cate_id == 1
                        orderby pr.pr_id descending
                        select pr).Take(1);
        var getMenu2 = (from pr in db.tb_Products
                        where pr.cate_id == 2
                        orderby pr.pr_id descending
                        select pr).Take(1);
        getMenu2 = getMenu2.Union(getMenu1);
        var getMenu3 = (from pr in db.tb_Products
                        where pr.cate_id == 3
                        orderby pr.pr_id descending
                        select pr).Take(1);
        getMenu3 = getMenu3.Union(getMenu2);
        var getMenu4 = (from pr in db.tb_Products
                        where pr.cate_id == 4
                        orderby pr.pr_id descending
                        select pr).Take(1);

        getMenu4 = getMenu4.Union(getMenu3);
        rpMenu.DataSource = getMenu4;
        rpMenu.DataBind();
    }

    // ... existing code ...
    protected void btnAdd_ServerClick(object sender, EventArgs e)
    {
        if (Request.Cookies["User"] == null)
        {
            Response.Redirect("/login");
        }
        else
        {
            int productId = Convert.ToInt32(txtId.Value);
            List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];

            // Check if the product already exists in the cart
            cls_Cart existingItem = cart.FirstOrDefault(item => item.id == productId);

            if (existingItem != null)
            {
                // If the product already exists, just increase the quantity
                existingItem.number += 1;
                existingItem.total = existingItem.number * existingItem.price;
            }
            else
            {
                // If the product is not in the cart, add it as a new item
                cls_Cart _cart = new cls_Cart
                {
                    id = productId,
                    number = 1,
                    name = (from pr in db.tb_Products
                            where pr.pr_id == productId
                            select pr).FirstOrDefault().pr_name,
                    image = (from pr in db.tb_Products
                             where pr.pr_id == productId
                             select pr).FirstOrDefault().pr_image,
                    total = Convert.ToInt32((from pr in db.tb_Products
                                             where pr.pr_id == productId
                                             select pr).FirstOrDefault().pr_price),
                    price = Convert.ToInt32((from pr in db.tb_Products
                                             where pr.pr_id == productId
                                             select pr).FirstOrDefault().pr_price),
                };
                cart.Add(_cart);
            }

            Session["Cart"] = cart;
            Response.Redirect("/gio-hang");
        }
    }
}