<%@ Application Language="C#" Inherits="GlobalGZip"%>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        cls_routes routes = new cls_routes();
        routes.RegisterRoutes(System.Web.Routing.RouteTable.Routes);
    }
    DateTime getWeek(DateTime date)
    {
        var dayOfwe = date.DayOfWeek;
        if (dayOfwe == DayOfWeek.Sunday)
        {
            return date.AddDays(-6);
        }
        int offset = dayOfwe - DayOfWeek.Monday;
        return date.AddDays(-offset);
    }
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        dbcsdlDataContext countTC = new dbcsdlDataContext();
        // Code that runs when a new session is started
        Session.Timeout = 150;
        Application.Lock();
        Application["visitors_online"] = Convert.ToInt32(Application["visitors_online"]) + 1;
        Application.UnLock();
    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
    //protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
    //{
    //    HttpApplication app = sender as HttpApplication;
    //    string acceptEncoding = app.Request.Headers["Accept-Encoding"];
    //    System.IO.Stream prevUncompressedStream = app.Response.Filter;

    //    if (app.Context.CurrentHandler == null)
    //        return;

    //    if (!(app.Context.CurrentHandler is System.Web.UI.Page ||
    //        app.Context.CurrentHandler.GetType().Name == "SyncSessionlessHandler") ||
    //        app.Request["HTTP_X_MICROSOFTAJAX"] != null)
    //        return;

    //    if (acceptEncoding == null || acceptEncoding.Length == 0)
    //        return;

    //    acceptEncoding = acceptEncoding.ToLower();

    //    if (acceptEncoding.Contains("deflate") || acceptEncoding == "*")
    //    {
    //        // deflate
    //        app.Response.Filter = new System.IO.Compression.DeflateStream(prevUncompressedStream,
    //            System.IO.Compression.CompressionMode.Compress);
    //        app.Response.AppendHeader("Content-Encoding", "deflate");
    //    }
    //    else if (acceptEncoding.Contains("gzip"))
    //    {
    //        // gzip
    //        app.Response.Filter = new System.IO.Compression.GZipStream(prevUncompressedStream,
    //            System.IO.Compression.CompressionMode.Compress);
    //        app.Response.AppendHeader("Content-Encoding", "gzip");
    //    }
    //}
</script>
