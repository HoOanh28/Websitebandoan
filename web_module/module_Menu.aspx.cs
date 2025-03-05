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
}