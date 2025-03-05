using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminbase
/// </summary>
public class adminbase
{
	public adminbase()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public List<string> UrlRoutes()
    {
        List<string> list = new List<string>();
        list.Add("adminhome|admin-home|~/Admin_Default.aspx");
        return list;
    }
}