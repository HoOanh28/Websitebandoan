<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_ForgotPassword.aspx.cs" Inherits="admin_page_module_access_admin_ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Reset password</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/admin_css/vendor.css" />
    <link href="/admin_css/app.css" rel="stylesheet" />
    <script src="/admin_js/sweetalert.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scReset" runat="server"></asp:ScriptManager>
        <div class="auth">
            <div class="auth-container">
                <div class="card">
                    <header class="auth-header">
                        <h1 class="auth-title text-center">
                            ADMINISTRATOR
                            <%--<img src="/admin_images/logo-hifive.png" title="Quản trị Hifiveplus" alt="Quản trị Hifiveplus" style="height: 40px; display: block; margin: auto;" />--%>
                        </h1>
                    </header>
                    <div class="auth-content">
                        <p class="text-xs-center">PASSWORD RECOVER</p>
                        <p class="text-muted text-xs-center"><small>Enter your username & email to recover your password.</small></p>
                        <div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input id="txtEmail" runat="server" type="email" class="form-control underlined" name="email" placeholder="Your email address" />
                            </div>
                            <div class="form-group">
                                <asp:UpdatePanel ID="udReset" runat="server">
                                    <ContentTemplate>
                                        <input id="btnReset" runat="server" type="submit" class="btn btn-block btn-primary" value="Reset" onserverclick="btnReset_ServerClick" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="form-group clearfix">
                                <a class="pull-right" href="/admin-login">return to Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
