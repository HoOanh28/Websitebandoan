<%@ Page Title="" Language="C#" MasterPageFile="~/Web_MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css" />
    <style>
        #carouselExampleInterval img {
            max-width: 86%;
            max-height: 100%;
            width: auto;
            height: auto;
            margin: auto;
        }

        a:hover {
            color: #d5a34c;
        }

        .flex-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .cell-1-5 {
            width: 20%;
            box-sizing: border-box;
            padding: 10px;
        }

        @media (max-width: 768px) {
            .tab-cell-1-2 {
                width: 50% !important;
            }
        }

        @media (max-width: 480px) {
            .mobile-cell-1-2 {
                width: 50% !important;
            }
        }

        /* Styling for out-of-stock products */
        .product-out-of-stock {
            opacity: 0.5;
            filter: grayscale(50%);
            pointer-events: none;
            position: relative;
        }

            .product-out-of-stock::after {
                content: "Hết hàng";
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: rgba(0, 0, 0, 0.7);
                color: white;
                padding: 5px 10px;
                border-radius: 5px;
                font-weight: bold;
                z-index: 1;
            }

            .product-out-of-stock .btn-order-c {
                background-color: #ccc;
                cursor: not-allowed;
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
    <div id="page " class="site-content">
        <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active" data-bs-interval="3000">
                    <img src="images/banner/chao%20hue.jpg" class="d-block w-100 h-50" alt="...">
                </div>
                <div class="carousel-item" data-bs-interval="4000">
                    <img src="images/banner/com%20hue.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item " data-bs-interval="5000">
                    <img src="images/banner/bun%20hue.jpg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item " data-bs-interval="5000">
                    <img src="images/banner/banh%20hue.jpg" class="d-block w-100" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
       <div class="grid grid-box-menu-home" style="">
	<div class="box-menu-home">
    	<div align="center" class="hide-on-mobile hide-on-pad hide-on-tab">Hãy cũng khám phá thực đơn tại nhà hàng Nét Huế để được thưởng thức trọn hương vị ẩm thực Huế</div>
		<div class="c20 hide-on-mobile hide-on-tab hide-on-pad"></div>
    	<div class="swiper-container swiper-container-initialized swiper-container-horizontal" id="menuhome">
    		<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-1177.2px, 0px, 0px);"><div class="swiper-slide swiper-slide-duplicate" style="text-align: center; width: 166.2px; margin-right: 30px;" data-swiper-slide-index="6"> 
                	<div style="max-width:115px; margin:0 auto">
	                	<div class="image-menu-home"><a href="/goi-rau/">
                            <img src="uploadimages/20122023_042801_CH_-uploaded-san%20pham_banh%20ram_cr_521x521.jpg"  width="100%" alt="Gỏi rau"></a></div>
                    </div>
                    <div class="c40"></div>
                    <div class="menu-name"><a href="/goi-rau/">Gỏi rau</a></div>
                </div><div class="swiper-slide swiper-slide-duplicate" style="text-align: center; width: 166.2px; margin-right: 30px;" data-swiper-slide-index="7"> 
                	<div style="max-width:115px; margin:0 auto">
	                	<div class="image-menu-home"><a href="/mon-an-choi/"><img src="/temp/-uploaded-san pham_IMG_6605_cr_200x200.jpg" width="100%" alt="Món ăn chơi"></a></div>
                    </div>
                    <div class="c10"></div>
                    <div class="menu-name"><a href="/mon-an-choi/">Món ăn chơi</a></div>
                </div><div class="swiper-slide swiper-slide-duplicate" style="text-align: center; width: 166.2px; margin-right: 30px;" data-swiper-slide-index="8"> 
                	<div style="max-width:115px; margin:0 auto">
	                	<div class="image-menu-home"><a href="/lau/">
                            <img src="uploadimages/20122023_042910_CH_-uploaded-_thumbs-Hue%20cake_nam%20cake_cr_521x521.png" /></a></div>
                    </div>
                   </div>
                </div>
            </div>
        </div>
     </div>

    
                    
        <script>
            $(function () {
                var swiper_slide_home = new Swiper('#menuhome', {
                    loop: true,
                    slidesPerView: 5,
                    autoplay: {
                        delay: 4500,
                    },

                    speed: 1000,
                    spaceBetween: 30,
                    navigation: {
                        nextEl: '.homeslide-next',
                        prevEl: '.homeslide-prev',
                    },
                    breakpoints: {
                        640: {
                            slidesPerView: 4,
                            spaceBetween: 30
                        },
                        767: {
                            slidesPerView: 4,
                            spaceBetween: 20
                        },
                    }

                });
            });
        </script>     
        <div class="grid">
            <div class="c40 hide-on-mobile hide-on-pad hide-on-tab"></div>
            <h2 class="title-home"><a href="#">Món ăn nổi bật</a></h2>
            <div class="c10"></div>
            <div></div>
            <div class="c20"></div>
            <div id="loadproducthome" style="position: relative">
                <div class="row">
                    <asp:Repeater runat="server" ID="rpMenu">
                        <ItemTemplate>
                            <div class="col b-pro tab-cell-1-2 mobile-cell-1-2 margin-bottom-20 <%# Convert.ToString(Eval("pr_status")) == "Hết" ? "product-out-of-stock" : "" %>">
                                <div>
                                    <a href="/mon-<%#Eval("link") %>">
                                        <img src="<%#Eval("pr_image") %>" width="100%" alt="<%#Eval("pr_name") %>" />
                                    </a>
                                </div>
                                <div class="product-name-home"><%#Eval("pr_name") %></div>
                                <div class="product-price-home"><%#Eval("pr_price") %></div>
                                <div class="c10"></div>
                                <div align="center"><a class="btn-order-c" href="javascript:void(0)" onclick="addCart(<%#Eval("pr_id") %>)">Đặt món</a></div>
                                <div class="c10"></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div class="c40"></div>
        </div>
        <div class="box-about-home">
            <div class="c40"></div>
            <div class="c30"></div>
            <div class="grid">
                <div class="box-text">
                    <h1 class="title-about-home">Nét Huế</h1>
                    <div>
                        Ai qua Huế một lần thôi, Mang đi từ Huế ngọt lời nhớ thương. Xứ Huế nồng nàn với sông Hương, núi Ngự, dịu dàng đằm thắm với con người nơi đây. Không thể quên, xứ Huế níu kéo nỗi nhớ người đi bằng hương vị món ăn thuần khiết đậm đà. Không biết có phải ông trời cho Huế một thiên nhiên có phần khắc nghiệt: mưa thì mưa mê mải, nắng thì nắng chói chang hay không mà ẩm thực nơi đây luông mang đầy đủ phong vị chua, cay, mặn, ngọt, đắng, thơm, bùi, dẻo...Người lữ khách một lần đến Cố Đô, sao quên được vị Huế hài hòa mà đậm chất, đồ ăn Huế cầu kỳ mà thanh khiết, đẹp mắt mà giản dị thường ngày<br>
                        &nbsp;
                   
                        <div><strong><span style="color: #d5a34c"><span style="font-size: 18px">"Mang đi từ Huế ngọt lời nhớ thương"</span></span></strong></div>
                    </div>
                </div>
            </div>
            <div class="c40"></div>
            <div class="c30"></div>
        </div>

        <div class="anh">
            <div class="c30"></div>
            <div class="grid">
                <h2 class="title-home"><a href="/blog">Blog ẩm thực </a></h2>
                <div>
                    <div style="text-align: center">
                        Hãy cũng khám phá thực đơn tại nhà hàng Nét&nbsp;Huế để được thưởng thức trọn hương vị ẩm thực<br>
                        Huế Tinh hoa ẩm thực Huế
                   
                    </div>
                </div>
                <div class="c20"></div>
                <div class="flex-container">
                    <div class="cell-1-3 margin-bottom-20 tab-cell-1-2 mobile-cell-1-1">
                        <div>
                            <a href="phong-phu-khau-vi">
                                <img src="../images/banner/phuhopkhauvi.jpg" alt="Phong Phú Khẩu Vị Riêng Của Người Huế " class="image-news" width="100%"></a>
                        </div>
                          <div class="c15"></div>
                        <h3 class="news-name"><a href="phong-phu-khau-vi">Phong Phú Khẩu Vị Riêng Của Người Huế </a></h3>

                    </div>
                    <div class="cell-1-3 margin-bottom-20 tab-cell-1-2 mobile-cell-1-1">
                        <div>
                            <a href="khai-xuan">
                                <img src="../images/Tet-2023/khai-xuan.jpg" alt="Nét Huế Khai Xuân Phục Vụ Tại Chỗ Cả Hệ Thống" class="image-news" width="100%"></a>
                        </div>
                          <div class="c15"></div>
                        <h3 class="news-name"><a href="khai-xuan">Nét Huế Khai Xuân Phục Vụ Tại Chỗ Cả Hệ Thống</a></h3>
                        <div>&nbsp;</div>
                    </div>
                    <div class="cell-1-3 margin-bottom-20 tab-cell-1-2 mobile-cell-1-1">
                        <div>
                            <a href="thong-bao">
                                <img src="images/ban-thong-tet.png" alt="Nét Huế Bán Thông Tết 2025" class="image-news" width="100%"></a>
                        </div>
                          <div class="c15"></div>
                        <h3 class="news-name"><a href="thong-bao">Nét Huế Bán Thông Tết 2025</a></h3>
                        <div>&nbsp;</div>
                    </div>
                </div>
            </div>
            <div class="c30"></div>
        </div>
        <div style="display: none">
            <input type="text" id="txtId" runat="server" name="name" value="" />
            <a href="#" id="btnAdd" runat="server" onserverclick="btnAdd_ServerClick">content</a>
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
    <script>
        function addCart(id) {
            document.getElementById("<%=txtId.ClientID%>").value = id;
            document.getElementById("<%=btnAdd.ClientID%>").click();
        }
    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder7" runat="server">
    <!-- Nội dung cho placeholder 7 -->
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder8" runat="server">
    <!-- Nội dung cho placeholder 8 -->
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder6" runat="server">
    <!-- Nội dung cho placeholder 6 -->
</asp:Content>

