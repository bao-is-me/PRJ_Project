<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        nav {
            display: flex;
            align-items: center; /* C?n gi?a theo chi?u d?c */
            justify-content: space-between;
            background: #007BFF; /* Màu xanh d??ng */
            padding: 10px;
        }
        .nav-left {
            display: flex;
        }
        .nav-right {
            margin-left: auto; /* ??y Logout sang ph?i */
        }
        nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 5px;
        }
        nav a:hover {
            background: #0056b3;
        }
        nav a.active {
            background: #ff9800; /* Màu cam khi ???c ch?n */
            font-weight: bold;
        }
    </style>
</head>
<body>

    <nav>
        <div class="nav-left">
            <a href="product">Products</a>
            <a href="account">Accounts</a>
            <a href="category">Categories</a>
        </div>
        <div class="nav-right">
            <a href="login.jsp">Logout</a>
        </div>
    </nav>

    <script>
        const currentLocation = window.location.pathname;
        const links = document.querySelectorAll("nav a");

        links.forEach(link => {
            if (currentLocation.includes(link.getAttribute("href"))) {
                link.classList.add("active");
            }
        });
    </script>

</body>
</html>
