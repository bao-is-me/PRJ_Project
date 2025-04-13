<%@page import="models.Category"%>
<%@page import="models.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }

            thead {
                background-color: #007bff;
                color: white;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                text-transform: uppercase;
                font-size: 14px;
            }

            td img {
                width: 80px;
                height: 80px;
                object-fit: cover;
                border-radius: 5px;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            /* Định dạng phần chọn danh mục */
            label {
                font-size: 16px;
                font-weight: bold;
                margin-right: 10px;
                color: #333;
                
            }

            select {
                padding: 8px 12px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: white;
                cursor: pointer;
                transition: 0.3s;
            }

            /* Hiệu ứng khi hover */
            select:hover {
                border-color: #007bff;
            }

            /* Hiệu ứng khi focus */
            select:focus {
                outline: none;
                border-color: #0056b3;
                box-shadow: 0 0 5px rgba(0, 91, 187, 0.5);
            }

            /* Tùy chỉnh dropdown */
            option {
                padding: 10px;
            }
            .search-container {                
                align-items: center;
                gap: 10px;
                margin-bottom: 15px;
            }

            .search-container label {
                font-size: 16px;
                font-weight: bold;
                color: #333;
            }

            .search-container input {
                width: 250px;
                padding: 8px;
                font-size: 14px;
                border: 1px solid #ccc;
                border-radius: 5px;
                outline: none;
                transition: all 0.3s ease-in-out;
            }

            .search-container input:focus {
                border-color: #007bff;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }

            .search-container button {
                background-color: #007bff;
                color: white;
                padding: 8px 15px;
                font-size: 14px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out;
            }

            .search-container button:hover {
                background-color: #0056b3;
            }
            /* Grid layout */
            .product-container {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 20px;
                padding: 20px;
                justify-content: center;
            }

            /* Card styling */
            .product-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                transition: transform 0.3s ease-in-out;
            }

            .product-card:hover {
                transform: translateY(-5px);
            }

            /* Product image */
            .product-img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            /* Product info */
            .product-info {
                padding: 15px;
                text-align: center;
            }

            .product-name {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .product-price {
                font-size: 16px;
                color: #e91e63;
                font-weight: bold;
            }

            .product-discount {
                font-size: 14px;
                color: #4caf50;
            }

            /* Button (Link style) */
            .view-detail-btn {
                display: inline-block;
                margin-top: 10px;
                padding: 8px 15px;
                background: #007bff;
                color: white;
                font-size: 14px;
                border-radius: 5px;
                text-decoration: none;
                transition: background 0.3s ease-in-out;
            }

            .view-detail-btn:hover {
                background: #0056b3;
            }
            /* Bộ lọc giá */
            .filter-container {
                align-items: center;
                gap: 10px;
                margin-bottom: 15px;
            }

            .filter-container input {
                padding: 5px;
                width: 100px;
            }

            .filter-container button {
                padding: 6px 10px;
                background: #4caf50;
                color: white;
                border: none;
                cursor: pointer;
            }

            .filter-container button:hover {
                background: #388e3c;
            }

            h2{
                text-align: center;
                text-decoration: none;
            }

            h2 a{
                text-decoration: none;
            }


        </style>


    </head>
    <body>

        <h1>
            <a>Home Page</a>
        </h1>
        <%@ include file="homepage.jsp" %>
        <h2> </h2>

        <%
            String searchKeyword = request.getParameter("search") != null ? request.getParameter("search") : "";
        %>

        <div class="search-container">
            <form action="home">
                <input type="hidden" name="action" value="searchProductByName" />

                <label for="search">Search Product:</label>
                <input type="text" id="search" name="search" value="<%= searchKeyword%>" placeholder="Enter product name..." />

                <button type="submit">Search</button>
            </form>
        </div>



        <%
            List<Category> categoryList = (List<Category>) request.getAttribute("categories");
            String selectedCategory = request.getParameter("categoryId");
        %>

        <div style="margin-bottom: 15px;">
            <form action="home">
                <div class="CateBar">
                    <label for="category">Category:</label>
                    <input type="hidden" name="action" value="getProductByCategory" />
                    <select name="categoryId" id="category" onchange="this.form.submit()">
                        <option value="all" <%= (selectedCategory == null || selectedCategory.equals("all")) ? "selected" : ""%>>-- All Category --</option>
                        <%
                            if (categoryList != null) {
                                for (Category category : categoryList) {
                                    int categoryId = category.getTypeId();
                                    String categoryIdStr = String.valueOf(categoryId);
                        %>
                        <option value="<%= categoryIdStr%>" <%= (categoryIdStr.equals(selectedCategory)) ? "selected" : ""%>>
                            <%= category.getCategoryName()%>
                        </option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>
            </form>
        </div>


        <%
            String minPrice = request.getParameter("minPrice") != null ? request.getParameter("minPrice") : "";
            String maxPrice = request.getParameter("maxPrice") != null ? request.getParameter("maxPrice") : "";
        %>
        <div class="filter-container">
            <form action="home">
                <input type="hidden" name="action" value="filterByPrice" />

                <label for="minPrice">Min Price:</label>
                <input type="number" id="minPrice" name="minPrice" value="<%= minPrice%>" placeholder="Min Price" />

                <label for="maxPrice">Max Price:</label>
                <input type="number" id="maxPrice" name="maxPrice" value="<%= maxPrice%>" placeholder="Max Price" />

                <button type="submit">Filter</button>
            </form>
        </div>        


        <div class="product-container">
            <%
                List<Product> productList = (List<Product>) request.getAttribute("products");
                if (productList != null && !productList.isEmpty()) {
                    for (Product product : productList) {
            %>
            <div class="product-card">
                <img src="<%= request.getContextPath()%><%= product.getProductImage()%>" class="product-img" alt="Ảnh sản phẩm"/>
                <div class="product-info">
                    <h3 class="product-name"><%= product.getProductName()%></h3>
                    <p class="product-price">$<%= product.getPrice()%></p>
                    <p class="product-discount">Discount: <%= product.getDiscount()%>%</p>
                    <a href="productDetail.jsp?productId=<%= product.getProductId()%>" class="view-detail-btn">View Detail</a>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </body>
</html>
