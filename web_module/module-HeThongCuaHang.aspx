<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module-HeThongCuaHang.aspx.cs" Inherits="web_module_module_HeThongCuaHang" %>

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
        <div class="grid"><a href="/">Trang chủ</a> <i class="fa fa-angle-right"></i><a href="/he-thong-cua-hang/">Hệ thống cửa hàng</a></div>
    </div>
    <div class="box-ht-cuahang ">
        <div class="grid">
            <div class="flex-container flex-center" style="">

                <div class="cell-list-map mobile-cell-1-1 tab-cell-1-1" style="background: #FFF">
                    <div class="title-list-map">
                        <div class="flex-container">
                            <div class="title-map-text">Hệ thống nhà hàng</div>
                          
                        </div>
                    </div>
                    <div class="box-list-map">
                        <div class="item-map active" data-id="16">
                            <div class="name">Nét Huế Hàng Bông</div>
                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tbody>
                                    <tr>
                                        <td width="15px"><i class="fa fa-map-marker" aria-hidden="true"></i></td>
                                        <td>Nét Huế 198 Hàng Bông, Q. Hoàn Kiếm, Hà Nội</td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-phone" aria-hidden="true"></i></td>
                                        <td>Hotline: 024.3938.1795</td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-envelope" aria-hidden="true"></i></td>
                                        <td>info@nethue.com.vn</td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <div class="item-map" data-id="25">
                            <div class="name">Nét Huế Lạc Trung</div>
                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tbody>
                                    <tr>
                                        <td width="15px"><i class="fa fa-map-marker" aria-hidden="true"></i></td>
                                        <td>Nét Huế 57 Lạc Trung - Q. Hai Bà Trưng - Hà Nội</td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-phone" aria-hidden="true"></i></td>
                                        <td>Hotline: 024.3877.5757</td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-envelope" aria-hidden="true"></i></td>
                                        <td>info@nethue.com.vn</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="item-map" data-id="26">
                            <div class="name">Nét Huế Times city</div>
                            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tbody>
                                    <tr>
                                        <td width="15px"><i class="fa fa-map-marker" aria-hidden="true"></i></td>
                                        <td>Nét Huế 10 Nguyễn Tri Phương - Q.Thanh Khê - Đà Nẵng</td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-phone" aria-hidden="true"></i></td>
                                        <td>Hotline: 024.3877.5757</td>
                                    </tr>
                                    <tr>
                                        <td><i class="fa fa-envelope" aria-hidden="true"></i></td>
                                        <td>info@nethue.com.vn</td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>

                    </div>
                </div>
            </div>
            <script>
                $(function () {
                    $('.box-list-map .item-map:first').addClass('active');
                    /*$( "#loadmap" ).html('<div class="loading">Đang tải...</div>');
                    $( "#loadmap" ).load( "/index4.php?page=dailymap&id=" + $('.box-list-map .item-map:first').data('id'), function( response, status, xhr ) {
                      if ( status == "error" ) {}
                    });*/

                    $('.item-map').click(function () {
                        $('.box-list-map .item-map').removeClass('active');
                        $(this).addClass('active');
                        /*$( "#loadmap" ).html('<div class="loading">Đang tải...</div>');
                        $( "#loadmap" ).load( "/index4.php?page=dailymap&id=" + $(this).data('id'), function( response, status, xhr ) {
                          if ( status == "error" ) { }
                        });*/
                        return false;
                    })
                })
            </script>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder6" runat="Server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder7" runat="Server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder8" runat="Server">
</asp:Content>

