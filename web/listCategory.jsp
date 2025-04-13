<%-- 
    Document   : listAccount
    Created on : Jun 23, 2024, 6:54:36 PM
    Author     : markx-dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List account</title>
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
            table thead
            {
                background-color: #f4f4f9;

            }
            table tbody tr:nth-child(even)
            {
                background-color: #f4f4f9;
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
        </style>
    </head>
    <body>
        <%@ include file="bar.jsp" %>

        <h1>List of account in system</h1>
    <a href="addCategory.jsp" class="update">Add New Category</a>

        <table >
            <thead>
                <tr>
                    <th>Type ID</th>
                    <th>Category Name</th>
                    <th>Memo</th>

                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.acc}" var="item">
                <form action="category" method="post">
                    <tr>
                        <td>
                            ${item.typeId}
                            <input type="hidden" name="id" value="${item.typeId}" />
                        </td>
                        <td>
                            <input type="text" name="name" value="${item.categoryName}" required/>
                        </td>
                        <td>
                            <input type="text" name="memo" value="${item.memo}"/>
                        </td>
                        <td>
                            <button class="update" name="action" value="update">Update</button>
                            <button class="delete" name="action" value="delete">Delete</button>
                        </td>
                    </tr>
                </form>
            </c:forEach>

        </tbody>
    </table>

</body>
</html>
