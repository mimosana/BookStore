<%-- 
    Document   : cart
    Created on : Oct 25, 2025, 1:59:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao diện Giỏ hàng (Có xác nhận)</title>
    <style>
        /* CSS không thay đổi */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }
        .cart-container {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
            max-width: 1200px;
            margin: auto;
        }
        .product-list {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            padding: 20px;
        }
        .cart-header {
            display: flex;
            justify-content: flex-end;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
        }
        .delete-all-link {
            color: #d9534f;
            text-decoration: none;
            font-weight: bold;
            font-size: 0.9em;
        }
        .delete-all-link:hover {
            text-decoration: underline;
        }
        .product-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 20px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        .product-item:last-child {
            border-bottom: none;
        }
        .delete-btn {
            font-size: 1.8em;
            color: #aaa;
            text-decoration: none;
            font-weight: bold;
            line-height: 1;
            transition: color 0.2s;
            margin-left: 15px;
            align-self: center;
        }
        .delete-btn:hover {
            color: #d9534f;
        }
        .product-checkbox {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }
        .product-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid #ddd;
        }
        .product-details {
            flex-grow: 1;
        }
        .product-name {
            font-weight: bold;
            font-size: 1.1em;
            margin-bottom: 5px;
        }
        .product-edition {
            font-size: 0.9em;
            color: #666;
            margin-bottom: 8px;
        }
        .product-price {
            font-size: 1.1em;
            color: #d9534f;
            font-weight: bold;
        }
        .quantity-selector {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .quantity-btn {
            background-color: #f9f9f9;
            border: none;
            width: 30px;
            height: 30px;
            font-size: 1.2em;
            font-weight: bold;
            cursor: pointer;
        }
        .quantity-btn:hover {
            background-color: #f0f0f0;
        }
        .quantity-input {
            width: 40px;
            height: 30px;
            text-align: center;
            border: none;
            border-left: 1px solid #ccc;
            border-right: 1px solid #ccc;
            -moz-appearance: textfield;
            appearance: textfield;
        }
        .quantity-input::-webkit-outer-spin-button,
        .quantity-input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .summary-section {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            padding: 25px;
            height: fit-content; 
            position: sticky;
            top: 20px; 
        }
        .summary-section h3 {
            margin-top: 0;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            font-size: 1.3em;
        }
        .total-price {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 1.2em;
            font-weight: bold;
            margin-top: 20px;
        }
        #total-amount {
            color: #d9534f;
            font-size: 1.3em;
        }
        .checkout-btn {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px;
            font-size: 1.1em;
            font-weight: bold;
            width: 100%;
            cursor: pointer;
            margin-top: 25px;
            transition: background-color 0.2s;
        }
        .checkout-btn:hover {
            background-color: #0056b3;
        }
        @media (max-width: 768px) {
            .cart-container {
                grid-template-columns: 1fr;
            }
            .summary-section {
                position: static;
                margin-top: 20px;
            }
            .product-item {
                flex-wrap: wrap; 
            }
            .product-details {
                width: 100%;
                flex-basis: 100%;
                margin-top: 10px;
            }
            .delete-btn {
                margin-left: auto;
            }
        }
    </style>
