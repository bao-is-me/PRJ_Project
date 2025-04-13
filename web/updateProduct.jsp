
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
        }
        .container {

        }
        h2 {

        }
        form {
            margin-left: 100px;
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
        }
        input[type="text"], input[type="password"], input[type="email"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin: 5px 0 10px 0;
            box-sizing: border-box;
        }
        .gender-container, .role-container {
            margin: 5px 0 10px 0;
        }
        .gender-container label, .role-container label {
            margin-right: 20px;
        }
        input[type="radio"] {
            margin-right: 5px;
        }
        .checkbox-container {
            display: flex;
            align-items: center;
        }
        input[type="checkbox"] {
            margin-right: 10px;
        }
        .submit-button {
            padding: 10px;
            border: none;
            cursor: pointer;
            width: fit-content;
            background: white;
            border: 1px gray solid;
            margin-top: 10px;
        }
        
        

    </style>
    <body>
        <div class="container">
            <h2>Update New Product</h2>
            <h2>${message}</h2>
            <form action="/lab/update-product" method="POST">
                
                <input type="hidden" name="productId" value="${product.productId}">

                <label for="productName">Product Name</label>
                <input type="text" id="productName" name="productName" value="${product.productName}" placeholder="Enter product name" required>

                <label for="productImage">Product Image URL</label>
                <input type="text" id="productImage" name="productImage" value="${product.productImage}" placeholder="Enter image URL" required>

                <label for="brief">Brief Description</label>
                <textarea id="brief" name="brief" placeholder="Enter brief description" required>${product.brief}</textarea>

                <label for="typeId">Category</label>
                <select id="typeId" name="typeId" required>
                    <c:forEach items="${categorys}" var="item">
                        <option value="${item.typeId}" ${item.typeId == product.typeId ? 'selected' : ''}>
                            ${item.categoryName}
                        </option>
                    </c:forEach>
                </select>

                <label for="unit">Unit</label>
                <input type="text" id="unit" name="unit" value="${product.unit}" placeholder="Enter unit" required>

                <label for="price">Price</label>
                <input type="number" id="price" name="price" value="${product.price}" placeholder="Enter price" required>

                <label for="discount">Discount (%)</label>
                <input type="number" id="discount" name="discount" value="${product.discount}" placeholder="Enter discount percentage" required>

                <button type="submit" class="submit-button">Update Product</button>
            </form>

        </div>

    </body>
</html>
