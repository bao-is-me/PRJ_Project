<%@page import="daos.ProductDAO"%>
<%@page import="models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String productId = request.getParameter("productId");
    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.findById(productId);

    if (product == null) {
%>
<h2>Product not found!</h2>
<%
} else {
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><%= product.getProductName()%> - Product Details</title>
        <style>
            /* Container chi tiết sản phẩm */
            .product-detail {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-wrap: wrap;
                gap: 30px;
                padding: 40px;
            }

            /* Ảnh sản phẩm */
            .product-detail-img {
                width: 350px;
                height: 350px;
                object-fit: cover;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            /* Thông tin chi tiết */
            .product-detail-info {
                max-width: 500px;
            }

            .product-detail-info h2 {
                font-size: 28px;
                margin-bottom: 15px;
            }

            .product-price {
                font-size: 20px;
                color: #e91e63;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .product-discount {
                font-size: 18px;
                color: #4caf50;
                margin-bottom: 10px;
            }

            .product-description {
                font-size: 16px;
                line-height: 1.5;
                margin-bottom: 20px;
            }

            /* Nút quay lại */
            .back-btn {
                display: inline-block;
                padding: 10px 15px;
                background: #6c757d;
                color: white;
                font-size: 16px;
                border-radius: 5px;
                text-decoration: none;
                transition: background 0.3s ease-in-out;
            }

            .back-btn:hover {
                background: #5a6268;
            }

        </style>
    </head>
    <body>

        <div class="product-detail">
            <img src="<%= request.getContextPath()%><%= product.getProductImage()%>" class="product-detail-img" alt="Ảnh sản phẩm"/>

            <div class="product-detail-info">
                <h2><%= product.getProductName()%></h2>
                <p class="product-price"><strong>Price:</strong> $<%= product.getPrice()%></p>
                <p class="product-discount"><strong>Discount:</strong> <%= product.getDiscount()%>%</p>
                <p class="product-description"><strong>Description:</strong> <%= product.getBrief()%></p>

                <!-- Nút quay về trang sản phẩm -->
                <a href="home?action=Product+List" class="back-btn">Back to Products</a>
            </div>
        </div>

    </body>
</html>

<%
    }
%>
