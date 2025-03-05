<%@ Page Language="C#" AutoEventWireup="true" CodeFile="module_Note.aspx.cs" Inherits="web_module_desingyourlife_module_Note" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .tex {
            background: black;
        }

        .tribute {
            color: black;
            text-align: center;
            padding: 50px;
        }

            .tribute h1 {
                font-size: 2em;
                margin-bottom: 20px;
                color: black;
                background: black;
                padding: 23px;
                font-weight: bold;
            }

            .tribute h3 {
                font-size: 1.5em;
                margin: 10px;
                font-weight: bold;
            }


        .uppercase-text {
            font-weight: bold;
        }
    </style>
</head>
<body>

    <div class="container-fluid tribute">
        <div class="row">
            <div class="col">
                <div class="text">
                    <h1 class="text-white">HÃY BẮT ĐẦU BẰNG ĐIỂM KẾT THÚC</h1>
                </div>
                <p>Ai cũng có lúc sẽ quay về với Thượng Đế. Hãy suy nghĩ, tới lúc đó, bạn muốn những người còn lại sẽ <span class="uppercase-text">khắc lên tấm bia mộ của mình những dòng chữ gì?</span></p>
                <span class="uppercase-text">Hãy viết lên chính tấm bia này những dòng căn bản nhất, ngắn gọn nhất về...</span>
                <h3>CUỘC ĐỜI CỦA BẠN</h3>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
