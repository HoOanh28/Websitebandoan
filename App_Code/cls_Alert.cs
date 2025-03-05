using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_Alert
/// </summary>
public class cls_Alert
{
    public cls_Alert()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void alert_Success(Page Currentpage, string msg, string note)
    {
        ScriptManager.RegisterClientScriptBlock(Currentpage, this.GetType(), "Alert", "swal('" + msg + "','" + note + "','success');", true);
    }
    public void alert_Update(Page Currentpage, string msg, string note)
    {
        ScriptManager.RegisterClientScriptBlock(Currentpage, this.GetType(), "Alert", "swal('" + msg + "','" + note + "','success');", true);
    }
    public void alert_Error(Page Currentpage, string msg, string note)
    {
        ScriptManager.RegisterClientScriptBlock(Currentpage, this.GetType(), "Alert", "swal('" + msg + "','" + note + "','error')", true);
    }
    public void alert_Warning(Page Currentpage, string msg, string note)
    {
        ScriptManager.RegisterClientScriptBlock(Currentpage, this.GetType(), "Alert", "swal('" + msg + "','" + note + "','warning')", true);
    }
    public void alert_Info(Page Currentpage, string msg, string note)
    {
        ScriptManager.RegisterClientScriptBlock(Currentpage, this.GetType(), "Alert", "swal('" + msg + "','" + note + "','info')", true);
    }
}