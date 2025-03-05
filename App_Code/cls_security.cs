using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for cls_security
/// </summary>
public class cls_security
{
	public cls_security()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public bool ValidateMD5HashData(string strInput, string strStoreHash)
    {
        string getHash = HashCode(strInput);
        if (string.Compare(getHash, strStoreHash) == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public string StringImage(string strInput)
    {
        //create new instance of md5
        MD5 md5 = MD5.Create();

        //convert the input text to array of bytes
        byte[] hashData = md5.ComputeHash(Encoding.Default.GetBytes(strInput));

        //create new instance of StringBuilder to save hashed data
        StringBuilder returnValue = new StringBuilder();

        //loop for each byte and add it to StringBuilder
        for (int i = 0; i < hashData.Length; i++)
        {
            returnValue.Append(hashData[i].ToString());
        }
        // return hexadecimal string
        return returnValue.ToString();
    }
    public string HashCode(string strInput)
    {
        //create new instance of md5
        MD5 md5 = MD5.Create();

        //convert the input text to array of bytes
        byte[] hashData = md5.ComputeHash(Encoding.Default.GetBytes(strInput));

        //create new instance of StringBuilder to save hashed data
        StringBuilder returnValue = new StringBuilder();

        //loop for each byte and add it to StringBuilder
        for (int i = hashData.Length - 1; i >= 0; i--)
        {
            returnValue.Append(hashData[i].ToString());
        }
        // return hexadecimal string
        return returnValue.ToString();
    }
}