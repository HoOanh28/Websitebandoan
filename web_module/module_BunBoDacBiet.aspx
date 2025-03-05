<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_BunBoDacBiet.aspx.cs" Inherits="web_module_module_BunBoChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media only screen and (min-width: 1000px) {
            .block {
                width: 50%;
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
    <div class="crumb">
        <div class="grid"><a href="/">Trang chủ</a> <i class="fa fa-angle-right"></i><a href="/thuc-don/">Thực đơn</a>&nbsp;<i class="fa fa-angle-right"></i>&nbsp;<a href="/nhom-<%=_Link %>"><%=_Name %></a></div>
    </div>
    <div style="background: #FFF;" class="container">
        <div class="row">
            <div class="box-bg-product col-xs-7 col-xl-7">
                <div class="flex-container">
                    <asp:Repeater runat="server" ID="rpChiTiet">
                        <ItemTemplate>
                            <div class="cell-3-5 mobile-cell-1-1 tab-cell-1-1">
                                <img src="<%#Eval("pr_image") %>" class="img-fluid">
                            </div>
                            <div class="cell-2-5 mobile-cell-1-1 tab-cell-1-1 ">
                                <h1 class="product-detail-name"><%#Eval("pr_name") %></h1>
                                <div class="c30"></div>
                                <div>
                                    <div style="text-align: justify"><%#Eval("pr_content") %></div>
                                </div>
                                <div class="c20"></div>
                                <div class="price-detail">Giá: <%#Eval("pr_price") %>₫</div>
                                <div class="c20"></div>
                                <a href="javascript:void(0)" class="btn-order-detail" onclick="addCart(<%#Eval("pr_id") %>)">Đặt món ngay</a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <%--<div class="cell-3-5 mobile-cell-1-1 tab-cell-1-1">
                        <img src="../images/bun/bun-bo-hue-dac-biet.jpg" width="100%">
                    </div>
                    <div class="cell-2-5 mobile-cell-1-1 tab-cell-1-1 ">
                        <h1 class="product-detail-name">Bún bò Huế đặc biệt</h1>
                        <div class="c30"></div>
                        <div>
                            <div style="text-align: justify">Nguyên liệu và thành phần: thịt bò, bò viên, móng giò, chả cua, gân bò tiết, bún sợi to, nước hầm xương, mắm ruốc.</div>
                        </div>
                        <div class="c20"></div>
                        <div class="price-detail">Giá: 84,000₫</div>
                        <div class="c20"></div>
                        <a href="/addcart/bun-bo-hue-dac-biet.html" class="btn-order-detail"><i class="fa fa-shopping-cart"></i>Đặt món ngay</a>
                    </div>--%>
                </div>
            </div>
            <div class="content-text col-xs-5 col-xl-5">
                <h2 class="title-product-info">Thông tin món ăn</h2>
                <div>
                    <div style="text-align: justify">
                        <%=_Info %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <div style="display: none">
            <input type="text" id="txtId" runat="server" name="name" value="" />
            <a href="#" id="btnAdd" runat="server" onserverclick="btnAdd_ServerClick">content</a>
        </div>
    <script>
        function addCart(id) {
            document.getElementById("<%=txtId.ClientID%>").value = id;
            document.getElementById("<%=btnAdd.ClientID%>").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

