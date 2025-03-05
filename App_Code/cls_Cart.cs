using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for cls_Cart
/// </summary>
public class cls_Cart
{
    public cls_Cart()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int id { get; set; }
    public string name { get; set; }
    public string image { get; set; }
    public int number { get; set; }
    public int price { get; set; }
    public int total { get; set; }
}