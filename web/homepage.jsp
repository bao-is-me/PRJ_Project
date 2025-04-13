<%-- 
    Document   : homepage
    Created on : Mar 13, 2025, 1:47:49 PM
    Author     : 12345
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    <div class="logout-button">
        <a href="login.jsp">Logout</a>
    </div>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            margin: 50px;
        }

        form {
            display: flex;
            justify-content: center;
            gap: 10px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        input[type="submit"]:active {
            transform: scale(0.98);
        }

        .logout-button {
    display: inline-block;
    color: white;
    background-color: #0000ff;
    padding: 10px 15px;
    text-decoration: none;
    font-weight: bold;
    border-radius: 5px;
    position: absolute;
    top: 10px;
    right: 10px;
        cursor: pointer;

}


    </style>
</head>
<body>
    <!--        <h2>
                <a href="index.html">ProductIntro</a>
            </h2><br>-->


    <form action="home">

        <input type="submit" name="action" value="Product List" />
        <input type="submit" name="action" value="Discounted Product List" />
        <input type="submit" name="action" value="Un_Discounted Product List" />
    </form>
</body>
</html>
