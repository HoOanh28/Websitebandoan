using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Compilation;
using System.Web.Routing;

/// <summary>
/// Summary description for cls_routes
/// </summary>
public class cls_routes
{
	public cls_routes()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void RegisterRoutes(RouteCollection routes)
    {
        List<string> listmodule = new List<string> { "adminaccess", "adminbase", "adminmodule", "webui" };
        foreach (string modulestr in listmodule)
        {
            List<string> listroutes = InvokeByName(modulestr, "UrlRoutes");
            if (listroutes.Count > 0)
            {
                foreach (string routesstr in listroutes)
                {
                    string[] temproutes = routesstr.Trim().Split('|');
                    if (temproutes.Length > 2)
                        routes.MapPageRoute(temproutes[0], temproutes[1], temproutes[2]);
                }
            }
        }
    }
    public List<string> InvokeByName(string typeName, string methodName)
    {
        Type type = BuildManager.GetType(typeName, false);
        if (type == null)
            return null;
        Object obj = Activator.CreateInstance(type);
        MethodInfo methodInfo = type.GetMethod(methodName);
        return (List<string>)methodInfo.Invoke(obj, null);
    }
}