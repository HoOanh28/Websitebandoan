<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_LienHe.aspx.cs" Inherits="web_module_module_LienHe" %>

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
        <div class="grid"><a href="/">Trang chủ</a> <i class="fa fa-angle-right"></i><a href="lien-he">Liên hệ</a></div>
    </div>
    <div class="page-about">
        <div class="grid">
            <div class="" style="position: relative;">
                <div class="">
                    <h1 class="title-page title-home"><span>Liên hệ</span></h1>
                    <div class="intro"></div>
                    
                    <div class="flex-container flex-space-between">
                    </div>
                    <div class="c20"></div>

                    <div class="c20"></div>
                    
                    <div class="c10"></div>
                    <div class="flex-container flex-space-between">
                        
                        <div class="cell-1-2 tab-cell-1-1" style="padding: 20px; background: #F1F1F1">
                            <div class="frm" style="padding: 0px; margin: 0px;">
                               <div>LIÊN HỆ VỚI CHÚNG TÔI NẾU BẠN CÓ THẮC MẮC <span style="color: #F00"></div> 
                                <div class="c20"></div>
                                <form action="/index4.php?page=contact&amp;lang=" method="post" id="contactform" onsubmit="return check_contact();">
                                    <input type="hidden" name="code" value="save">
                                    <div class="line-title">Họ tên<span>*</span></div>
                                    <div class="line-frm">
                                        <input name="yourname" type="text" class="txt-contact notNull" id="yourname">
                                    </div>

                                    <div class="line-title">Điện thoại<span>*</span></div>
                                    <div class="line-frm">
                                        <input name="phone" type="text" class="txt-contact notNull">
                                    </div>

                                    <div class="line-title">Email</div>
                                    <div class="line-frm">
                                        <input name="email" type="text" class="txt-contact" id="email">
                                    </div>
                                    <div class="line-title">Tiêu đề<span>*</span></div>
                                    <div class="line-frm">
                                        <input name="subject" type="text" class="txt-contact notNull" id="subject">
                                    </div>
                                    <div class="line-title">Thời gian nhận hàng (yêu cầu khác,...)<span>*</span></div>
                                    <div class="line-frm">
                                        <textarea name="other_request" rows="5" style="height: 95px;" class="txt-contact notNull"></textarea>
                                    </div>
                                   
                                    <div class="line-frm" style="float: left;">
                                        <button type="button" class="btn-send" onclick="showSuccessPopup()">Gửi</button>
                                    </div>
                                    <div id="successPopup" style="display: none; position: fixed; top: 30%; left: 50%; transform: translate(-50%, -50%); background: #ffffff; border: 1px solid #ccc; padding: 30px; box-shadow: 0 0 10px rgba(0,0,0,0.5); text-align: center; z-index: 9999; border-radius: 10px;">
                                        <div style="font-size: 50px; color: green;">✔️</div>
                                        <h2>Đã gửi thành công!</h2>
                                        <p>Cảm ơn bạn đã liên hệ với chúng tôi.</p>
                                        <button onclick="closePopup()" style="margin-top: 15px; padding: 8px 16px; background-color: green; color: #fff; border: none; border-radius: 5px;">Đóng</button>
                                    </div>
                                    <div class="msgbox"></div>
                                    <div class="c5"></div>
                                    <script>
                                        function showSuccessPopup() {
                                            // Kiểm tra nếu cần validate thêm thì làm tại đây
                                            document.getElementById('successPopup').style.display = 'block';
                                        }

                                        function closePopup() {
                                            document.getElementById('successPopup').style.display = 'none';
                                        }
                                    </script>
                                </form>
                            </div>
                        </div>

                        <div class="cell-1-2 tab-cell-1-1">
                            <h3 class="hoa">NƠI GIẢI ĐÁP TOÀN BỘ MỌI THẮC MẮC CỦA BẠN?</h3>
                            <p class="p-bottom"><strong>Nét Huế </strong>Là một trang web về đồ ăn, nói lên những đặc sản  tại Huế</p>
                            <ul class="contact-page">
                                <li><i class="fa fa-map-marker" aria-hidden="true"></i> : 459 Tôn Đức Thắng, Hoà Khánh Nam, Liên Chiểu, TP.Đà Nẵng, Vietnam
                            </li>
                                <li><i class="fa fa-envelope" aria-hidden="true">: info@nethue.com.vn</i>
                            </li>
                                <i class="fa fa-phone" aria-hidden="true">:Hotline: 024.3877.5757</i>
                                <li>Giấy chứng nhận đăng ký doanh nghiệp số:0966469789</li>
                            
                        </div>
                    </div>

                    <div class="c30 hide-on-tab hide-on-mobile"></div>
                </div>

            </div>

            <div class="c30"></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

