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
                <div class="c30"></div>
                <center>
                    <table class="table">
                        <tr>
                            <th>Hình ảnh</th>
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
                                    <td>
                                        <img src='<%# Eval("image") %>' alt="Ảnh món" style="width:40px; height:40px; object-fit:cover;" />
                                    </td>
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
                      <div class="c30"></div>
                    <div <%=none %>>
                        <a href="javascript:void(0)" id="btnSave" class="btn btn-primary" runat="server" onserverclick="btnSave_ServerClick">Thanh toán</a>
                    </div>
                    <br />
            </div>
        </div>
        <div class="c10"></div>
        <div class="c10"></div>
        <div class="msgbox">
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
        
             function addToCart(itemId, itemName, itemPrice) {
                 let cart = JSON.parse(localStorage.getItem("cart")) || [];

                    // Kiểm tra xem món đã có trong giỏ chưa
                    let item = cart.find(i => i.id === itemId);

             if (item) {
                 item.quantity++; // Tăng số lượng nếu đã có
                    } else {
                 cart.push({ id: itemId, name: itemName, price: itemPrice, quantity: 1 });
                    }

             localStorage.setItem("cart", JSON.stringify(cart));
             updateCartUI();
                }
     </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

