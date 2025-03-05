using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for cls_UploadImage
/// </summary>
public class cls_UploadImage
{
    dbcsdlDataContext db = new dbcsdlDataContext();
 
    public cls_UploadImage()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string uploadSingle(HttpFileCollection fileCollection)
    {
        string filename;
        HttpPostedFile uploadfile = fileCollection[0];
        if (uploadfile.ContentLength > 0)
        {
            filename = "/images/" + DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + uploadfile.FileName;
            string path = HttpContext.Current.Server.MapPath("~/"+filename);
            uploadfile.SaveAs(path);
            return filename;
        }
        return "x";
    }
    public string uploadMulti(HttpFileCollection fileCollection)
    {
        string filename;
        HttpPostedFile uploadfile = fileCollection[0];
        if (uploadfile.ContentLength > 0)
        {
            filename = "/images/" + uploadfile.FileName;
            string path = HttpContext.Current.Server.MapPath("~/images/" + uploadfile.FileName);
            uploadfile.SaveAs(path);
            return filename;
        }
        else
            return "x";
    }
}