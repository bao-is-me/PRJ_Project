<%-- 
    Document   : listProduct.jsp
    Created on : Mar 3, 2025, 11:06:48 AM
    Author     : daoducdanh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
    </head>
    <style>
            body{
                margin-left: 60px;
            }
            h1
            {
                font-family: sans-serif;
                font-weight: 500;
            }
            table
            {
                margin-top: 10px;
                border-spacing: 0;
            }
            table th,td
            {
                border-top: 1px gray solid;
                padding: 10px 30px;
                width: fit-content;
                text-align: left;

            }
            .update
            {
                background: blue;
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 4px;
            }
            .deactive
            {
                background: #33cc00;
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 4px;
            }
            .delete
            {
                background: red;
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 4px;
            }
            .update, .delete {
                display: inline-block; /* Đảm bảo nút không bị chồng lên nhau */
                margin-right: 10px; /* Tạo khoảng cách giữa hai nút */
                cursor: pointer;
            }
            
            a {
                text-decoration: none
            }
        </style>
    <body>
        <%@ include file="bar.jsp" %>

        <h1>List of Product in system</h1>
        <a href="/lab/add-product" class="update">Add New Product</a>
        <table >
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Product Image</th>
                    <th>Brief</th>
                    <th>Posted Date</th>
                    <th>Unit</th>
                    <th>Price</th>
                    <th>Discount</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${products}" var="item">
                    <tr>
                        <td>${item.productName}</td>
                        <td>
                            <!--<img src="${item.productImage}" style="width: 100px; height: 100px; object-fit: cover" alt="alt"/>-->
                            <img src="<c:url value='${item.productImage}' />" style="width: 100px; height: 100px; object-fit: cover" alt="Ảnh sản phẩm"/>

                        </td>
                        <td>${item.brief}</td>
                        <td>${item.postedDate}</td>
                        <td>${item.unit}</td>
                        <td>${item.price}</td>
                        <td>${item.discount}</td>
                        <td>
                            <a href="/lab/update-product?productId=${item.productId}" class="update">Update</a>
                            <a href="/lab/delete-product?productId=${item.productId}" class="delete">Delete</a>
                        </td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </body>
</html>
