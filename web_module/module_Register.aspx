<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_Register.aspx.cs" Inherits="web_module_module_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <style>
        .form-input {
            display: flex;
            justify-content: space-between;
        }

        @media only screen and (max-width: 600px) {
            .form-login{
                margin:0px 30px;
            }
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
    <center class="form-login">
        <h3>ĐĂNG KÝ TÀI KHOẢN</h3>
        <p>Bạn đã có tài khoản? <a href="/login">Đăng nhập tại đây</a></p>
        <br />
        <br />
        <h5>THÔNG TIN CÁ NHÂN</h5>
        <div class="d-grid col-xl-3 col-md-5 col-lg-4 col-xs-12">
            <div class="form-input">
                <label>Họ và tên <span style="color: orangered">*</span></label>
                <input type="text" id="txtTen" runat="server" class="input" name="email" value="" placeholder="Họ và tên">
            </div>
            <br />
            <div class="form-input">
                <label>Email <span style="color: orangered">*</span></label>
                <input type="text" id="txtEmail" runat="server" class="input" name="email" value="" placeholder="Email">
            </div>
            <br />
            <div class="form-input">
                <label>Địa chỉ <span style="color: orangered">*</span></label>
                <input type="text" id="txtAddress" runat="server" class="input" name="email" value="" placeholder="Địa chỉ">
            </div>
            <br />
            <div class="form-input">
                <label>Số điện thoại <span style="color: orangered">*</span></label>
                <input type="text" id="txtPhone" runat="server" name="phone" value="" placeholder="Số điện thoại">
            </div>
            <br />
            <div class="form-input">
                <label>Tên đăng nhập <span style="color: orangered">*</span></label>
                <input type="text" id="txtUsername" runat="server" name="user_name" value="" placeholder="Tên đăng nhập">
            </div>
            <br />
            <div class="form-input">
                <label>Mật khẩu <span style="color: orangered">*</span></label>
                <input type="password" id="txtPass" runat="server" name="password" value="" placeholder="Mật khẩu">
            </div>
            <br />
            <div class="form-input">
                <label>Nhập lại mật khẩu <span style="color: orangered">*</span></label>
                <input type="password" id="txtCfPass" runat="server" name="password" value="" placeholder="Nhập lại mật khẩu">
            </div>
            <br />
        </div>
        <a href="#" class="btn btn-primary" id="btnRegister" runat="server" onserverclick="btnRegister_ServerClick" >Đăng ký</a>

        <br />
        <br />
        <br />
        <br />
    </center>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

