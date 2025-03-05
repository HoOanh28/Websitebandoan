using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_page_module_access_admin_Access : System.Web.UI.Page
{
    dbcsdlDataContext db = new dbcsdlDataContext();
    private int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        loadGroupUser();
        //loadUser();
    }
    private void loadGroupUser()
    {
        //lấy thông tin của tk đang nhập
        var getuser = (from u in db.admin_Users
                       where u.username_username == Request.Cookies["UserName"].Value
                       select u).FirstOrDefault();
        //admin_User logedMember = Session["AdminLogined"] as admin_User;
        if (getuser.username_id ==2) {
            var loadData = from dt in db.admin_GroupUsers
                           where dt.groupuser_id != 1
                           select dt;
            grvGUser.DataSource = loadData;
            grvGUser.DataBind();
        }
        else
        {
            var getData = from tb in db.admin_GroupUsers
                          select tb;
            grvGUser.DataSource = getData;
            grvGUser.DataBind();
        }
        loadModule();
        loadUserForm2();
    }
    private void loadModule()
    {
        int _idGUser = Convert.ToInt32(grvGUser.GetRowValues(grvGUser.FocusedRowIndex, new string[] { "groupuser_id" }));
        var getData = from tb in db.admin_Modules
                      select new
                      {
                          tb.module_id,
                          tb.module_name,
                          status = (from gum in db.admin_AccessGroupUserModules
                                    where gum.groupuser_id == _idGUser
                                    && gum.module_id == tb.module_id
                                    && gum.gum_active == true
                                    select gum).Count() > 0 ? true : false
                      };
        grvModule.DataSource = getData;
        grvModule.DataBind();
        loadForm();
    }
    private void loadForm()
    {
        int _idGUser = Convert.ToInt32(grvGUser.GetRowValues(grvGUser.FocusedRowIndex, new string[] { "groupuser_id" }));
        int _idModule = Convert.ToInt32(grvModule.GetRowValues(grvModule.FocusedRowIndex, new string[] { "module_id" }));
        var getData = from tb in db.admin_Forms
                      join md in db.admin_Modules on tb.module_id equals md.module_id
                     
                      where md.module_id == _idModule
                      select new
                      {
                          tb.form_id,
                          tb.form_name,
                          status = (from guf in db.admin_AccessGroupUserForms
                                    where guf.groupuser_id == _idGUser
                                    && guf.form_id == tb.form_id
                                    && guf.guf_active == true
                                    select guf).Count() > 0 ? true : false
                      };
        grvForm.DataSource = getData;
        grvForm.DataBind();
    }
    //private void loadUser()
    //{
    //    id = Convert.ToInt32(grvGUser.GetRowValues(grvGUser.FocusedRowIndex, new string[] { "groupuser_id" }));
    //    var getData = from tb in db.admin_Users
    //                  select tb;
    //    grvUser.DataSource = getData;
    //    grvUser.DataBind();
    //    loadUserForm();
    //}
    private void loadUserForm()
    {
        int _idUser = Convert.ToInt32(grvUser.GetRowValues(grvUser.FocusedRowIndex, new string[] { "username_id" }));
        int _idGUser = Convert.ToInt32(db.admin_Users.Where(x => x.username_id == _idUser).First().groupuser_id);

        var getData = from guf in db.admin_AccessGroupUserForms
                      join f in db.admin_Forms on guf.form_id equals f.form_id
                      where guf.guf_active == true
                      && guf.groupuser_id == _idGUser
                      select new
                      {
                          guf.form_id,
                          f.form_name,
                          status = (from uf in db.admin_AccessUserForms
                                    where uf.username_id == _idUser
                                    && uf.form_id == f.form_id
                                    && uf.uf_active == true
                                    select guf).Count() > 0 ? true : false
                      };

        //var getData = from tb in db.admin_Forms
        //              orderby tb.form_position
        //              where md.module_id == _idModule
        //              select new
        //              {
        //                  tb.form_id,
        //                  tb.form_name,
        //                  status = (from guf in db.admin_AccessGroupUserForms
        //                            where guf.groupuser_id == _idGUser
        //                            && guf.form_id == tb.form_id
        //                            && guf.guf_active == true
        //                            select guf).Count() > 0 ? true : false
        //              };
        grvUserForm.DataSource = getData;
        grvUserForm.DataBind();
    }
    protected void btnAccessGUM_Click(object sender, EventArgs e)
    {
        int _idGUser = Convert.ToInt32(grvGUser.GetRowValues(grvGUser.FocusedRowIndex, new string[] { "groupuser_id" }));
        int _idModule = Convert.ToInt32(grvModule.GetRowValues(grvModule.FocusedRowIndex, new string[] { "module_id" }));

        var checkGUM = from tb in db.admin_AccessGroupUserModules
                       where tb.groupuser_id == _idGUser
                       && tb.module_id == _idModule
                       select tb;
        if (checkGUM.Count() > 0)
        {
            admin_AccessGroupUserModule update = checkGUM.FirstOrDefault();
            if (update.gum_active == true)
                update.gum_active = false;
            else
                update.gum_active = true;
        }
        else
        {
            admin_AccessGroupUserModule insert = new admin_AccessGroupUserModule();
            insert.groupuser_id = _idGUser;
            insert.module_id = _idModule;
            insert.gum_active = true;
            db.admin_AccessGroupUserModules.InsertOnSubmit(insert);
        }
        try
        {
            db.SubmitChanges();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thành công','','success').then(function(){grvModule.Refresh();})", true);
        }
        catch
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thất bại','','error')", true);
        }
    }
    protected void btnAccessGUF_Click(object sender, EventArgs e)
    {
        int _idGUser = Convert.ToInt32(grvGUser.GetRowValues(grvGUser.FocusedRowIndex, new string[] { "groupuser_id" }));
        int _idForm = Convert.ToInt32(grvForm.GetRowValues(grvForm.FocusedRowIndex, new string[] { "form_id" }));

        var checkGUF = from tb in db.admin_AccessGroupUserForms
                       where tb.groupuser_id == _idGUser
                       && tb.form_id == _idForm
                       select tb;
        if (checkGUF.Count() > 0)
        {
            admin_AccessGroupUserForm update = checkGUF.FirstOrDefault();
            if (update.guf_active == true)
                update.guf_active = false;
            else
                update.guf_active = true;
        }
        else
        {
            admin_AccessGroupUserForm insert = new admin_AccessGroupUserForm();
            insert.groupuser_id = _idGUser;
            insert.form_id = _idForm;
            insert.guf_active = true;
            db.admin_AccessGroupUserForms.InsertOnSubmit(insert);
        }
        try
        {
            db.SubmitChanges();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thành công','','success').then(function(){grvForm.Refresh();grvUserForm.Refresh();})", true);
        }
        catch
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thất bại','','error')", true);
        }
    }
    protected void btnAccessUF_Click(object sender, EventArgs e)
    {
        int _idUser = Convert.ToInt32(grvUser.GetRowValues(grvUser.FocusedRowIndex, new string[] { "username_id" }));
        int _idForm = Convert.ToInt32(grvUserForm.GetRowValues(grvUserForm.FocusedRowIndex, new string[] { "form_id" }));

        var checkUF = from tb in db.admin_AccessUserForms
                      where tb.username_id == _idUser
                       && tb.form_id == _idForm
                       select tb;
        if (checkUF.Count() > 0)
        {
            admin_AccessUserForm update = checkUF.FirstOrDefault();
            if (update.uf_active == true)
                update.uf_active = false;
            else
                update.uf_active = true;
        }
        else
        {
            admin_AccessUserForm insert = new admin_AccessUserForm();
            insert.username_id = _idUser;
            insert.form_id = _idForm;
            insert.uf_active = true;
            db.admin_AccessUserForms.InsertOnSubmit(insert);
        }
        try
        {
            db.SubmitChanges();
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thành công','','success').then(function(){grvUserForm.Refresh();})", true);
        }
        catch
        {
            ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert", "swal('Cập nhật thất bại','','error')", true);
        }
    }

    private void loadUserForm2()
    {
        id = Convert.ToInt32(grvGUser.GetRowValues(grvGUser.FocusedRowIndex, new string[] { "groupuser_id" }));
        var getData = from tb in db.admin_Users
                      where tb.groupuser_id == id
                      select tb;
        grvUser.DataSource = getData;
        grvUser.DataBind();
        loadUserForm();
    }

    //protected void grvGUser_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
    //{
    //    id = Convert.ToInt32(grvGUser.GetRowValues(grvGUser.FocusedRowIndex, new string[] { "groupuser_id" }));
    //    var getData = from tb in db.admin_Users
    //                  where tb.groupuser_id == id
    //                  select tb;
    //    grvUser.DataSource = getData;
    //    grvUser.DataBind();
    //    loadUserForm();
    //}

    protected void btnChiTiet_Click(object sender, EventArgs e)
    {
        id = Convert.ToInt32(grvGUser.GetRowValues(grvGUser.FocusedRowIndex, new string[] { "groupuser_id" }));
        var getData = from tb in db.admin_Users
                      where tb.groupuser_id == id
                      select tb;
        grvUser.DataSource = getData;
        grvUser.DataBind();
        loadUserForm();
    }
}