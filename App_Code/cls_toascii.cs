using System;
using System.Text.RegularExpressions;

public static class cls_ToAscii
{
    /*
     * Chuyển chuỗi unicode sang ascii (lọc bỏ dấu tiếng việt) 
     */
    static public String ToAscii(this String unicode)
    {
        //Thuong
        unicode = Regex.Replace(unicode, "[áàảãạăắằẳẵặâấầẩẫậ]", "a");
        unicode = Regex.Replace(unicode, "[óòỏõọôồốổỗộơớờởỡợ]", "o");
        unicode = Regex.Replace(unicode, "[éèẻẽẹêếềểễệ]", "e");
        unicode = Regex.Replace(unicode, "[íìỉĩị]", "i");
        unicode = Regex.Replace(unicode, "[úùủũụưứừửữự]", "u");
        unicode = Regex.Replace(unicode, "[ýỳỷỹỵ]", "y");
        unicode = Regex.Replace(unicode, "[đ]", "d");
        //In
        unicode = Regex.Replace(unicode, "[ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ]", "A");
        unicode = Regex.Replace(unicode, "[ÓÒỎÕỌÔỐỒỔỖỘƠỞỠỜỚỢ]", "O");
        unicode = Regex.Replace(unicode, "[ÉÈẺẼẸÊỂỄỀẾỆ]", "E");
        unicode = Regex.Replace(unicode, "[ÍÌỈĨỊ]", "I");
        unicode = Regex.Replace(unicode, "[ÚÙỦŨỤƯỨỪỬỮỰ]", "U");
        unicode = Regex.Replace(unicode, "[ÝỲỶỸỴ]", "Y");
        unicode = Regex.Replace(unicode, "[Đ]", "D");
        unicode = Regex.Replace(unicode, "[-\\s+/]+", "-");
        unicode = Regex.Replace(unicode, "[^a-zA-Z_0-9/.]+", "-"); //Nếu bạn muốn thay dấu khoảng trắng thành dấu "_" hoặc dấu cách " " thì thay kí tự bạn muốn vào đấu "-"
        return unicode;
    }

    static public String ConvertToUnSign(this String unicode)
    {
        unicode = Regex.Replace(unicode, "[áàảãạăắằẳẵặâấầẩẫậ]", "a");
        unicode = Regex.Replace(unicode, "[óòỏõọôồốổỗộơớờởỡợ]", "o");
        unicode = Regex.Replace(unicode, "[éèẻẽẹêếềểễệ]", "e");
        unicode = Regex.Replace(unicode, "[íìỉĩị]", "i");
        unicode = Regex.Replace(unicode, "[úùủũụưứừửữự]", "u");
        unicode = Regex.Replace(unicode, "[ýỳỷỹỵ]", "y");
        unicode = Regex.Replace(unicode, "[đ]", "d");
        //In
        unicode = Regex.Replace(unicode, "[ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ]", "A");
        unicode = Regex.Replace(unicode, "[ÓÒỎÕỌÔỐỒỔỖỘƠỞỠỜỚỢ]", "O");
        unicode = Regex.Replace(unicode, "[ÉÈẺẼẸÊỂỄỀẾỆ]", "E");
        unicode = Regex.Replace(unicode, "[ÍÌỈĨỊ]", "I");
        unicode = Regex.Replace(unicode, "[ÚÙỦŨỤƯỨỪỬỮỰ]", "U");
        unicode = Regex.Replace(unicode, "[ÝỲỶỸỴ]", "Y");
        unicode = Regex.Replace(unicode, "[Đ]", "D");
        //unicode = Regex.Replace(unicode, "[-\\s+/]+", "-");
        unicode = Regex.Replace(unicode, "[^a-zA-Z_0-9/.]+", " ");
        return unicode;
    }
}