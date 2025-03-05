<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_Menu.aspx.cs" Inherits="web_module_module_Menu" %>

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
        <div class="grid"><a href="/">Trang chủ</a> <i class="fa fa-angle-right"></i><a href="/thuc-don/">Thực đơn</a></div>
    </div>
    <div class="page-menu">
        <div class="grid">
            <div class="c20"></div>
            <div class="c20"></div>
            <div>

                <h1 class="title-home title-page"><a>Thực đơn</a></h1>
                <div class="c10"></div>
                <div>
                    <div style="text-align: center">
                        Hãy cũng khám phá thực đơn tại nhà hàng Nét Huế để được thưởng thức trọn hương vị ẩm thực<br>
                        <br>
                        <span style="color: #d5a34c"><span style="font-size: 18px">
                            <strong>Huế Tinh hoa ẩm thực Huế</strong></span></span>
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
                                <img src="../images/Thuc_don/khoai-tia-6-vien.jpg" alt="Khoai Tía Phomai - set lớn ( 6 viên )" width="100%"></a>
                        </div>
                        <div class="product-name-home"><a href="#">Khoai Tía Phomai - set lớn ( 6 viên )</a></div>
                        <div class="product-price-home">75,000 đ</div>
                        <div class="c10"></div>
                        <div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>
                        <div class="c10"></div>
                    </div>
                    <div class="cell-1-4 mobile-cell-1-2 tab-cell-1-3 b-pro margin-bottom-40">
                        <div>
                            <a href="#">
                                <img src="../images/Thuc_don/khoai-tia--vien.jpg" alt="Khoai Tía Phomai - set nhỏ ( 4 viên)" width="100%"></a>
                        </div>
                        <div class="product-name-home"><a href="/mon-an-choi/khoai-tia-phomai-set-nho-4-vien.html">Khoai Tía Phomai - set nhỏ ( 4 viên)</a></div>
                        <div class="product-price-home">56,000 đ</div>
                        <div class="c10"></div>
                        <div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>
                        <div class="c10"></div>
                    </div>
                    <div class="cell-1-4 mobile-cell-1-2 tab-cell-1-3 b-pro margin-bottom-40">
                        <div>
                            <a href="#">
                                <img src="../images/Thuc_don/nem-chua-pho-mai-6v.jpg" alt="Nem Chua Phomai - set lớn ( 6 viên )" width="100%"></a>
                        </div>
                        <div class="product-name-home"><a href="#">Nem Chua Phomai - set lớn ( 6 viên )</a></div>
                        <div class="product-price-home">75,000 đ</div>
                        <div class="c10"></div>
                        <div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>
                        <div class="c10"></div>
                    </div>
                    <div class="cell-1-4 mobile-cell-1-2 tab-cell-1-3 b-pro margin-bottom-40">
                        <div>
                            <a href="#">
                                <img src="../images/Thuc_don/nem-chua-pho-mai-4v.jpg" alt="Nem Chua Phomai - set nhỏ (4 viên )" width="100%"></a>
                        </div>
                        <div class="product-name-home"><a href="/thuc-don/nem-chua-phomai-set-nho-4-vien-.html">Nem Chua Phomai - set nhỏ (4 viên )</a></div>
                        <div class="product-price-home">56,000 đ</div>
                        <div class="c10"></div>
                        <div align="center"><a class="btn-order-c" href="#"><i class="fa fa-shopping-cart"></i>Đặt món</a></div>
                        <div class="c10"></div>
                    </div>--%>
                </div>
                
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

