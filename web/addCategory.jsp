<%-- 
    Document   : addCategory
    Created on : Jun 23, 2024, 7:57:34 PM
    Author     : markx-dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add category</title>
        <style>
            h1{
                font-family: sans-serif;
                font-weight: 500;
                font-size: 28px;
            }
            table
            {
                width:400px;
                border-spacing: 10px;
            }
            .label
            {
                font-family: sans-serif;
                font-size: 16px;
                text-align: right;
                font-weight: bold;
            }
            tr td input
            {
                width: 100%;
                padding: 10px;
                margin: 5px 0 5px 0;
                box-sizing: border-box;
            }
            tr td button
            {
                background: white;
                outline:none;
                cursor: pointer;
                border-radius: 5px;
                border: 1px gray solid;
                padding:5px 10px;
            }

            .update {
                display: block;
                margin-top: 10px;
                text-decoration: none;
                font-family: sans-serif;
                font-size: 20px;
                color: red;
                font-weight: bold;
                
            }
        </style>
    </head>
    <body>
        <h1>New category</h1>
        <form action="category" method="POST">
            <table border="0">

                <tbody>
                    <tr>
                        <td class="label">Category name:</td>
                        <td><input name="name" placeholder="Nhóm hàng mới" ></td>
                    </tr>
                    <tr>
                        <td class="label"> memo:</td>
                        <td><textarea name="memo" style="min-width: 400px;min-height: 100px;">Những sản phẩm dành cho du lịch              
                            </textarea></td>
                    </tr>
                    <tr>
                        <td class="label"> </td>
                        <td><button>Submit</button></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a href="/lab/category" class="update">Back</a></td>
                    </tr>
                </tbody>
            </table>

        </form>
        <h1>${requestScope.message}</h1>

    </body>
</html>
