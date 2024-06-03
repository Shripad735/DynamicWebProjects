import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/vehicleServlet")
public class vehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        String vehicleRegistrationNumber = request.getParameter("vehicleRegistrationNumber");
        String vehicleType = request.getParameter("vehicleType");
        String color = request.getParameter("color");
        int tollAmount = Integer.parseInt(request.getParameter("tollAmount"));
        Timestamp entryTime = Timestamp.valueOf(LocalDateTime.now());

        // Database connection details
        String url = "jdbc:mysql://localhost:3306/toll";
        String username = "root";
        String password = "admin123";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Connect to the database
            Connection conn = DriverManager.getConnection(url, username, password);

            // Prepare the SQL statement
            String sql = "INSERT INTO vehicle_information (registration_number, vehicle_type, color, toll_amount, entry_datetime) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, vehicleRegistrationNumber);
            statement.setString(2, vehicleType);
            statement.setString(3, color);
            statement.setInt(4, tollAmount);
            statement.setTimestamp(5, entryTime);

            // Execute the SQL statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                // Redirect to the success page
                request.setAttribute("vehicleRegistrationNumber", vehicleRegistrationNumber);
                request.setAttribute("vehicleType", vehicleType);
                request.setAttribute("color", color);
                request.setAttribute("tollAmount", tollAmount);
                request.setAttribute("entryDateTime", entryTime);
                request.getRequestDispatcher("vehicleEntrySuccess.jsp").forward(request, response);
            } else {
                // Handle insertion failure
                response.getWriter().println("Failed to insert vehicle data.");
            }

            // Close the database connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}