<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_BunHue.aspx.cs" Inherits="web_module_module_BunHue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
    <div class="crumb">
        <div class="grid"><a href="/">Trang chủ</a> <i class="fa fa-angle-right"></i><a href="/thuc-don/">Thực đơn</a>&nbsp;<i class="fa fa-angle-right"></i>&nbsp;<a href="/bun-hue/">Bún Huế</a></div>
    </div>
    <div class="grid">
        <div class="c20"></div>
        <div class="c20"></div>
        <div>
            <h1 class="title-home title-page"><a><%=title %></a></h1>
            <div class="c10"></div>
            <div>
                <div style="text-align: center">
                    <span style="font-size: 14px"><%=des %>&nbsp;</span><br>
                    &nbsp;
                </div>
            </div>
            <div class="c20"></div>
            <div class="flex-container ">
                <asp:Repeater runat="server" ID="rpMon">
                    <ItemTemplate>
                        <div class="cell-1-4 mobile-cell-1-2 tab-cell-1-3 b-pro margin-bottom-40">
                            <div>
                                <a href="mon-<%#Eval("link") %>">
                                    <img src="<%#Eval("pr_image") %>" alt="<%#Eval("pr_name") %>" width="100%"></a>
                            </div>
                            <div class="product-name-home"><a href="#"><%#Eval("pr_name") %></a></div>
                            <div class="product-price-home"><%#Eval("pr_price") %> đ</div>
                            <div class="c10"></div>
                            <%--<div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>--%>
                            <div class="c10"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <%--<div class="cell-1-4 mobile-cell-1-2 tab-cell-1-3 b-pro margin-bottom-40">
                    <div>
                        <a href="#">
                            <img src="../images/bun/bun-bp-hue-so1.png" alt="Bún bò Huế số 1" width="100%"></a>
                    </div>
                    <div class="product-name-home"><a href="#">Bún bò Huế số 1</a></div>
                    <div class="product-price-home">45,000 đ</div>
                    <div class="c10"></div>
                    <div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>
                    <div class="c10"></div>
                </div>
                <div class="cell-1-4 mobile-cell-1-2 tab-cell-1-3 b-pro margin-bottom-40">
                    <div>
                        <a href="#">
                            <img src="../images/bun/bun-bo-hue-s2.jpg" alt="Bún bò Huế số 2" width="100%"></a>
                    </div>
                    <div class="product-name-home"><a href="#">Bún bò Huế số 2</a></div>
                    <div class="product-price-home">54,000 đ</div>
                    <div class="c10"></div>
                    <div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>
                    <div class="c10"></div>
                </div>
                <div class="cell-1-4 mobile-cell-1-2 tab-cell-1-3 b-pro margin-bottom-40">
                    <div>
                        <a href="#">
                            <img src="../images/bun/bun-bo-hue-s3.jpg" alt="Bún bò Huế số 3" width="100%"></a>
                    </div>
                    <div class="product-name-home"><a href="#l">Bún bò Huế số 3</a></div>
                    <div class="product-price-home">63,000 đ</div>
                    <div class="c10"></div>
                    <div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>
                    <div class="c10"></div>
                </div>
                <div class="cell-1-4 mobile-cell-1-2 tab-cell-1-3 b-pro margin-bottom-40">
                    <div>
                        <a href="#">
                            <img src="../images/bun/bun-bo-hue-s4.jpg" alt="Bún bò Huế số 4" width="100%"></a>
                    </div>
                    <div class="product-name-home"><a href="#">Bún bò Huế số 4</a></div>
                    <div class="product-price-home">65,000 đ</div>
                    <div class="c10"></div>
                    <div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>
                    <div class="c10"></div>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

