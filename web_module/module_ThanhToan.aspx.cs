using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_ThanhToan : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public int total = 0;
    cls_Alert alert = new cls_Alert();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if user is logged in
            if (Request.Cookies["User"] == null)
            {
                Response.Redirect("/login");
                return;
            }

            // Check if cart exists and has items
            if (Session["Cart"] == null)
            {
                Response.Redirect("/gio-hang");
                return;
            }

            // Auto-fill user information if available
            int userId = (from u in db.tb_Users
                          where u.us_username == Request.Cookies["User"].Value
                          select u.us_id).FirstOrDefault();

            var userInfo = (from u in db.tb_Users
                            where u.us_id == userId
                            select u).FirstOrDefault();

            if (userInfo != null)
            {
                txtName.Value = userInfo.us_name;
                txtPhone.Value = userInfo.us_phone;
                txtEmail.Value = userInfo.us_email;
                txtAddress.Value = userInfo.us_address;
            }
        }

        // Display cart items
        List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];
        rpGioHang.DataSource = cart;
        rpGioHang.DataBind();

        // Calculate total
        if (Session["Cart"] != null)
        {
            foreach (var item in cart)
            {
                total += item.total;
            }
        }
    }

    protected void btnThanhToan_ServerClick(object sender, EventArgs e)
    {
        try
        {
            // Validate required fields
            if (string.IsNullOrEmpty(txtName.Value) || string.IsNullOrEmpty(txtPhone.Value) || string.IsNullOrEmpty(txtAddress.Value))
            {
                alert.alert_Warning(Page, "Vui lòng điền đầy đủ thông tin bắt buộc", "");
                return;
            }

            // Create order
            tb_Order order = new tb_Order();
            order.order_creationdate = DateTime.Now;
            order.us_id = (from u in db.tb_Users
                           where u.us_username == Request.Cookies["User"].Value
                           select u).FirstOrDefault().us_id;
            order.order_status = "Đang chờ xử lý";
            order.order_total = Convert.ToString(total);

            // Add payment method
            if (vnpay.Checked)
            {
                order.order_payment_method = "Thanh toán qua VNPAY";
            }
            else if (vnpay.Checked)
            {
                order.order_payment_method = "Chuyển khoản ngân hàng";
            }
            else
            {
                order.order_payment_method = "Thanh toán khi nhận hàng (COD)";
            }

            // Add shipping info
            order.order_address = txtAddress.Value;
            order.order_phone = txtPhone.Value;
            order.order_note = txtNote.Value;

            // Save order to database
            db.tb_Orders.InsertOnSubmit(order);
            db.SubmitChanges();

            // Get newly created order ID
            int orderId = (from o in db.tb_Orders orderby o.order_id descending select o).FirstOrDefault().order_id;

            // Add order details
            List<cls_Cart> cart = (List<cls_Cart>)Session["Cart"];
            foreach (var item in cart)
            {
                tb_OrderDetail orderDetail = new tb_OrderDetail();
                orderDetail.pr_id = item.id;
                orderDetail.pr_pricecurrent = Convert.ToString(item.price);
                orderDetail.pr_number = item.number;
                orderDetail.order_id = orderId;
                db.tb_OrderDetails.InsertOnSubmit(orderDetail);
                db.SubmitChanges();
            }

            // If VNPAY selected, redirect to VNPAY payment gateway
            if (vnpay.Checked)
            {
                Session["OrderId"] = orderId;
                RedirectToVnPayGateway(orderId);
                return;
            }

            // Clear cart for non-VNPay transactions
            Session["Cart"] = null;

            // Show success message and redirect
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert",
                "swal('Đặt hàng thành công','Cảm ơn bạn đã mua hàng tại Nét Huế','success').then(function(){window.location = '/trang-chu';})",
                true);
        }
        catch (Exception ex)
        {
            alert.alert_Warning(Page, "Đặt hàng thất bại: " + ex.Message, "");
        }
    }

    private void RedirectToVnPayGateway(int orderId)
    {
        // Get VNPay settings from Web.config
        string vnp_Returnurl = ConfigurationManager.AppSettings["vnp_Returnurl"];
        string vnp_Url = ConfigurationManager.AppSettings["vnp_Url"];
        string vnp_TmnCode = ConfigurationManager.AppSettings["vnp_TmnCode"];
        string vnp_HashSecret = ConfigurationManager.AppSettings["vnp_HashSecret"];
        
        // Create VNPay Library instance
        VnPayLibrary vnpay = new VnPayLibrary();
        
        // Set request parameters
        vnpay.AddRequestData("vnp_Version", "2.1.0");
        vnpay.AddRequestData("vnp_Command", "pay");
        vnpay.AddRequestData("vnp_TmnCode", vnp_TmnCode);
        vnpay.AddRequestData("vnp_Amount", (total * 100).ToString()); // Amount in VND, convert to smallest currency unit (100 = 1 VND)
        
        vnpay.AddRequestData("vnp_CreateDate", DateTime.Now.ToString("yyyyMMddHHmmss"));
        vnpay.AddRequestData("vnp_CurrCode", "VND");
        vnpay.AddRequestData("vnp_IpAddr", Utils.GetIpAddress());
        vnpay.AddRequestData("vnp_Locale", "vn");
        
        // Generate a unique order code
        string orderCode = DateTime.Now.Ticks.ToString();
        vnpay.AddRequestData("vnp_OrderInfo", "Thanh toan don hang " + orderId);
        vnpay.AddRequestData("vnp_OrderType", "fashion"); // Order type
        vnpay.AddRequestData("vnp_ReturnUrl", vnp_Returnurl);
        vnpay.AddRequestData("vnp_TxnRef", orderId.ToString()); // Your order code
        
        // Create payment URL and redirect
        string paymentUrl = vnpay.CreateRequestUrl(vnp_Url, vnp_HashSecret);
        Response.Redirect(paymentUrl);
    }
}