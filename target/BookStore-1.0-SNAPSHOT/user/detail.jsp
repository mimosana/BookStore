<%-- 
    Document   : detail
    Created on : Oct 24, 2025, 2:54:24 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </head>

    <body>
        <%@include file="header.jsp" %>
        <!-- Shop Detail Start -->
        <c:choose>
    <c:when test="${not empty detailBook}">

        <c:set var="bookVar" value="${detailBook}"/>
        
        <c:set var="defaultVariant" value="${bookVar.variants[0]}"/>

        <div class="container-fluid py-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 pb-5">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner border">
                            <div class="carousel-item active">
                                <%-- SỬA LOGIC: Lấy ảnh của sách chính --%>
                                <img class="w-100 h-100" src="${bookVar.image}" alt="Image">
                            </div>
                            </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>

                <div class="col-lg-7 pb-5">
                    <%-- SỬA LOGIC: Lấy tên sách từ 'bookVar' (BookDTO) --%>
                    <h3 class="font-weight-semi-bold">${bookVar.name}</h3>
                    
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-2">
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star"></small>
                            <small class="fas fa-star-half-alt"></small>
                            <small class="far fa-star"></small>
                        </div>
                        <small class="pt-1">(50 Reviews)</small>
                    </div>

                    <%-- SỬA LOGIC: Hiển thị giá mặc định VÀ thêm ID 'product-price' --%>
                    <h3 class="font-weight-semi-bold mb-4" id="product-price">${defaultVariant.price}</h3>
                    
                    <%-- THÊM MỚI: Hiển thị tồn kho mặc định VÀ thêm ID 'product-stock' --%>
                    <p class="mb-2">
                        Tồn kho: <span id="product-stock">${defaultVariant.stock}</span>
                    </p>

                    <p class="mb-4">${bookVar.description}</p>

                    <%-- 
                      SỬA LỖI 1: BẮT ĐẦU THẺ <FORM>
                      Phải bọc tất cả <select>, <input> và nút <button>
                    --%>
                    <form action="${pageContext.request.contextPath}/cart" method="GET">
                        
                        <div class="d-flex mb-3">
                            <p class="text-dark font-weight-medium mb-0 mr-3">Edition</p>
                            <select name="product" id="edition-select" class="form-control" style="width: 200px;">
                                <c:forEach var="variant" items="${bookVar.variants}">
                                    <option value="${variant.bookVarId}" 
                                            data-price="${variant.price}" 
                                            data-stock="${variant.stock}">
                                        ${variant.edition}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="d-flex align-items-center mb-4 pt-2">
                            <div class="input-group quantity mr-3" style="width: 130px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-primary btn-minus" type="button">
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                
                                <%-- SỬA LỖI 2: Thêm name="quantity" --%>
                                <input type="text" class="form-control bg-secondary text-center" value="1" name="quantity">
                                
                                <div class="input-group-btn">
                                    <button class="btn btn-primary btn-plus" type="button">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                            
                            <%-- SỬA LỖI 3: Nút này phải là type="submit" --%>
                            <button class="btn btn-primary px-3" type="submit">
                                <i class="fa fa-shopping-cart mr-1"></i> Add To Cart
                            </button>
                        </div>
                        
                    </form> 
                    <%-- SỬA LỖI 1: KẾT THÚC THẺ <FORM> --%>
                </div>
            </div>
            
            <div class="row px-xl-5">
                <div class="col">
                    <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Product Description</h4>
                            <p>${bookVar.description}</p>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <h4 class="mb-3">Additional Information</h4>
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item px-0">Tác giả</li>
                                        <li class="list-group-item px-0">Nhà sản xuất</li>
                                        <li class="list-group-item px-0">Năm sản xuất</li>
                                        <li class="list-group-item px-0">Ngôn ngữ</li>
                                    </ul> 
                                </div>
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <%-- SỬA LỖI 4: Sửa 'authour' thành 'author' --%>
                                        <li class="list-group-item px-0">${bookVar.author.name}</li>
                                        <li class="list-group-item px-0">${bookVar.publisher.name}</li>
                                        <li class="list-group-item px-0">${bookVar.publishYear}</li>
                                        <%-- SỬA LỖI 5: Lấy ngôn ngữ từ 'defaultVariant' --%>
                                        <li class="list-group-item px-0">${defaultVariant.language}</li>
                                    </ul> 
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-3">
                            <%-- (Nội dung tab review...) --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </c:when>
    <c:otherwise>
        <h2 style="text-align:center">Sản phẩm vẫn đang cập nhập</h2>
    </c:otherwise>
</c:choose>
        <!-- Shop Detail End -->


        <!-- Products Start -->
        <div class="container-fluid py-5">
            <div class="text-center mb-4">
                <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="owl-carousel related-carousel">
                        <div class="card product-item border-0">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="img/product-1.jpg" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                        <div class="card product-item border-0">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="img/product-2.jpg" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                        <div class="card product-item border-0">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="img/product-3.jpg" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                        <div class="card product-item border-0">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="img/product-4.jpg" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                        <div class="card product-item border-0">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="img/product-5.jpg" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">Colorful Stylish Shirt</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>$123.00</h6><h6 class="text-muted ml-2"><del>$123.00</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Products End -->


        <%@include file="footer.jsp" %>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>

    <%-- THÊM ĐOẠN NÀY ĐỂ CẬP NHẬT GIÁ VÀ KHO --%>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            
            const editionSelect = document.getElementById("edition-select");
            const priceElement = document.getElementById("product-price");
            const stockElement = document.getElementById("product-stock");

            editionSelect.addEventListener("change", function() {
                const selectedOption = this.options[this.selectedIndex];
                const newPrice = selectedOption.dataset.price;
                const newStock = selectedOption.dataset.stock;

                priceElement.textContent = newPrice; 
                stockElement.textContent = newStock;
            });
        });
    </script>
    </body>

</html>