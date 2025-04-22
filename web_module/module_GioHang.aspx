<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_GioHang.aspx.cs" Inherits="web_module_module_GioHang" %>

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
        <div class="grid"><a href="/">Trang chủ</a>  <i class="fa fa-angle-right"></i><a href="gio-hang">Giỏ Hàng </a></div>
    </div>
    <div class="bg-cart">
        <div class="grid">
            <div class="grid" style="width: 100%;">

                <div class="c15"></div>
                <div style="margin-left: 0px;">
                    <div class="cart-title-number">01</div>
                    <div class="cart-title">
                        <h1 class="fl cart-title-name">Giỏ hàng </h1>
                        <div class="c"></div>
                    </div>
                </div>
                <div class="c15"></div>
                <center>
                    <table class="table">
                        <tr>
                            <th>Tên</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Thêm</th>
                            <th>Giảm</th>
                            <th>Xoá</th>
                        </tr>
                        <asp:Repeater runat="server" ID="rpGioHang">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("name") %></td>
                                    <td><%#Eval("number") %></td>
                                    <td><%#Eval("total") %></td>
                                    <td><a href="javascript:void(0)" onclick="_add(<%#Eval("id") %>)"><i class="bi bi-arrow-up-short"></i></a></td>
                                    <td><a href="javascript:void(0)" onclick="_giam(<%#Eval("id") %>)"><i class="bi bi-arrow-down-short"></i></a></td>
                                    <td><a href="javascript:void(0)" onclick="_del(<%#Eval("id") %>)"><i class="bi bi-trash"></i></a></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        <tr>
                            <th colspan="2">Tổng tiền</th>
                            <th colspan="4"><%=total %></th>
                        </tr>
                    </table>
                    
                    <br />
                    <br />
                </center>
            </div>
            <form action="/index4.php?page=cart&amp;lang=" method="post" id="contactform" onsubmit="return check_contact();">
                <input type="hidden" name="code" value="save">
                <div class="step-02">
                    <div class="cart-title-number">02</div>
                    <div class="cart-title">
                        <div class="fl cart-title-name">Xác nhận đặt món </div>
                        <div class="c"></div>
                    </div>
                    <div class="c20"></div>
                    <em>Những trường có dấu * là trường bắt buộc phải nhập thông tin </em>
                    <div class="c10"></div>
                    <div style="max-width: 900px;">
                        <div class="flex-container flex-space-between">
                            <div class="cell-1-3 mobile-cell-1-1">
                                <div class="contact_input">
                                    <input name="yourname" type="text" class="txt-cart notNull" id="yourname" placeholder="Họ tên*">
                                </div>
                            </div>
                            <div class="cell-1-3 mobile-cell-1-1">
                                <div class="contact_input">
                                    <input name="phone" type="text" class="txt-cart notNull" placeholder="Điện thoại*">
                                </div>
                            </div>
                            <div class="cell-1-3 mobile-cell-1-1">
                                <div class="contact_input">
                                    <input name="email" type="text" class="txt-cart" id="email" placeholder="Email *">
                                </div>
                            </div>
                            <div class="cell-2-3 mobile-cell-1-1">
                                <div class="contact_input">
                                    <input name="address" type="text" class="txt-cart notNull" placeholder="Địa chỉ*">
                                </div>
                            </div>
                            <div class="cell-1-3 mobile-cell-1-1">
                                <div class="contact_input">
                                    <select name="nhahang">
                                        <option value="">- Chọn nhà hàng -</option>
                                        <option value="Nét Huế - Aeon Xuân Thủy -Cầu Giấy">Nét Huế Sơn Trà</option>
                                        <option value="Net Hue Vincom Mega Mall Smart City">Nét Huế Hoà Khánh</option>
                                        <option value="Net Hue Savico Megamall">Nét Huế Hải Châu</option>
                                       
                                    </select>
                                </div>
                            </div>
                            <%--<div class="contact_input">
                                <textarea name="other_request" rows="5" placeholder="Thời gian nhận hàng (yêu cầu khác,...)" style="height: 60px;" class="txt-cart"></textarea>
                            </div>--%>
  
                            <div class="c10"></div>

                            <div class="c10"></div>
                            <div class="c5"></div>
                           

                        </div>
                        <div class="flex-container">
                            <div class="cell-1-2">
                                <input name="input" type="button" onclick="javascript:history.back();" class="btn-send-continue" value="Tiếp tục đặt món"></div>
                            <div class="cell-1-2" style="text-align: right">
                                <div <%=none %>>
                        <a href="javascript:void(0)" id="btnSave" class="btn btn-primary" runat="server" onserverclick="btnSave_ServerClick">Đặt hàng</a>
                    </div>
                    <br />
                        </div>
                    </div>
                    <div class="c10"></div>
                    <div class="c10"></div>
                    <div class="msgbox">
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div style="display: none">
        <input type="text" id="txtId" runat="server" name="name" value="" />

        <asp:LinkButton ID="btnAdd" runat="server" OnClick="btnAdd_ServerClick" CssClass="hidden"></asp:LinkButton>
        <asp:LinkButton ID="btnGiam" runat="server" OnClick="btnGiam_ServerClick" CssClass="hidden"></asp:LinkButton>
        <asp:LinkButton ID="btnDel" runat="server" OnClick="btnDel_ServerClick" CssClass="hidden"></asp:LinkButton>
    </div>
    <script>
        function _add(id) {
            document.getElementById("<%=txtId.ClientID%>").value = id;
            document.getElementById("<%=btnAdd.ClientID%>").click();
        }
        function _giam(id) {
            document.getElementById("<%=txtId.ClientID%>").value = id;
            document.getElementById("<%=btnGiam.ClientID%>").click();
        }
        function _del(id) {
            document.getElementById("<%=txtId.ClientID%>").value = id;
            document.getElementById("<%=btnDel.ClientID%>").click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

