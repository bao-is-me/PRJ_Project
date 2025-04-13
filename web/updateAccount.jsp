<%-- 
    Document   : updateAccount
    Created on : Mar 13, 2025, 10:49:43 PM
    Author     : Admin
--%>

<%@page import="models.Account"%>
<%@page import="daos.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
        
        <style>
            body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

.page-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
}

.container {
    width: 100%;
    max-width: 500px;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.form-group {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
}

label {
    font-weight: bold;
    margin-bottom: 5px;
    color: #555;
}

input[type="text"], 
input[type="password"], 
input[type="email"], 
input[type="date"], 
select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    transition: 0.3s;
}

input:focus, select:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    outline: none;
}

.gender-container {
    display: flex;
    gap: 20px;
}

.checkbox-container {
    display: flex;
    align-items: center;
    gap: 10px;
}

button.submit-button {
    padding: 12px;
    background-color: #007bff;
    color: white;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s ease-in-out;
}

button.submit-button:hover {
    background-color: #0056b3;
}

        </style>
    </head>
    <body>
        <%
            String accountId = request.getParameter("id");
            AccountDAO dao = new AccountDAO();
            Account acc = dao.GetByAccount(accountId);
        %>
        <h2>Update Account</h2>
        <form action="account" method="POST">
            <label for="account">Account</label>
            <input type="text" id="account" value="<%= acc.getAccount()%>" disabled>
            <input type="hidden" id="account" name="account" value="<%= accountId %>">

            <label for="password">Password</label>
            <input type="password" id="password" name="password" value="<%= acc.getPass()%>">

            <label for="lastName">Last name</label>
            <input type="text" id="lastName" name="lastName" value="<%= acc.getLastName()%>">

            <label for="firstName">First name</label>
            <input type="text" id="firstName" name="firstName" value="<%= acc.getFirstName()%>">

            <label for="phoneNumber">Phone number</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="<%= acc.getPhone()%>">

            <label for="birthDay">Birth day</label>
            <input type="date" id="birthDay" name="birthDay" value="<%= acc.getBirthday()%>">

            <label>Gender</label>
            <div class="gender-container">
                <label>
                    <%
                        if (acc.isGender()) {
                    %>
                    <input type="radio" name="gender" value="male" checked required> Male
                    <% } else {
                    %>
                    <input type="radio" name="gender" value="male" required> Male
                    <%
                        }
                    %>
                </label>
                <label>
                    <%
                        if (!acc.isGender()) {
                    %>
                    <input type="radio" name="gender" value="female" required checked> Female
                    <%
                    } else {
                    %>
                    <input type="radio" name="gender" value="female" required> Female
                    <%
                        }
                    %>
                </label>
            </div>

            <label for="role">Role in system</label>
            <select id="role" name="role" required>
                <%
                    if (acc.getRoleInSystem() == 0) {
                %>
                <option value="administrator">Administrator</option>
                <option value="user" selected>User</option>
                <%
                } else {
                %>
                <option value="administrator" selected>Administrator</option>
                <option value="user" >User</option>
                <%
                    }
                %>
            </select>

            <div class="checkbox-container">
                <%
                    if (acc.isIsUse()) {
                %>
                <input type="checkbox" id="isActive" name="isActive" checked>
                <%
                } else {
                %>
                <input type="checkbox" id="isActive" name="isActive">
                <%
                    }
                %>
                <label for="isActive">Is active</label>
            </div>

                <button type="submit" class="submit-button" name="action" value="update">Submit</button>
        </form>
    </body>
</html>
