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

@WebServlet("/orderServlet")
public class orderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] itemNames = {"Margherita Pizza", "Cheese Burger", "Sushi Platter", "Italian Pasta", "Greek Salad"};
        double[] itemPrices = {8.99, 6.49, 12.99, 9.99, 7.49};
        int[] quantities = {
            Integer.parseInt(request.getParameter("quantity_pizza")),
            Integer.parseInt(request.getParameter("quantity_burger")),
            Integer.parseInt(request.getParameter("quantity_sushi")),
            Integer.parseInt(request.getParameter("quantity_pasta")),
            Integer.parseInt(request.getParameter("quantity_salad"))
        };

        Connection conn = null;
        PreparedStatement statement = null;

        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "admin123");

            // Prepare the SQL statement to insert the order data
            String sql = "INSERT INTO Orders (item_name, quantity, price) VALUES (?, ?, ?)";
            statement = conn.prepareStatement(sql);

            for (int i = 0; i < itemNames.length; i++) {
                if (quantities[i] > 0) {
                    statement.setString(1, itemNames[i]);
                    statement.setInt(2, quantities[i]);
                    statement.setDouble(3, itemPrices[i]);
                    statement.addBatch();
                }
            }

            // Execute the batch insert
            int[] rowsInserted = statement.executeBatch();

            if (rowsInserted.length > 0) {
                // Redirect to billing page
                request.getRequestDispatcher("confirmord.jsp").forward(request, response);
            } else {
                // Order failed, display an error message
                request.setAttribute("error", "Order failed. Please try again.");
                request.getRequestDispatcher("welcomedash.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("userRegister.jsp").forward(request, response);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
