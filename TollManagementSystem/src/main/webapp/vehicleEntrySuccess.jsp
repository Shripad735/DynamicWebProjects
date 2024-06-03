<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Entry Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        
        h1 {
            color: #333;
        }
        
        p {
            font-weight: bold;
        }

        .dashboard-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .dashboard-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Vehicle Entry Successful</h1>
    
    <p>Vehicle Registration Number: ${vehicleRegistrationNumber}</p>
    <p>Vehicle Type: ${vehicleType}</p>
    <p>Color: ${color}</p>
    <p>Toll Amount: ${tollAmount}</p>
    <p>Entry Date/Time: ${entryDateTime}</p>

    <a href="adminDashboard.jsp" class="dashboard-button">Go to Dashboard</a>
</body>
</html>