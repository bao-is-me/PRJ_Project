<%-- 
    Document   : listAccount
    Created on : Jun 23, 2024, 4:22:55 PM
    Author     : markx-dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts</title>
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
    </head>
    <body>
        <div class="container">
            <h2>Add New Account</h2>
            <form action="account" method="POST">
                <label for="account">Account</label>
                <input type="text" id="account" name="account" placeholder="Enter username" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter password" required>

                <label for="lastName">Last name</label>
                <input type="text" id="lastName" name="lastName" placeholder="Last name" required>

                <label for="firstName">First name</label>
                <input type="text" id="firstName" name="firstName" placeholder="First name" required>

                <label for="phoneNumber">Phone number</label>
                <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Phone number" required>

                <label for="birthDay">Birth day</label>
                <input type="date" id="birthDay" name="birthDay" required>

                <label>Gender</label>
                <div class="gender-container">
                    <label>
                        <input type="radio" name="gender" value="male" required> Male
                    </label>
                    <label>
                        <input type="radio" name="gender" value="female" required> Female
                    </label>
                </div>

                <label for="role">Role in system</label>
                <select id="role" name="role" required>
                    <option value="administrator">Administrator</option>
                    <option value="user">User</option>
                </select>

                <div class="checkbox-container">
                    <input type="checkbox" id="isActive" name="isActive">
                    <label for="isActive">Is active</label>
                </div>

                <button type="submit" class="submit-button" name="action" value="add">Submit</button>
            </form>
            <h1>${requestScope.message}</h1>

        </div>
    </body>
</html>
