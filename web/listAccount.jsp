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
        <a  href="addAccount.jsp" class="update">Add New Account</a>
        <table >
            <thead>
                <tr>

                    <th>Account</th>
                    <th>Full name</th>
                    <th>Birth day</th>
                    <th>Gender</th>
                    <th>Phone   </th>
                    <th>Role in system</th>
                    <th>Is Use</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.acc}" var="item">
                <form action="account" method="POST">
                    <tr>
                        <td>${item.account}</td>
                    <input type="hidden" name="account" value="${item.account}" />
                    <td>${item.lastName} ${item.firstName}</td>
                    <td>${item.birthday}</td>
                    <td>${item.gender == true ? "Male" : "Female"}</td>
                    <td>${item.phone}</td>
                    <td>${item.roleInSystem == 1 ? "Administrator" : "User"}</td>
                    <td>
                        <input type="checkbox" name="isUse" disabled=""
                               <c:if test="${item.isUse}">checked</c:if> />
                        </td>
                        <td>
                            <a class="update" href="updateAccount.jsp?id=${item.account}">Update</a>
                        <button class="deactive" name="action" value="deactive">Deactive</button>
                        <button class="delete" name="action" value="delete">Delete</button>
                    </td>
                    </tr>
                </form>
            </c:forEach>

        </tbody>
    </table>

</body>
</html>
