using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.IO.Compression;

/// <summary>
/// Summary description for GlobalGZip
/// </summary>
public class GlobalGZip : System.Web.HttpApplication
{
    public GlobalGZip()
    {
        InitializeComponent();
    }

    private void InitializeComponent()
    {
        this.PostReleaseRequestState += new EventHandler(Global_PostReleaseRequestState);
    }

    /// <summary>
    /// Event handler for PostReleaseRequestState
    /// </summary>
    private void Global_PostReleaseRequestState(object sender, EventArgs e)
    {
        string contentType = Response.ContentType; // Get the content type.

        // Compress only html and stylesheet documents.
        if (contentType == "text/html" || contentType == "text/css")
        {
            // Get the Accept-Encoding header value to know whether zipping is supported by the browser or not.
            string acceptEncoding = Request.Headers["Accept-Encoding"];

            if (!string.IsNullOrEmpty(acceptEncoding))
            {
                // If gzip is supported then gzip it else if deflate compression is supported then compress in that technique.
                if (acceptEncoding.Contains("gzip"))
                {
                    // Compress and set Content-Encoding header for the browser to indicate that the document is zipped.
                    Response.Filter = new GZipStream(Response.Filter, CompressionMode.Compress);
                    Response.AppendHeader("Content-Encoding", "gzip");
                }
                else if (acceptEncoding.Contains("deflate"))
                {
                    // Compress and set Content-Encoding header for the browser to indicate that the document is zipped.
                    Response.Filter = new DeflateStream(Response.Filter, CompressionMode.Compress);
                    Response.AppendHeader("Content-Encoding", "deflate");
                }
            }
        }
    }
}