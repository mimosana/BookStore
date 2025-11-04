<%-- 
    Document   : shop
    Created on : Oct 25, 2025, 1:59:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    
    <!-- CSS TÙY CHỈNH CHO DROPDOWN FILTER -->
    <style>
        /* Container cho nút Filter, đảm bảo vị trí tương đối */
        /* Giữ nguyên relative để nút bấm có thể là anchor cho filter */
        .filter-container-wrapper {
            position: relative; 
            display: inline-block;
        }

        /* Khối hiển thị các tùy chọn Filter */
        #filter-options-container {
            /* << SỬA LỖI: Đã chuyển thành cấu trúc dòng chảy bình thường >> */
            /* Vẫn giữ position: absolute để nó hiển thị sát dưới nút bấm */
            position: relative; 
            top: 100%; 
            left: 0; 
            z-index: 1000;
            width: 1600px; 
            max-width: 90vw;
            margin: 10px 0 0 0; 
            
            background-color: #f8f9fa; 
            border: 1px solid #dee2e6;
            border-radius: 5px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
            padding: 15px;
            display: none; /* Mặc định ẩn */
        }
        
        /* PHỤC HỒI CHỨC NĂNG ĐẨY SẢN PHẨM: 
           Sẽ đặt filter-container-wrapper và #filter-options-container vào 
           một khối div lớn có position: static để nó đẩy sản phẩm.
           Chúng ta sẽ dùng một div mới trong HTML để làm điều này. */
           
        .filter-group {
            margin-bottom: 15px;
            padding-bottom: 15px;
            border-bottom: 1px dashed #dee2e6;
        }

        .filter-group:last-child {
            border-bottom: none;
        }

        .filter-options {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .filter-options .option {
            padding: 6px 12px;
            border: 1px solid #ced4da;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.2s;
            font-size: 0.85rem;
            background-color: #fff;
            white-space: nowrap;
        }

        .filter-options .option.active {
            background-color: #FFD333; 
            color: #212529;
            border-color: #FFD333;
            font-weight: 500;
        }
        
        .filter-actions {
            padding-top: 10px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        
        /* Đảm bảo căn trái trên di động */
        @media (max-width: 767.98px) {
            #filter-options-container {
                left: 0;
                right: auto;
                width: 100%;
                max-width: 100%;
            }
        }
       
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
    <!-- Topbar & Navbar Start (Giữ nguyên) -->
    <%@include file="header.jsp" %>
    <!-- Navbar End -->


    <!-- FILTER & SORT BAR (Nằm trong luồng, không phải header) -->
    <div class="container-fluid pt-3 pb-3">
        <div class="row px-xl-5">
            <div class="col-12">
                <!-- Wrapper cho Filter, Search, Sort -->
                <div class="d-flex align-items-center justify-content-between">
                    
                    <!-- FILTER BUTTON (LEFT) -->
                    <!-- Đã bỏ filter-container-wrapper ở đây, thay thế bằng div chung để filter options đẩy nội dung -->
                    <div class="d-flex flex-column align-items-start w-100"> 
                        
                        <!-- Nút Trigger -->
                        <div class="filter-container-wrapper">
                            <form action="${pageContext.request.contextPath}/book" method="GET" id="filter-form">
            <input type="hidden" name="page" value="shop">
                            <button id="filter-toggle-btn" type="button" class="btn border dropdown-toggle bg-primary text-white" style="border-color: #FFD333 !important;">
                                <i class="fa fa-filter"></i> Bộ Lọc Sản Phẩm
                            </button>
                            
                            <!-- Filter Options Container -->
                            <div id="filter-options-container">
                                
                                <h5 class="mb-3 text-dark">Tùy Chọn Lọc</h5>
                                <c:if test="${not empty listC}">
                <div class="filter-group filter-row">
                    <h6 class="filter-group-title text-dark">Thể Loại</h6>
                    <select name="category" class="custom-select filter-select">
                        <option value="all" selected>Tất cả</option>
                        <c:forEach var="c" items="${listC}">
                            <option value="${c.name}">${c.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>
                                    

                                <c:if test="${not empty listA}">
                <div class="filter-group filter-row">
                    <h6 class="filter-group-title text-dark">Tác Giả</h6>
                    <select name="author" class="custom-select filter-select">
                        <option value="all" selected>Tất cả</option>
                        <c:forEach var="a" items="${listA}">
                            <option value="${a.name}">${a.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>
                                    
                               
                                <c:if test="${not empty listP}">
                <div class="filter-group filter-row">
                    <h6 class="filter-group-title text-dark">Nhà Xuất Bản</h6>
                    <select name="publisher" class="custom-select filter-select">
                        <option value="all" selected>Tất cả</option>
                        <c:forEach var="p" items="${listP}">
                            <option value="${p.name}">${p.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </c:if>
                                <div class="filter-actions">
                                    <button type="submit" id="apply-filter-btn" class="btn btn-primary btn-sm apply-btn">Lọc</button>
                                </div>
                            </div>
                            </form>
                       
                        </div>
                    </div>
                    
                   
                </div>
            </div>
        </div>
    </div>
    <!-- FILTER & SORT BAR END -->


    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <c:choose>
                <c:when test="${not empty list}">
            <!-- Shop Product Start (col-lg-12 để sản phẩm chiếm toàn bộ chiều rộng) -->
            <div class="col-lg-12 col-md-12">
                <div class="row pb-3">
                    <c:forEach var="b" items="${list}">
                    <!-- DANH SÁCH SẢN PHẨM (4 sản phẩm/hàng: col-lg-3) -->
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="${b.image}" alt="">
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${b.name}</h6>
                                <div class="d-flex justify-content-center">
                                    <h6>${b.variants[0].price}</h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href="book?page=detail&productid=${b.bookId}" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    
                    
                    <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center mb-3">
                            <li class="page-item disabled">
                              <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                              </a>
                            </li>
                            <c:forEach begin="1" end="${endP}" var="i">
                            <li class="page-item ${curIndex==i?'active':''}"><a class="page-link" href="${pageContext.request.contextPath}/book?page=shop&index=${i}">${i}</a></li>
                            </c:forEach>
                            <li class="page-item">
                              <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                              </a>
                            </li>
                            
                          </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Shop Product End -->
                </c:when>
            </c:choose>
        </div>
    </div>
    <!-- Shop End -->


    <!-- Footer Start -->
    <%@include file="footer.jsp" %>
    <!-- Footer End -->



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
    
    <!-- JAVASCRIPT XỬ LÝ FILTER DROPDOWN -->
    <script>
        $(document).ready(function() {
            const $filterContainer = $("#filter-options-container");
            
            // 1. Mở/Đóng Dropdown Filter khi nhấn nút
            $("#filter-toggle-btn").on('click', function() {
                // slideToggle() sẽ mở/đóng và đẩy nội dung bên dưới
                // **CHÚ Ý: Hàm slideToggle() tự động thay đổi display: none/block và tạo hiệu ứng trượt**
                $filterContainer.slideToggle(200);
            });

            // 2. Xử lý lựa chọn Option (Single Choice)
            $filterContainer.on('click', '.option', function() {
                const $clickedOption = $(this);
                // Tìm đến khối cha gần nhất có class 'filter-row'
                const $filterGroup = $clickedOption.closest('.filter-row');

                // Xóa trạng thái 'active' của tất cả các option trong cùng nhóm
                $filterGroup.find('.option').removeClass('active');

                // Thêm trạng thái 'active' vào tùy chọn vừa được click
                $clickedOption.addClass('active');
            });

            // 3. Xử lý khi nhấn Lọc Kết Quả (Áp dụng bộ lọc)
            $("#apply-filter-btn").on('click', function() {
                const activeFilters = {};
                
                // Thu thập giá trị đang được chọn
                $filterContainer.find('.filter-row').each(function() {
                    const filterName = $(this).data('filter');
                    const activeOption = $(this).find('.option.active');
                    
                    if (activeOption.length && activeOption.data('value') !== 'all') {
                        activeFilters[filterName] = activeOption.data('value');
                    }
                });
                
                console.log('Bộ lọc hiện tại:', activeFilters);
                // ⚠️ Gửi request tới Controller (Servlet) tại đây
                
                $filterContainer.slideUp(200); // Đóng filter sau khi áp dụng
            });
        });
        
        // Đảm bảo click bên ngoài filter cũng đóng nó
        $(document).click(function(event) {
            const $target = $(event.target);
            const $filterContainer = $("#filter-options-container");
            const $filterButton = $("#filter-toggle-btn");

            // Nếu click không phải là nút toggle, và không phải bên trong container filter
            if (!$target.is($filterButton) && !$target.closest('.filter-container-wrapper').length && $filterContainer.is(':visible')) {
                $filterContainer.slideUp(200);
            }
        });
    </script>
</body>

</html>