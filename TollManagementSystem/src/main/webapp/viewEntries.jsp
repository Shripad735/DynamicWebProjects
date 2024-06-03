<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vehicle Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #E6E6FA;
            margin: 0;
            padding: 20px;
            text-align: center;
        }
        
        h1 {
            color: #333;
        }
        
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        
        table, th, td {
            border: 2px solid #000000;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
        }
        
        th {
            background-color: #4CAF50;
            color: white;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        tr:hover {
            background-color: #ddd;
        }
        
        .button {
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

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Vehicle Information</h1>
    <table>
        <tr>
            <th>Registration Number</th>
            <th>Vehicle Type</th>
            <th>Color</th>
            <th>Toll Amount</th>
            <th>Entry Date/Time</th>
        </tr>
        <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/toll";
            String username = "root";
            String password = "admin123";
            
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, password);
                stmt = conn.createStatement();
                String sql = "SELECT * FROM vehicle_information";
                rs = stmt.executeQuery(sql);
                
                while (rs.next()) {
                    String regNumber = rs.getString("registration_number");
                    String vehicleType = rs.getString("vehicle_type");
                    String color = rs.getString("color");
                    double tollAmount = rs.getDouble("toll_amount");
                    Timestamp entryDatetime = rs.getTimestamp("entry_datetime");
        %>
        <tr>
            <td><%= regNumber %></td>
            <td><%= vehicleType %></td>
            <td><%= color %></td>
            <td><%= tollAmount %></td>
            <td><%= entryDatetime %></td>
        </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </table>
    <a href="adminDashboard.jsp" class="button">Go to Dashboard</a>
</body>
</html>
