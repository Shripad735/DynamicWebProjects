<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #b4e0e1;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            background: linear-gradient(to right, #f0c8bc, #8feb9b);
            color: white;
        }

        .container {
            color: darkslateblue;
            max-width: 600px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2em;
            margin-bottom: 30px;
        }

        .button-container {
            text-align: center;
        }

        .button-container a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #4caf50;
            color: white;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        .button-container a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Thank You!</h1>
        <p>Your order has been placed successfully.</p>
        <div class="button-container">
            <a href="welcomedash.jsp">Order More !!!</a>
        </div>
    </div>

</body>
</html>
