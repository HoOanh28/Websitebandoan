<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="vnpay_return.aspx.cs" Inherits="web_module_module_ThanhToan" %>

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
        <div class="grid"><a href="/">Trang chủ</a> <i class="fa fa-angle-right"></i> <a href="/gio-hang">Giỏ hàng</a> <i class="fa fa-angle-right"></i> <a href="/thanh-toan">Thanh toán</a> <i class="fa fa-angle-right"></i> <a href="javascript:void(0)">Kết quả thanh toán</a></div>
    </div>
    <div class="grid">
        <h1 class="title-page title-home"><a>Kết quả thanh toán VNPAY</a></h1>
        <div class="c10"></div>
        <div class="payment-result">
            <div class="result-box">
                <div class="result-icon">
                    <i class="fa fa-check-circle" id="iconSuccess" runat="server" visible="false"></i>
                    <i class="fa fa-times-circle" id="iconFailed" runat="server" visible="false"></i>
                </div>
                <h2 class="result-title" id="resultTitle" runat="server"></h2>
                <p class="result-message" id="resultMessage" runat="server"></p>
                
                <div class="payment-details">
                    <div class="detail-item">
                        <span class="detail-label">Mã đơn hàng:</span>
                        <span class="detail-value" id="orderCode" runat="server"></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Số tiền:</span>
                        <span class="detail-value" id="amount" runat="server"></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Ngân hàng:</span>
                        <span class="detail-value" id="bankCode" runat="server"></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Mã giao dịch VNPAY:</span>
                        <span class="detail-value" id="transactionId" runat="server"></span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Thời gian:</span>
                        <span class="detail-value" id="paymentTime" runat="server"></span>
                    </div>
                </div>
                
                <div class="actions">
                    <a href="/trang-chu" class="btn-primary">Về trang chủ</a>
                </div>
            </div>
        </div>
        <div class="c30"></div>
    </div>
    <style>
        .payment-result {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 0;
        }
        
        .result-box {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 30px;
            width: 100%;
            max-width: 600px;
            text-align: center;
        }
        
        .result-icon {
            font-size: 64px;
            margin-bottom: 20px;
        }
        
        .result-icon .fa-check-circle {
            color: #28a745;
        }
        
        .result-icon .fa-times-circle {
            color: #dc3545;
        }
        
        .result-title {
            font-size: 24px;
            margin-bottom: 15px;
            color: #333;
        }
        
        .result-message {
            font-size: 16px;
            color: #666;
            margin-bottom: 25px;
        }
        
        .payment-details {
            margin: 25px 0;
            text-align: left;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
            padding: 20px 0;
        }
        
        .detail-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .detail-label {
            font-weight: bold;
            color: #555;
        }
        
        .detail-value {
            color: #333;
        }
        
        .actions {
            margin-top: 25px;
        }
        
        .btn-primary {
            display: inline-block;
            background-color: #d5a34c;
            color: #fff;
            padding: 12px 30px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        
        .btn-primary:hover {
            background-color: #c19040;
        }
    </style>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

