<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_Login.aspx.cs" Inherits="web_module_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <style>
        .form-login {
            display: grid;
            justify-items: center;
        }

            .form-login h3 {
                font-size: 30px;
                font-weight: 400;
            }

            .form-login p {
                font-size: larger;
            }

        .form-input {
            width: 30%;
        }

        .input-dangnhap {
            width: 30%;
            text-align: center;
            background: #cd6420;
            padding: 7px;
            font-size: 20px;
            color: white;
            border-radius: 5px;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 5px;
            font-size: 16px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

            /* Nếu muốn thêm hiệu ứng khi focus vào input */
            input[type="email"]:focus,
            input[type="password"]:focus {
                border-color: #007bff; /* Màu sắc tùy chỉnh */
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Màu sắc tùy chỉnh */
            }



        input::placeholder {
            color: rgba(0, 0, 0, 0.5); /* Màu chữ và mức độ mờ (từ 0 đến 1) */
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
    <br />
    <br />
    <br />
    <div class="form-login">
        <h3 class="text-center">ĐĂNG NHẬP TÀI KHOẢN</h3>
        <p class="text-center">Bạn chưa có tài khoản? <a href="/dang-ky">Đăng ký tại đây</a></p>
        <div class="form-input">
            <label>Tên đăng nhập <span style="color: orangered">*</span></label>
            <input type="email" id="txtTen" runat="server" name="email" value="" placeholder="Tên đăng nhập">
        </div>
        <br />
        <div class="form-input">
            <label>Mật khẩu <span style="color: orangered">*</span></label>
            <input type="password" id="txtPass" runat="server" name="password" value="" placeholder="Password">
        </div>
        <br />
        <a href="#" class="btn btn-primary" runat="server" id="btnLogin" onserverclick="btnLogin_ServerClick">Đăng nhập</a>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

