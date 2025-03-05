<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="module_TinTuc.aspx.cs" Inherits="web_module_module_TinTuc" %>

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
        <div class="grid"><a href="/">Trang chủ</a> <i class="fa fa-angle-right"></i><a href="blog">Blog ẩm thực </a></div>
    </div>
    <div id="page">
        <div class="grid">
            <div class="c10"></div>
            <div class="flex-container">
                <div class="right-page">
                    <h1 class="news-detail-name">Phong Phú Khẩu Vị Riêng Của Người Huế </h1>
                    <h2 class="intro-detail">Nét Văn Hóa Ẩm Thực Của Người Huế</h2>
                    <div class="content-text">
                        Người Huế thích vị ngọt thanh, vị đường vừa phải.
                        <p>Người Huế quen ăn cay, nhưng không phải đơn thuần là thích ăn ớt trái; khẩu vị cay của người Huế có vị cay của trái ớt và vị ớt đã qua các hình thức chế biến, có những vị cay cay, nồng nồng của tiêu, tỏi, gừng, riềng, sả, nghệ…cũng đã qua một vài hình thái chế biến như xay mịn, giã nhỏ, vắt lấy nước…dầm nước muối, nước mắm.</p>

                        <p>Người Huế thích chế biến món ăn để có hương vị lạ hơn một chút, có lúc có vị giòn, có lúc là vị đắng, vị chát, vị bùi…để ăn ngon hơn, dù thức ăn đó là món rất bình thường, dân dã hay là thịt cá, cao lương mỹ vị. Nói chung là người Huế có “tật” chế biến.</p>

                        <p>Người Huế thích những món ăn “thấm tháp”, có vị mặn hơn phía Nam, phía Bắc, nhưng không mặn theo kiểu Bắc Trung Bộ. “Thấm tháp” cũng mặn, nhưng là vị mặn có đường, được kho rim, kho xăm xắp, được hon, hấp, chiên, xào rất thấm.</p>

                        <p>Người Huế thích ăn chè, thích vị ngọt của mứt, bánh, kẹo, nhưng phải ngọt thanh, vị đường vừa phải.</p>

                        <p>Người Huế hay dị ứng với kiểu “chặt to kho mặn”, thức ăn phải nhỏ, để gia vị thấm đều trên các bề mặt; món ăn để nguyên con (gà, vịt, bồ câu hầm…) phải hầm rục, dọn ra cũng nhỏ nhỏ, “thanh tao”, ăn vừa miệng.</p>

                        <p>
                            Khẩu vị của người Huế gần giống khẩu vị chung của miền Trung, nhưng đã qua quá trình điều chỉnh theo kiểu cách của vùng đất kinh kỳ.<br>
                            <br>
                            Tại Nét Huế gần như mỗi món ăn lại kèm theo 1 loại&nbsp;nước chấm khác nhau. Không ngại phức tạp, không ngại mất công,&nbsp;chúng tôi luôn&nbsp;cố gắng mang đầy đủ nhất khẩu vị của của ẩm thực Huế đến với thực khách Hà Thành. Mỗi món ăn mang một hồn riêng, khẩu vị riêng bởi chính sự khác biệt của gia giảm đi kèm. Nó không chỉ là ẩm thực, là kinh nghiệm tích lũy trong khẩu vị ăn uống của người Huế trải qua hàng trăm năm từ thời vua chúa đến hiện tại mà còn là nét văn hóa ẩm thực đáng trân quý là lưu giữ.&nbsp;<br>
                            <br>

                            <img alt="" src="../images/banner/phuhopkhauvi.jpg" style="width: 800px;">
                        </p>
                    </div>
                    <div class="c20"></div>

                    <div class="c20"></div>
                </div>
                <div class="left-page">
                    <ul class="menuleft">


                        <li class="main"><a href="/thuc-don/">Thực đơn</a></li>

                        <ul>


                            <li class=""><a href="/bun-hue/">Bún Huế</a></li>


                            <li class=""><a href="/com-hue/">Cơm Huế</a></li>


                            <li class=""><a href="/chao-hue/">Cháo Huế</a></li>


                            <li class=""><a href="/mon-trang-mieng/">Món tráng miệng</a></li>


                        </ul>


                    </ul>

                    <div class="c20"></div>

                    <div class="box-reg-right">

                        <div style="position: relative; z-index: 1">

                            <div class="title-reg"><span>Đặt bàn</span></div>

                            <div class="c20"></div>

                            <div align="center">Đặt bàn ngay để được thưởng thức ẩm thực Huế</div>

                            <div class="c20"></div>

                            <form class="frm-reg-right" method="post" action="/dat-ban/" id="frmdatban" data-alert="Bạn cần nhập đủ thông tin vào những trường màu đỏ !">

                                <input type="hidden" name="ordersubmit" value="1">

                                <div class="flex-container">

                                    <div class="cell-1-1">
                                        <input placeholder="Họ tên" name="fullname" class="notNull" type="text">
                                    </div>

                                    <div class="cell-1-1">
                                        <input name="email" placeholder="Email" type="text">
                                    </div>

                                    <div class="cell-1-1">
                                        <input name="phone" placeholder="Điện thoại" class="notNull" type="text">
                                    </div>

                                    <div class="cell-1-2">
                                        <input name="gio" id="time" autocomplete="off" placeholder="Giờ ăn" class="notNull" type="text">
                                    </div>

                                    <div class="cell-1-2">
                                        <input name="ngay" id="date" autocomplete="off" placeholder="Ngày ăn" class="notNull" type="text">
                                    </div>

                                    <div class="cell-1-1">
                                        <input name="soluong" placeholder="Số người" class="notNull" type="text">
                                    </div>

                                    <div class="cell-1-1">

                                        <select name="nhahang">

                                            <option value="" style="color: #666">- Chọn nhà hàng -</option>


                                            <option value="Net Hue Vincom Mega Mall Smart City">Net Hue Vincom Mega Mall Smart City</option>


                                            <option value="Net Hue Savico Megamall">Net Hue Savico Megamall</option>


                                            <option value="Net Hue Aeon Mall Hai Phong">Net Hue Aeon Mall Hai Phong</option>


                                            <option value="Net Hue Ocean Park Gia Lam">Net Hue Ocean Park Gia Lam</option>


                                            <option value="Net Hue - Bigc Thang Long">Net Hue - Bigc Thang Long</option>


                                            <option value="Net Hue Vincom Nguyen Chi Thanh">Net Hue Vincom Nguyen Chi Thanh</option>


                                            <option value="Net Hue Hang Bong">Net Hue Hang Bong</option>


                                            <option value="Net Hue Mai Hac De ">Net Hue Mai Hac De </option>


                                            <option value="Net Hue Lang Ha">Net Hue Lang Ha</option>


                                            <option value="Net Hue Royal City">Net Hue Royal City</option>


                                            <option value="Net Hue Tran Duy Hung ">Net Hue Tran Duy Hung </option>


                                            <option value="Net Hue Thai Ha">Net Hue Thai Ha</option>


                                            <option value="Net Hue Lac Trung">Net Hue Lac Trung</option>


                                            <option value="Net Hue Skylake Pham Hung">Net Hue Skylake Pham Hung</option>


                                            <option value="Net Hue Nguyen Van Huyen">Net Hue Nguyen Van Huyen</option>


                                            <option value="Nét Huế Hàng Bông">Nét Huế Hàng Bông</option>


                                            <option value="Net Hue Times City">Net Hue Times City</option>


                                            <option value="Net Hue Aeon Mall Ha Dong">Net Hue Aeon Mall Ha Dong</option>


                                            <option value="Nét Huế Mai Hắc Đế">Nét Huế Mai Hắc Đế</option>


                                            <option value="Nét Huế Lạc Trung">Nét Huế Lạc Trung</option>


                                            <option value="Nét Huế Times city">Nét Huế Times city</option>


                                            <option value="Nét Huế Thái Hà">Nét Huế Thái Hà</option>


                                            <option value="Nét Huế Láng Hạ">Nét Huế Láng Hạ</option>


                                            <option value="Nét Huế - Vincom Nguyễn Chí Thanh">Nét Huế - Vincom Nguyễn Chí Thanh</option>


                                            <option value="Nét Huế Nguyễn Văn Huyên">Nét Huế Nguyễn Văn Huyên</option>


                                            <option value="Nét Huế - BigC Thăng Long">Nét Huế - BigC Thăng Long</option>


                                            <option value="Nét Huế Phạm Hùng">Nét Huế Phạm Hùng</option>


                                            <option value="Nét Huế Royal City">Nét Huế Royal City</option>


                                            <option value="Nét Huế Aeon Mall Hà Đông">Nét Huế Aeon Mall Hà Đông</option>


                                            <option value="Nét Huế Ocean Park Gia Lâm">Nét Huế Ocean Park Gia Lâm</option>


                                            <option value="Nét Huế Aeon Mall Hải Phòng">Nét Huế Aeon Mall Hải Phòng</option>


                                            <option value="Nét Huế - Savico Megamall">Nét Huế - Savico Megamall</option>


                                            <option value="Nét Huế - Vincom Mega Mall Smart City">Nét Huế - Vincom Mega Mall Smart City</option>


                                            <option value="Nét Huế - Aeon Mall - Long Biên">Nét Huế - Aeon Mall - Long Biên</option>




                                        </select>

                                    </div>

                                    <div class="cell-1-1"><a href="#" onclick="$('#frmdatban').submit(); return false" class="btn-send-now">Gửi ngay</a></div>

                                </div>

                            </form>

                        </div>

                        <script>

                            $('#date').datetimepicker({

                                format: 'd/m/Y',

                                formatDate: 'Y/m/d',

                                minDate: '2019/08/30',

                                timepicker: false,



                            });

                            $('#time').datetimepicker({

                                format: 'H:i',

                                step: 5,

                                datepicker: false,

                            });



                        </script>

                    </div>

                    <div class="c20"></div>
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

