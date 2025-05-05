using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Web_MasterPage : System.Web.UI.MasterPage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int countCart = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Khởi tạo giỏ hàng nếu chưa tồn tại
            if (Session["Cart"] == null)
            {
                List<cls_Cart> cart = new List<cls_Cart>();
                Session["Cart"] = cart;
            }
        }
        Menu();
       

        // Load số lượng giỏ hàng
        if (Session["Cart"] != null)
        {
            List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];
            countCart = cart.Count();
        }
    }

    protected void Menu()
    {
        rpMenu.DataSource = from m in db.tb_Categories select m;
        rpMenu.DataBind();
    }

    

    public void AddToCart(int productId, string productName, decimal price)
    {
        // Kiểm tra nếu Session["Cart"] là null thì khởi tạo
        if (Session["Cart"] == null)
        {
            Session["Cart"] = new List<cls_Cart>();
        }

        // Lấy giỏ hàng từ Session
        List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];

        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
        var existingProduct = cart.FirstOrDefault(item => item.id == productId);

        if (existingProduct != null)
        {
            // Nếu sản phẩm đã có, tăng số lượng lên
            existingProduct.number++;
            existingProduct.total = existingProduct.number * existingProduct.price;
        }
        else
        {
            // Nếu chưa có, thêm mới vào giỏ hàng với đầy đủ thuộc tính
            cls_Cart newItem = new cls_Cart
            {
                id = productId,
                name = productName,
                price = Convert.ToInt32(price),
                number = 1,
                total = Convert.ToInt32(price),
                ProductId = productId,
                ProductName = productName,
                Price = price,
                Quantity = 1,
                image = ""  // Có thể cập nhật sau nếu cần
            };
            cart.Add(newItem);
        }

        // Cập nhật giỏ hàng vào Session
        Session["Cart"] = cart;

        // Cập nhật số lượng giỏ hàng hiển thị
        countCart = cart.Count;
    }

    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        int productId = Convert.ToInt32(Request.QueryString["id"]);

        // Tìm ContentPlaceHolder chứa lblProductName
        ContentPlaceHolder content = (ContentPlaceHolder)this.FindControl("MainContent");

        // Tìm lblProductName và lblPrice
        Label lblProductName = (Label)content.FindControl("lblProductName");
        Label lblPrice = (Label)content.FindControl("lblPrice");

        if (lblProductName != null && lblPrice != null)
        {
            string productName = lblProductName.Text;
            decimal price = Convert.ToDecimal(lblPrice.Text);

            // Gọi phương thức AddToCart từ MasterPage
            this.AddToCart(productId, productName, price);

            Response.Redirect("gio-hang.aspx");
        }
        else
        {
            Response.Write("<script>alert('Lỗi: Không tìm thấy sản phẩm!');</script>");
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        HttpCookie ck = new HttpCookie("User");

        // Xóa giá trị của cookie
        ck.Value = "";

        // Đặt thời gian hết hạn cho cookie, đặt giá trị âm để ngay lập tức hết hiệu lực
        ck.Expires = DateTime.Now.AddDays(-1);

        // Thêm cookie đã sửa đổi vào Response
        Response.Cookies.Add(ck);

        // Chuyển hướng người dùng đến trang đăng nhập
        Response.Redirect("/login");
    }
}

