import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderInfoServlet")
public class orderInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String address = request.getParameter("address");
        String mobileNumber = request.getParameter("mobile");
        int orderId = 1; // Replace with the actual order ID

        try {
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/onlinefood";
            String username = "root";
            String password = "admin123";

            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            Connection connection = DriverManager.getConnection(url, username, password);

            // Prepare the SQL statement
            String sql = "INSERT INTO OrderInfo (order_id, address, mobile) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, orderId);
            statement.setString(2, address);
            statement.setString(3, mobileNumber);

            // Execute the SQL statement
            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                // Order information stored successfully
            	request.getRequestDispatcher("thankyou.jsp").forward(request, response);
                response.getWriter().println("Order information stored successfully.");
            } else {
                // Failed to store order information
                response.getWriter().println("Failed to store order information.");
            }

            // Close the database resources
            statement.close();
            connection.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}