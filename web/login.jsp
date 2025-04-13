<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        /* Căn giữa toàn bộ trang */
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Container của form */
        .login-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
        }

        /* Tiêu đề */
        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Thông báo lỗi */
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        /* Ô nhập */
        input {
            width: 90%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }

        /* Nút login */
        input[type="submit"] {
            background: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Login</h2>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
        <p class="error-message"><%= error%></p>
        <%
            }
        %>

        <form action="login" method="POST">
            <input type="text" name="account" placeholder="Username" />
            <input type="password" name="password" placeholder="Password" />
            <input type="submit" value="Login" name="action" />
        </form>
    </div>
        

</body>
</html>
