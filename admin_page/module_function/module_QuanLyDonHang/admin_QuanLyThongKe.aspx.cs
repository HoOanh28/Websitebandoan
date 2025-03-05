using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_function_module_QuanLyDonHang_admin_QuanLyThongKe : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string _month,_year;
    public string dataMonth = "";
    public string dataYear = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        _month = Convert.ToString(DateTime.Now.Month);
        _year = Convert.ToString(DateTime.Now.Year);
        for (var i = 1; i <= 31; i++)
        {
            if (db.tb_Orders.Where(x => Convert.ToDateTime(x.order_creationdate).Day == i) != null)
            {
                var getTotal = from x in db.tb_Orders
                               where Convert.ToDateTime(x.order_creationdate).Day == i
                               && Convert.ToDateTime(x.order_creationdate).Month == DateTime.Now.Month
                               select new
                               {
                                   x.order_total,
                               };
                int total = 0;
                foreach (var item in getTotal)
                {
                    total += Convert.ToInt32(item.order_total);
                }
                dataMonth += total+",";
            }
            else
            {
                dataMonth += ",";
            }
        }
        for (var i = 1; i <= 12; i++)
        {
            if (db.tb_Orders.Where(x => Convert.ToDateTime(x.order_creationdate).Month == i) != null)
            {
                var getTotal = from x in db.tb_Orders
                               where Convert.ToDateTime(x.order_creationdate).Month == i
                               && Convert.ToDateTime(x.order_creationdate).Year == DateTime.Now.Year
                               select new
                               {
                                   x.order_total,
                               };
                int total = 0;
                foreach (var item in getTotal)
                {
                    total += Convert.ToInt32(item.order_total);
                }
                dataYear += total + ",";
            }
            else
            {
                dataYear += ",";
            }
        }
    }
}