using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for cls_AccessForm
/// </summary>
public class cls_AccessForm
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    public cls_AccessForm()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    private int findIDForm(string form_name, int form_position, string form_link)
    {
        admin_Form query = db.admin_Forms.Where(x => x.form_name == form_name && x.form_link == form_link).First();
        return query.form_id;
    }
    public bool Form_Them(string form_name, string form_link, int form_position, int module_id)
    {
        cls_Access access = new cls_Access();
        admin_Form insert = new admin_Form();
        insert.form_name = form_name;
        insert.form_position = form_position;
        insert.form_link = form_link;
        insert.module_id = module_id;
        insert.form_active = true;
        db.admin_Forms.InsertOnSubmit(insert);
        try
        {
            db.SubmitChanges();
            access.AccessGroupForm_Them(findIDForm(form_name, form_position, form_link), 1);
            access.AccessUserForm_Them(findIDForm(form_name, form_position, form_link), 1);
            return true;
        }
        catch
        {
            return false;
        }
    }
    public bool Form_Sua(int form_id, string form_name, string form_link, int form_position, int module_id)
    {
        admin_Form update = db.admin_Forms.Where(x => x.form_id == form_id).FirstOrDefault();
        update.form_name = form_name;
        update.form_position = form_position;
        update.form_link = form_link;
        update.module_id = module_id;
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
    public bool Form_Xoa(int form_id)
    {
        admin_Form delete = db.admin_Forms.Where(x => x.form_id == form_id).FirstOrDefault();
        db.admin_Forms.DeleteOnSubmit(delete);
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