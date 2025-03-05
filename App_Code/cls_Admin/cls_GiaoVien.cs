using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_NewsCate
/// </summary>
public class cls_GiaoVien
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_GiaoVien()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool Linq_Them( string name, int bophan, string mail, string phone, string taikhoan, string pass)
    {
        admin_User ins = new admin_User();
        ins.groupuser_id =bophan;
        ins.username_fullname = name;
        ins.username_email = mail;
        ins.username_password = pass;
        ins.username_username = taikhoan;
        ins.username_phone = phone;
        ins.username_active = true;
        db.admin_Users.InsertOnSubmit(ins);
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool Linq_Sua(int giaovien_id, string name, int bophan, string mail, string phone, string taikhoan, string pass)
    {
    
        admin_User ins = db.admin_Users.Where(x => x.username_id == giaovien_id).FirstOrDefault();
        ins.groupuser_id = bophan;
        ins.username_fullname = name;
        ins.username_email = mail;
        ins.username_password = pass;
        ins.username_username = taikhoan;
        ins.username_phone = phone;
        ins.username_active = true;
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool Linq_Xoa(int giaovien_id)
    {
        admin_User delete1 = db.admin_Users.Where(x => x.username_id == giaovien_id).FirstOrDefault();
        db.admin_Users.DeleteOnSubmit(delete1);
        try
        {
            db.SubmitChanges();
            return true;
        }
        catch
        {
            return false;
        }
    }
}