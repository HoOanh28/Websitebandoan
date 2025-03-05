using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_Access
/// </summary>
public class cls_Access
{
    dbcsdlDataContext db = new dbcsdlDataContext();
	public cls_Access()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void AccessGroupModule_Them(int idModule, int idGroupUser)
    {
        admin_AccessGroupUserModule insert = new admin_AccessGroupUserModule();
        insert.groupuser_id = idGroupUser;
        insert.module_id = idModule;
        insert.gum_active = true;
        db.admin_AccessGroupUserModules.InsertOnSubmit(insert);
        try
        {
            db.SubmitChanges();
        }
        catch { }
    }
    public void AccessGroupModule_Sua(int idModule, int idGroupUser, bool active)
    {
        admin_AccessGroupUserModule update = db.admin_AccessGroupUserModules.Where(x => x.module_id == idModule && x.groupuser_id == idGroupUser).FirstOrDefault();
        update.gum_active = active;
        try
        {
            db.SubmitChanges();
        }
        catch { }
    }

    public void AccessGroupForm_Them(int idForm, int idGroupUser)
    {
        admin_AccessGroupUserForm insert = new admin_AccessGroupUserForm();
        insert.groupuser_id = idGroupUser;
        insert.form_id = idForm;
        insert.guf_active = true;
        db.admin_AccessGroupUserForms.InsertOnSubmit(insert);
        try
        {
            db.SubmitChanges();
        }
        catch { }
    }
    public void AccessGroupForm_Sua(int idForm, int idGroupUser, bool active)
    {
        admin_AccessGroupUserForm update = db.admin_AccessGroupUserForms.Where(x => x.form_id == idForm && x.groupuser_id == idGroupUser).FirstOrDefault();
        update.guf_active = active;
        try
        {
            db.SubmitChanges();
        }
        catch { }
    }

    public void AccessUserForm_Them(int idForm, int idUser)
    {
        admin_AccessUserForm insert = new admin_AccessUserForm();
        insert.username_id = idUser;
        insert.form_id = idForm;
        insert.uf_active = true;
        db.admin_AccessUserForms.InsertOnSubmit(insert);
        try
        {
            db.SubmitChanges();
        }
        catch { }

    }
    public void AccessUserForm_Sua(int idForm, int idUser, bool active)
    {
        admin_AccessUserForm update = db.admin_AccessUserForms.Where(x => x.form_id == idForm && x.username_id == idUser).FirstOrDefault();
        update.uf_active = active;
        try
        {
            db.SubmitChanges();
        }
        catch { }
    }
}