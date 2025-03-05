using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class web_module_module_BunHue : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public string title, des;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = RouteData.Values["url-nhom-san-pham"].ToString();
        var getMon = from pr in db.tb_Products
                     join ct in db.tb_Categories on pr.cate_id equals ct.cate_id
                     where ct.link == url
                     select pr;
        title = (from cate in db.tb_Categories
                 where cate.link == url
                 select cate).FirstOrDefault().cate_name;
        des = (from cate in db.tb_Categories
               where cate.link == url
               select cate).FirstOrDefault()._description;
        rpMon.DataSource = getMon;
        rpMon.DataBind();
    }
}