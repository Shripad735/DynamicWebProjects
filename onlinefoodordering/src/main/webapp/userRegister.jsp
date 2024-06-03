<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Food Order</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #87feee;
        margin: 0;
        padding: 5px;
        background-image: url("FOOD_BG.jpg");
      }

      .container {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      h1 {
        text-align: center;
        color: #6CB4EE;
      }

      /* Form Styles */
      form {
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      .form-group {
        width: 100%;
        margin-bottom: 20px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
      }

      label {
        font-weight: bold;
        margin-bottom: 5px;
      }

      input,
      select {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
        width: 100%;
        border: 1px solid #333;
        border-style: dashed;
      }

      input[type="number"]::-webkit-inner-spin-button,
      input[type="number"]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
      }

      button {
        padding: 10px 20px;
        background-color: #6CB4EE;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
      }

      button:hover {
        background-color: #45a049;
      }

      .form-group .error {
        color: red;
        font-size: 12px;
      }

      .form-buttons {
        display: flex;
        justify-content: center;
        gap: 10px;
        width: 100%;
      }
    </style>
  </head>
  <body>
    <script>
      document.getElementById("password").addEventListener("input", function () {
        var pattern = new RegExp(this.pattern);
        var errorElement = document.getElementById("password-error");
        if (this.value.length >= 8 && pattern.test(this.value)) {
          errorElement.textContent = "";
        } else {
          errorElement.textContent =
            "Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be at least 8 characters long.";
        }
      });

      function resetForm() {
        document.getElementById("registration-form").reset();
      }
    </script>
    <div class="container">
      <h1>User Registration</h1>
      <form id="registration-form" action="RegisterServlet" method="post">
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" id="name" name="name" required />
        </div>
        <div class="form-group">
          <label for="age">Age:</label>
          <select id="age" name="age" required>
            <% for (int i = 1; i <= 100; i++) { %>
              <option value="<%= i %>"><%= i %></option>
            <% } %>
          </select>
        </div>
        <div class="form-group">
          <label for="mobile">Mobile No:</label>
          <input type="text" id="mobile" name="mobile" pattern="\d{10}" title="Mobile number must be 10 digits" required />
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required />
        </div>
        <div class="form-group">
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" required
                 pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                 title="Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be at least 8 characters long." />
        </div>
        <div class="error" id="password-error"></div>
        <div class="form-buttons">
          <button type="submit">Register</button>
          <button type="button" onclick="resetForm()">Reset</button>
        </div>
      </form>
    </div>
  </body>
</html>
