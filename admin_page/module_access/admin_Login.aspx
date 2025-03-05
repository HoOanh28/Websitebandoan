<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_Login.aspx.cs" Inherits="admin_page_module_access_admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <link rel="stylesheet" href="/admin_css/vendor.css" />
    <link href="/admin_css/app.css" rel="stylesheet" />
    <script src="/admin_js/sweetalert.min.js"></script>
    <style type="text/css">
        body {
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-image: url(/admin_images/Sky-Moon-Background.jpg);
            font-family: Open Sans,Arial,sans-serif;
            background-color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scLogin" runat="server"></asp:ScriptManager>
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
                        <p class="text-xs-center">LOGIN TO CONTINUE</p>
                        <div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input id="txtUser" runat="server" type="text" class="form-control underlined" name="username" placeholder="Username" />
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input id="txtPassword" runat="server" type="password" class="form-control underlined" name="password" placeholder="Your password" />
                            </div>
                            <div class="form-group">
                                <label for="remember">
                                    <input class="checkbox" id="remember" runat="server" type="checkbox" checked="checked" />
                                    <span>Remember me</span>
                                </label>
                                <a href="/admin-reset" class="forgot-btn pull-right">Forgot password?</a>
                            </div>
                            <div class="form-group">
                                <asp:UpdatePanel ID="udLogin" runat="server">
                                    <ContentTemplate>
                                        <input id="btnLogin" runat="server" type="submit" class="btn btn-block btn-primary" onserverclick="btnLogin_ServerClick" value="Login" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>
        <script src="/admin_js/vendor.js"></script>
        <script src="/admin_js/app.js"></script>
    </form>
</body>
</html>
