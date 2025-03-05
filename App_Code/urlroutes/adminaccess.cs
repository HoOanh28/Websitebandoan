using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminaccess
/// </summary>
public class adminaccess
{
    public adminaccess()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        //Admin Login
        list.Add("adminlogin|admin-login|~/admin_page/module_access/admin_Login.aspx");
        list.Add("adminforgotpassword|admin-reset|~/admin_page/module_access/admin_ForgotPassword.aspx");
        //Admin Module
        list.Add("adminaccessmodule|admin-module|~/admin_page/module_access/admin_AccessModule.aspx");
        //Admin Form
        list.Add("adminaccessform|admin-form|~/admin_page/module_access/admin_AccessForm.aspx");
        //Admin Access
        list.Add("adminaccess|admin-access|~/admin_page/module_access/admin_Access.aspx");
        //Admin Account
        list.Add("adminacount|admin-account|~/admin_page/module_access/admin_UserManage.aspx");
        //Admin Profile
        list.Add("adminprofile|admin-profile|~/admin_page/module_access/admin_Profile.aspx");
        //Admin Notification
        list.Add("adminnotification|admin-notification|~/admin_page/module_access/admin_Notification.aspx");
        //Admin Setting
        list.Add("adminsetting|admin-setting|~/admin_page/module_access/admin_Setting.aspx");
        return list;
    }
}