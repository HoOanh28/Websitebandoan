using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
/// <summary>
/// Summary description for cls_ExcelImport
/// </summary>
public class cls_ExcelImport : System.Web.UI.Page
{
	public cls_ExcelImport()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void Import(FileUpload fileupload, GridView gridview)
    {
        string FileName = Path.GetFileName(fileupload.PostedFile.FileName);
        string Extension = Path.GetExtension(fileupload.PostedFile.FileName);
        string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

        string FilePath = Server.MapPath(FolderPath + FileName);
        fileupload.SaveAs(FilePath);

        string conStr = "";
        switch (Extension)
        {
            case ".xls": //Excel 97-03
                conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                break;
            case ".xlsx": //Excel 07
                conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                break;
        }
        conStr = String.Format(conStr, FilePath, "Yes");
        OleDbConnection connExcel = new OleDbConnection(conStr);
        OleDbCommand cmdExcel = new OleDbCommand();
        OleDbDataAdapter oda = new OleDbDataAdapter();
        DataTable dt = new DataTable();
        cmdExcel.Connection = connExcel;

        //Get the name of First Sheet
        connExcel.Open();
        DataTable dtExcelSchema;
        dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
        string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
        connExcel.Close();

        //Read Data from First Sheet
        connExcel.Open();
        cmdExcel.CommandText = "SELECT * From [" + SheetName + "]";
        oda.SelectCommand = cmdExcel;
        oda.Fill(dt);
        connExcel.Close();

        //Bind Data to GridView
        gridview.Caption = Path.GetFileName(FilePath);
        gridview.DataSource = dt;
        gridview.DataBind();
    }
}