</head>
<body>
    <%@include file="header.jsp" %>

    <div class="cart-container">
        <div class="product-list">
            <div class="cart-header">
                <a href="cart/action=deleteAll" class="delete-all-link">Xóa tất cả</a>
            </div>

            <div class="product-item" data-price="250000" data-product-id="P001">
                <input type="checkbox" class="product-checkbox">
                <img src="https://via.placeholder.com/150/007BFF/FFFFFF?text=Sản+Phẩm+1" alt="Ảnh sản phẩm" class="product-image">
                <div class="product-details">
                    <div class="product-name">Áo Sơ mi Nam Cao cấp</div>
                    <div class="product-edition">Edition: Xanh Navy, Size L</div>
                    <div class="product-price">250,000đ</div>
                </div>
                <div class="quantity-selector">
                    <button class="quantity-btn minus">-</button>
                    <input type="number" class="quantity-input" value="1" min="1">
                    <button class="quantity-btn plus">+</button>
                </div>
                <a href="cart/action=delete&productId=P001" class="delete-btn" aria-label="Xóa sản phẩm">&times;</a>
            </div>

            <div class="product-item" data-price="1200000" data-product-id="P002">
                <input type="checkbox" class="product-checkbox">
                <img src="https://via.placeholder.com/150/28A745/FFFFFF?text=Sản+Phẩm+2" alt="Ảnh sản phẩm" class="product-image">
                <div class="product-details">
                    <div class="product-name">Giày Thể thao Chạy bộ</div>
                    <div class="product-edition">Edition: Đen, Size 42</div>
                    <div class="product-price">1,200,000đ</div>
                </div>
                <div class="quantity-selector">
                    <button class="quantity-btn minus">-</button>
                    <input type="number" class="quantity-input" value="1" min="1">
                    <button class="quantity-btn plus">+</button>
                </div>
                <a href="cart/action=delete&productId=P002" class="delete-btn" aria-label="Xóa sản phẩm">&times;</a>
            </div>

            <div class="product-item" data-price="450000" data-product-id="P003">
                <input type="checkbox" class="product-checkbox">
                <img src="https://via.placeholder.com/150/FFC107/333333?text=Sản+Phẩm+3" alt="Ảnh sản phẩm" class="product-image">
                <div class="product-details">
                    <div class="product-name">Quần Jeans Nữ Lưng cao</div>
                    <div class="product-edition">Edition: Xanh nhạt, Size M</div>
                    <div class="product-price">450,000đ</div>
                </div>
                <div class="quantity-selector">
                    <button class="quantity-btn minus">-</button>
                    <input type="number" class="quantity-input" value="1" min="1">
                    <button class="quantity-btn plus">+</button>
                </div>
                <a href="cart/action=delete&productId=P003" class="delete-btn" aria-label="Xóa sản phẩm">&times;</a>
            </div>
        </div>

        <div class="summary-section">
            <h3>Tóm tắt đơn hàng</h3>
            <div class="total-price">
                <span>Tổng tiền:</span>
                <span id="total-amount">0đ</span>
            </div>
            <button class="checkout-btn">Tiến hành Thanh toán</button>
        </div>
    </div>
    <%@include file="footer.jsp" %>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            
            const productCheckboxes = document.querySelectorAll('.product-checkbox');
            const quantityButtons = document.querySelectorAll('.quantity-btn');
            const quantityInputs = document.querySelectorAll('.quantity-input');
            const totalAmountElement = document.getElementById('total-amount');
            
            // --- THÊM MỚI: Lấy phần tử liên kết "Xóa tất cả" ---
            const deleteAllLink = document.querySelector('.delete-all-link');
            // --- KẾT THÚC THÊM MỚI ---

            // Hàm tính tiền không thay đổi
            function updateTotalPrice() {
                let total = 0;
                document.querySelectorAll('.product-item').forEach(item => {
                    const checkbox = item.querySelector('.product-checkbox');
                    if (checkbox.checked) {
                        const price = parseFloat(item.dataset.price); 
                        const quantity = parseInt(item.querySelector('.quantity-input').value);
                        total += price * quantity;
                    }
                });
                totalAmountElement.textContent = total.toLocaleString('vi-VN') + 'đ';
            }

            // Các hàm xử lý +/- và nhập số lượng không thay đổi
            quantityButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const input = this.parentElement.querySelector('.quantity-input');
                    let currentValue = parseInt(input.value);
                    if (this.classList.contains('plus')) {
                        currentValue++;
                    } else if (this.classList.contains('minus') && currentValue > 1) {
                        currentValue--;
                    }
                    input.value = currentValue;
                    updateTotalPrice(); 
                });
            });

            quantityInputs.forEach(input => {
                input.addEventListener('change', function() {
                    if (parseInt(this.value) < 1 || isNaN(parseInt(this.value))) {
                        this.value = 1;
                    }
                    updateTotalPrice(); 
                });
            });

            // Hàm xử lý checkbox không thay đổi
            productCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    updateTotalPrice();
                });
            });

            // --- THÊM MỚI: Bắt sự kiện click cho nút "Xóa tất cả" ---
            deleteAllLink.addEventListener('click', function(event) {
                // Hiển thị hộp thoại xác nhận
                const confirmed = confirm('Bạn có chắc chắn muốn xóa tất cả sản phẩm không?');
                
                // Nếu người dùng bấm "Cancel" (confirmed = false),
                // thì hủy bỏ hành động mặc định của liên kết (là chuyển trang)
                if (!confirmed) {
                    event.preventDefault();
                }
            });
            // --- KẾT THÚC THÊM MỚI ---

            // Cập nhật tổng tiền lần đầu khi tải trang
            updateTotalPrice();
        });
    </script>

</body>
</html>