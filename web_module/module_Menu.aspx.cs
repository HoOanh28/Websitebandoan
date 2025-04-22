using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_Menu : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var getMon = from pr in db.tb_Products
                     join ct in db.tb_Categories on pr.cate_id equals ct.cate_id
                     select pr;

        rpMon.DataSource = getMon;
        rpMon.DataBind();
    }

    protected void btnDatMon_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["User"] == null)
        {
            Response.Redirect("/login");
        }
        else
        {
            LinkButton btn = (LinkButton)sender;
            int productId = Convert.ToInt32(btn.CommandArgument);
            
            // Lấy giỏ hàng từ Session
            List<cls_Cart> cart;
            
            // Kiểm tra xem Session["Cart"] có tồn tại không
            if (Session["Cart"] == null)
            {
                // Nếu không tồn tại, tạo giỏ hàng mới
                cart = new List<cls_Cart>();
            }
            else
            {
                // Nếu đã tồn tại, lấy giỏ hàng từ Session
                cart = (List<cls_Cart>)Session["Cart"];
            }

            // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
            cls_Cart existingItem = cart.FirstOrDefault(item => item.id == productId);

            if (existingItem != null)
            {
                // Nếu sản phẩm đã có, tăng số lượng lên
                existingItem.number += 1;
                existingItem.total = existingItem.number * existingItem.price;
            }
            else
            {
                // Nếu chưa có, thêm mới vào giỏ hàng
                var product = db.tb_Products.FirstOrDefault(pr => pr.pr_id == productId);

                if (product != null)
                {
                    cls_Cart newItem = new cls_Cart
                    {
                        id = productId,
                        name = product.pr_name,
                        image = product.pr_image,
                        number = 1,
                        price = Convert.ToInt32(product.pr_price),
                        total = Convert.ToInt32(product.pr_price),
                        ProductId = productId,
                        ProductName = product.pr_name,
                        Price = Convert.ToInt32(product.pr_price),
                        Quantity = 1
                    };
                    cart.Add(newItem);
                }
            }

            Session["Cart"] = cart;
            Response.Redirect("/gio-hang");
        }
    }
}