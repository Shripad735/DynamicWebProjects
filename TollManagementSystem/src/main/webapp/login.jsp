<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url("toll.png");
            background-size: cover;
        }

        .container {
            max-width: 800px;
            width: 500px;
            padding: 40px;
            background-color: #a2b8f1;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
            border: 2px solid #333;
            border-style: double;
        }

        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Optional: This will center the button vertically in the middle of the viewport. */
        }

        button {
            padding: 5px 10px; /* Smaller padding for a smaller button */
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px; /* Smaller font size for a smaller button */
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        .alert {
            color: red;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Login</h1>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="email">Email:</label>
                <br /><br />
                <input type="email" id="email" name="email" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <br /><br />
                <input type="password" id="password" name="password" required />
            </div>
            <br />
            <button type="submit" style="margin-right: 80%">Login </button>
        </form>
        <br/>
        <a href="Registration.jsp">Register Here!</a>
    </div>
</body>
</html>