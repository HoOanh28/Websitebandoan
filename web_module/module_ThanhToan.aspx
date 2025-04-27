<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_ThanhToan.aspx.cs" Inherits="web_module_module_ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder5" runat="Server">
    <style>
        .box-form-thanhtoan {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .form-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .item {
            margin-bottom: 15px;
        }

            .item label {
                display: block;
                margin-bottom: 5px;
                font-weight: 500;
            }

            .item input[type="text"],
            .item input[type="email"],
            .item textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
            }

            .item textarea {
                height: 80px;
                resize: vertical;
            }

        .required {
            color: red;
        }

        .order-table {
            width: 100%;
            border-collapse: collapse;
        }

            .order-table th,
            .order-table td {
                padding: 10px;
                border-bottom: 1px solid #eee;
                text-align: left;
            }

        .total-row {
            background-color: #f9f9f9;
        }

        .payment-methods {
            margin-top: 20px;
        }

        .payment-option {
            margin-bottom: 10px;
        }

            .payment-option label {
                margin-left: 5px;
                cursor: pointer;
            }

        .banking-info {
            background-color: #f9f9f9;
            padding: 15px;
            margin-top: 10px;
            border-radius: 4px;
        }

            .banking-info p {
                margin: 5px 0;
            }

        .btn-thanhtoan {
            display: block;
            width: 100%;
            text-align: center;
            background-color: #d5a34c;
            color: #fff;
            padding: 12px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
            text-transform: uppercase;
            transition: background-color 0.3s;
        }

            .btn-thanhtoan:hover {
                background-color: #c19040;
            }

        @media (max-width: 768px) {
            .flex-container {
                flex-direction: column;
            }

            .cell-1-2 {
                width: 100%;
                margin-bottom: 20px;
            }
        }
    </style>
    <div class="crumb">
        <div class="grid"><a href="/">Trang chủ</a> <i class="fa fa-angle-right"></i><a href="/gio-hang">Giỏ hàng</a> <i class="fa fa-angle-right"></i><a href="/thanh-toan">Thanh toán</a></div>
    </div>
    <div class="grid">
        <h1 class="title-page title-home"><a>Thanh Toán</a></h1>
        <div class="c10"></div>
        <div style="text-align: center">
            Vui lòng điền đầy đủ thông tin để hoàn tất quá trình đặt hàng<br>
            Liên hệ với chúng tôi<br>
            <span style="color: #d5a34c"><strong><span style="font-size: 24px">0366809335</span></strong></span>
        </div>
        <div class="c30"></div>
        <div class="flex-container">
            <div class="cell-1-2 mobile-cell-1-1 tab-cell-1-1">
                <div class="box-form-thanhtoan">
                    <div class="form-title">Thông tin thanh toán</div>
                    <div class="flex-container">
                        <div class="cell-1-1">
                            <div class="item">
                                <label>Họ tên <span class="required">*</span></label>
                                <input name="fullname" runat="server" id="txtName" class="notNull" placeholder="Họ tên" type="text">
                            </div>
                        </div>
                        <div class="cell-1-1">
                            <div class="item">
                                <label>Số điện thoại <span class="required">*</span></label>
                                <input name="phone" runat="server" id="txtPhone" class="notNull" type="text" placeholder="Số điện thoại">
                            </div>
                        </div>
                        <div class="cell-1-1">
                            <div class="item">
                                <label>Email</label>
                                <input name="email" runat="server" id="txtEmail" type="email" placeholder="Email">
                            </div>
                        </div>
                        <div class="cell-1-1">
                            <div class="item">
                                <label>Địa chỉ <span class="required">*</span></label>
                                <textarea name="address" runat="server" id="txtAddress" class="notNull" placeholder="Địa chỉ nhận hàng"></textarea>
                            </div>
                        </div>
                        <div class="cell-1-1">
                            <div class="item">
                                <label>Ghi chú</label>
                                <textarea name="note" runat="server" id="txtNote" placeholder="Ghi chú"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="cell-1-2 mobile-cell-1-1 tab-cell-1-1">
                <div class="box-form-thanhtoan">
                    <div class="form-title">Đơn hàng của bạn</div>
                    <div class="order-summary">
                        <table class="order-table">
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                            </tr>
                            <asp:Repeater runat="server" ID="rpGioHang">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("name") %></td>
                                        <td><%#Eval("number") %></td>
                                        <td><%#Eval("total") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr class="total-row">
                                <td colspan="2"><strong>Tổng tiền</strong></td>
                                <td><strong><%=total %></strong></td>
                            </tr>
                        </table>
                    </div>
                    <div class="payment-methods">
                        <div class="form-title">Phương thức thanh toán</div>
                        <div class="payment-options">
                            <div class="payment-option">
                                <input type="radio" id="cod" name="payment_method" value="cod" runat="server" checked />
                                <label for="cod">Thanh toán khi nhận hàng (COD)</label>
                            </div>
                            <div class="payment-option">
                                <input
                                    type="radio"
                                    id="vnpay"
                                    name="payment_method"
                                    runat="server"
                                    value="vnpay" />
                                <label for="vnpay">Thanh toán qua VNPAY</label>

                            </div>

                        </div>
                    </div>
                    <div class="c20"></div>
                    <div class="cell-1-1">
                        <a href="javascript:void(0)" id="btnThanhToan" runat="server" onserverclick="btnThanhToan_ServerClick" class="btn-thanhtoan">Đặt hàng</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="c30"></div>
    </div>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            const codRadio = document.getElementById('<%= cod.ClientID %>');
            const bankingRadio = document.getElementById('<%= vnpay.ClientID %>');
            const bankingInfo = document.getElementById('bankingInfo');

            function updateBankingInfo() {
                if (bankingRadio.checked) {
                    bankingInfo.style.display = 'block';
                } else {
                    bankingInfo.style.display = 'none';
                }
            }

            codRadio.addEventListener('change', updateBankingInfo);
            bankingRadio.addEventListener('change', updateBankingInfo);

            // Initial check
            updateBankingInfo();
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

