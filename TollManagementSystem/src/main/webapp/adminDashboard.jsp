<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
            background-image: url("vehicles.jpg");
        }
        
        h1 {
            text-align: center;
            color: #333;
        }
        
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 0 auto;
        }
        
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        
        button {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        
        button:hover {
            background-color: #45a049;
        }
        
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>
    
    <form action="vehicleServlet" method="post">
        <label for="vehicleRegistrationNumber">Vehicle Registration Number:</label>
        <input type="text" id="vehicleRegistrationNumber" name="vehicleRegistrationNumber" required>
        
        <label for="vehicleType">Vehicle Type:</label>
        <select id="vehicleType" name="vehicleType" required>
            <option value="">Select Vehicle Type</option>
            <option value="Bike">Bike</option>
            <option value="car">Car</option>
            <option value="truck">Truck</option>
            <option value="bus">Bus</option>
        </select>
        
        <label for="color">Color:</label>
        <input type="text" id="color" name="color" required>
        
        <label for="tollAmount">Toll Amount:</label>
        <select id="tollAmount" name="tollAmount" required>
            <option value="">Select Amount</option>
            <option value=100>100</option>
            <option value=200>200</option>
            <option value=300>300</option>
            <option value=400>400</option>
        </select>
        
        <div class="button-container">
            <button type="submit">Submit</button>
        </div>
    </form>
    
    <div class="button-container">
        <button onclick="window.location.href='viewEntries.jsp'">View Entries</button>
    </div>
</body>
</html>