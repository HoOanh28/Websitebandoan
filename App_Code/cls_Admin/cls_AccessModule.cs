using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_AccessModule
/// </summary>
public class cls_AccessModule
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_AccessModule()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private int findIDModule(string name, int position)
    {
        admin_Module query = db.admin_Modules.Where(x => x.module_name == name ).First();
        return query.module_id;
    }
    public bool Module_Them(string module_name, int module_position, string module_icon)
    {
        cls_Access access = new cls_Access();
        admin_Module insert = new admin_Module();
        insert.module_name = module_name;
        insert.module_position = module_position;
        insert.module_active = true;
        insert.module_icon = module_icon;
        db.admin_Modules.InsertOnSubmit(insert);
        try
        {
            db.SubmitChanges();
            access.AccessGroupModule_Them(findIDModule(module_name, module_position), 1);
            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool Module_Sua(int module_id, string module_name, int module_position, string module_icon)
    {
        admin_Module update = db.admin_Modules.Where(x => x.module_id == module_id).FirstOrDefault();
        update.module_name = module_name;
        update.module_position = module_position;
        update.module_active = true;
        update.module_icon = module_icon;
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
    public bool Module_Xoa(int module_id)
    {
        admin_Module delete = db.admin_Modules.Where(x => x.module_id == module_id).FirstOrDefault();
        db.admin_Modules.DeleteOnSubmit(delete);
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