<%-- 
    Document   : homepage.jsp
    Created on : Oct 13, 2025, 8:47:39 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <style>
            .product-item .card-header.product-img {
                /* Vẫn thiết lập tỷ lệ khung hình cố định cho khung chứa ảnh */
                aspect-ratio: 4 / 5; /* Ví dụ: 4/5 cho hình chữ nhật đứng, hoặc 1/1 cho hình vuông */
                overflow: hidden;
                display: flex; /* Dùng flexbox để căn giữa ảnh */
                justify-content: center; /* Căn giữa theo chiều ngang */
                align-items: center; /* Căn giữa theo chiều dọc */
                background-color: #f8f9fa; /* Màu nền cho khoảng trắng, ví dụ xám nhạt */
                border: 1px solid #dee2e6; /* Có thể thêm border để dễ nhìn */
                box-sizing: border-box; /* Đảm bảo padding/border không làm tăng kích thước */
            }

            .product-item .card-header.product-img img {
                /* Buộc ảnh phải nằm gọn trong khung chứa */
                max-width: 100%;
                max-height: 100%;

                /* Thay đổi object-fit từ 'cover' sang 'contain' */
                object-fit: contain; /* Phóng to/thu nhỏ ảnh để vừa nhất trong khung,
                                        giữ nguyên tỷ lệ, không cắt, tạo khoảng trắng nếu cần */
                width: auto;   /* Đảm bảo ảnh không bị kéo dãn */
                height: auto;  /* Đảm bảo ảnh không bị kéo dãn */
            }

            /* Tùy chỉnh cho các ảnh thể loại (categories) nếu bạn cũng muốn chúng có kích thước cố định */
            .cat-img-fixed-size {
                aspect-ratio: 1 / 1; /* Ví dụ: hình vuông cho ảnh thể loại */
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f8f9fa;
                border: 1px solid #dee2e6;
                box-sizing: border-box;
            }
            .cat-img-fixed-size img {
                max-width: 100%;
                max-height: 100%;
                object-fit: contain;
                width: auto;
                height: auto;
            }

            /* Custom 5-columns layout for large screens: each column = 20% */
            @media (min-width: 992px) {
                .col-lg-5th {
                    -ms-flex: 0 0 20%;
                    flex: 0 0 20%;
                    max-width: 20%;
                }
            }
            /* Optional: ensure on extra-large screens it's also 5 per row */
            @media (min-width: 1200px) {
                .col-xl-5th {
                    -ms-flex: 0 0 20%;
                    flex: 0 0 20%;
                    max-width: 20%;
                }
            }
        </style>
    </head>

    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row align-items-center py-3 px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a href="" class="text-decoration-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                </div>
                <div class="col-lg-6 col-6 text-left">
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search for products">
                            <div class="input-group-append">
                                <span class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 col-6 text-right">
                    <a href="" class="btn border">
                        <i class="fas fa-heart text-primary"></i>
                        <span class="badge">0</span>
                    </a>
                    <a href="" class="btn border">
                        <i class="fas fa-shopping-cart text-primary"></i>
                        <span class="badge">0</span>
                    </a>
                    <c:choose>
                        
                        <c:when test="${not empty sessionScope.user}">
                            <a href="" class="btn border d-inline-flex align-items-center text-nowrap">
                                <span class="mr-2">Hello,${user.userName}</span>
                                <i class="fas fa-user text-primary"></i>
                            </a>
                        </c:when>

                        <c:otherwise>
                            
                            <a href="${pageContext.request.contextPath}/login" class="text-dark">Login</a>
                            <span class="text-dark mx-1">/</span>
                            <a href="${pageContext.request.contextPath}/register" class="text-dark">Register</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <!-- Topbar End -->


        <!-- Navbar Start -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="book?page=homepage" class="nav-item nav-link active">Home</a>
                                <a href="book?page=shop&index=1" class="nav-item nav-link">Shop</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="cart.html" class="dropdown-item">Shopping Cart</a>
                                        <a href="checkout.html" class="dropdown-item">Checkout</a>
                                    </div>
                                </div>
                           
                            </div>

                        </div>
                    </nav>
                    <div id="header-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active" style="height: 410px;">
                                <img class="img-fluid" src="https://static.vecteezy.com/system/resources/previews/036/594/463/non_2x/ai-generated-book-store-advertisment-background-with-copy-space-free-photo.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Fashionable Dress</h3>
                                        <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item" style="height: 410px;">
                                <img class="img-fluid" src="https://salina311.com/content/images/2023/05/books-9.jpg" alt="Image">
                                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                    <div class="p-3" style="max-width: 700px;">
                                        <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                                        <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-prev-icon mb-n2"></span>
                            </div>
                        </a>
                        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                                <span class="carousel-control-next-icon mb-n2"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Featured Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                        <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                    <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                        <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featured End -->


        <!-- Categories Start -->
        <div class="container-fluid pt-5">
            <div class="row px-xl-5 pb-3">
                <div class="col-lg-2 col-md-2 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p> -->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3 cat-img-fixed-size">
                            <img class="img-fluid" src="https://th.bing.com/th/id/R.4e21abef4bfd32a2d7bde5047d25343a?rik=lv77l5Oar2%2fVrg&pid=ImgRaw&r=0" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0" style="font-size: 1rem; text-align: center;">Văn học Việt Nam</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p> -->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3 cat-img-fixed-size">
                            <img class="img-fluid" src="https://www.netabooks.vn/Data/Sites/1/Product/27713/de-men-phieu-luu-ky.jpg" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Văn học thiếu nhi </h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p> -->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3 cat-img-fixed-size">
                            <img class="img-fluid" src="https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1443841140i/26855694.jpg" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Văn học kỳ ảo</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p> -->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3 cat-img-fixed-size">
                            <img class="img-fluid" src="https://product.hstatic.net/200000343865/product/hanh-tinh-ki-la_bia_tb-2024_703344c6e62543139b5bfbdedf2adf8e.jpg" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Khoa học viễn tưởng</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p> -->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3 cat-img-fixed-size">
                            <img class="img-fluid" src="https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1630688657i/17907450.jpg" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Trinh thám - Kinh dị</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p> -->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3 cat-img-fixed-size">
                            <img class="img-fluid" src="https://tse1.mm.bing.net/th/id/OIP.I6zYSDNxV4SGd7JQMXQ0vgHaHa?cb=12&rs=1&pid=ImgDetMain&o=7&rm=3" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Khoa học</h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 pb-1">
                    <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                        <!-- <p class="text-right">15 Products</p> -->
                        <a href="" class="cat-img position-relative overflow-hidden mb-3 cat-img-fixed-size">
                            <img class="img-fluid" src="https://salt.tikicdn.com/cache/w1200/ts/product/ee/e9/09/a342260f9b341d980cbdd64c80a9f959.jpg" alt="">
                        </a>
                        <h5 class="font-weight-semi-bold m-0">Phiêu lưu ly kì</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Categories End -->


        <!-- Offer Start -->
        <div class="container-fluid offer pt-5">
            <div class="row px-xl-5">
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                        <img src="img/offer-1.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                            <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 pb-4">
                    <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                        <img src="img/offer-2.png" alt="">
                        <div class="position-relative" style="z-index: 1;">
                            <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                            <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                            <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Offer End -->


        <!-- Products Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Sách bán chạy</span></h2>
            </div>
            <div class="row px-xl-5 pb-3">
                <c:choose>
                    <c:when test="${not empty topSeller}">
                        <c:forEach var="book" items="${topSeller}" varStatus="status">
                            <c:if test="${status.index<8}">
                                <div class="col-lg-5th col-md-4 col-sm-6 pb-1">
                                    <div class="card product-item border-0 mb-4">
                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                            <img class="img-fluid w-100" src="${book.image}" alt="">
                                        </div>
                                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                            <h6 class="text-truncate mb-3">${book.name}</h6>
                                            <div class="d-flex justify-content-center">
                                                <c:choose>
                                                    <c:when test="${not empty book.variants}">
                                                        <h6>${book.variants[0].price}</h6>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h6>Đang cập nhật</h6>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="card-footer d-flex justify-content-between bg-light border">
                                            <a href="book?page=detail&productid=${book.bookId}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <h6>Đang cập nhật sản phẩm</h6>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- Products End -->


        <!-- Subscribe Start -->
        <div class="container-fluid bg-secondary my-5">
            <div class="row justify-content-md-center py-5 px-xl-5">
                <div class="col-md-6 col-12 py-5">
                    <div class="text-center mb-2 pb-2">
                        <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Stay Updated</span></h2>
                        <p>Amet lorem at rebum amet dolores. Elitr lorem dolor sed amet diam labore at justo ipsum eirmod duo labore labore.</p>
                    </div>
                    <form action="">
                        <div class="input-group">
                            <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                            <div class="input-group-append">
                                <button class="btn btn-primary px-4">Subscribe</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Subscribe End -->


        <!-- Products Start -->
        <div class="container-fluid pt-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">Sách mới về</span></h2>
            </div>
            <div class="row px-xl-5 pb-3">
                <c:choose>
                    <c:when test="${not empty newBook}">
                        <c:forEach var="newBook" items="${newBook}" varStatus="status">
                            <c:if test="${status.index<10}">
                                <div class="col-lg-5th col-md-6 col-sm-12 pb-1">
                                    <div class="card product-item border-0 mb-4">
                                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                            <img class="img-fluid w-100" src="${newBook.image}" alt="">
                                        </div>
                                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                            <h6 class="text-truncate mb-3">${newBook.name}</h6>
                                            <div class="d-flex justify-content-center">
                                                <c:choose>
                                                    <c:when test="${ not empty newBook.variants}">
                                                        <h6>${newBook.variants[0].price}</h6>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <h6>Đang cập nhật giá</h6>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                        </div>
                                        <div class="card-footer d-flex justify-content-between bg-light border">
                                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                            <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <h2>Đang cập nhật sản phẩm mới</h2>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- Products End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <p>Dolore erat dolor sit lorem vero amet. Sed sit lorem magna, ipsum no sit erat lorem et magna ipsum dolore amet erat.</p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                          
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>
                            <form action="">
                                <div class="form-group">
                                    <input type="text" class="form-control border-0 py-4" placeholder="Your Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control border-0 py-4" placeholder="Your Email"
                                           required="required" />
                                </div>
                                <div>
                                    <button class="btn btn-primary btn-block border-0 py-3" type="submit">Subscribe Now</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
                        by
                        <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a><br>
                        Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/easing/easing.min.js"></script>
        <script src="${pageContext.request.contextPath}/lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="${pageContext.request.contextPath}/mail/jqBootstrapValidation.min.js"></script>
        <script src="${pageContext.request.contextPath}/mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>

</html>