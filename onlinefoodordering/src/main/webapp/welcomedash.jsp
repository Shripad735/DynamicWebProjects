<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Delivery</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #0b1527;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .food-item {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin: 15px;
            width: 300px;
            transition: transform 0.3s;
        }

        .food-item:hover {
            transform: scale(1.05);
        }

        .food-item img {
            width: 100%;
            height: 200px; /* Set a fixed height for the images */
            object-fit: cover; /* Ensures the image scales properly */
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        .food-details {
            padding: 15px;
            text-align: center;
        }

        .food-details h3 {
            margin: 0;
            color: #333;
        }

        .food-details p {
            color: #777;
            font-size: 14px;
        }

        .price {
            color: #e91e63;
            font-weight: bold;
            font-size: 18px;
        }

        .quantity-container {
            margin-top: 10px;
        }

        .quantity-container label {
            margin-right: 10px;
        }

        .quantity-container input {
            width: 60px;
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            text-align: center;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .button-container button {
            padding: 10px 20px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .button-container button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>Delicious Food Delivery</h1>
    </div>

    <form action="orderServlet" method="post">
        <div class="container">
            <div class="food-item">
                <img src="food-pizza-wallpaper-preview.jpg" alt="Pizza">
                <div class="food-details">
                    <h3>Margherita Pizza</h3>
                    <p>Classic delight with 100% real mozzarella cheese</p>
                    <p class="price">$8.99</p>
                    <div class="quantity-container">
                        <label for="pizza-quantity">Quantity:</label>
                        <input type="number" id="pizza-quantity" name="quantity_pizza" value="0" min="0">
                    </div>
                </div>
            </div>

            <div class="food-item">
                <img src="BurgerCheese.jpeg" alt="Burger">
                <div class="food-details">
                    <h3>Cheese Burger</h3>
                    <p>Juicy beef patty with melted cheese and fresh lettuce</p>
                    <p class="price">$6.49</p>
                    <div class="quantity-container">
                        <label for="burger-quantity">Quantity:</label>
                        <input type="number" id="burger-quantity" name="quantity_burger" value="0" min="0">
                    </div>
                </div>
            </div>

            <div class="food-item">
                <img src="Susshi.jpeg" alt="Sushi">
                <div class="food-details">
                    <h3>Sushi Platter</h3>
                    <p>Assorted fresh sushi with wasabi and soy sauce</p>
                    <p class="price">$12.99</p>
                    <div class="quantity-container">
                        <label for="sushi-quantity">Quantity:</label>
                        <input type="number" id="sushi-quantity" name="quantity_sushi" value="0" min="0">
                    </div>
                </div>
            </div>

            <div class="food-item">
                <img src="pasta.jpeg" alt="Pasta">
                <div class="food-details">
                    <h3>Italian Pasta</h3>
                    <p>Classic Italian pasta with creamy sauce and bacon</p>
                    <p class="price">$9.99</p>
                    <div class="quantity-container">
                        <label for="pasta-quantity">Quantity:</label>
                        <input type="number" id="pasta-quantity" name="quantity_pasta" value="0" min="0">
                    </div>
                </div>
            </div>

            <div class="food-item">
                <img src="greek-salad.jpg" alt="Salad">
                <div class="food-details">
                    <h3>Greek Salad</h3>
                    <p>Fresh vegetables with feta cheese and olives</p>
                    <p class="price">$7.49</p>
                    <div class="quantity-container">
                        <label for="salad-quantity">Quantity:</label>
                        <input type="number" id="salad-quantity" name="quantity_salad" value="0" min="0">
                    </div>
                </div>
            </div>
        </div>

        <div class="button-container">
            <button type="submit">Confirm Order</button>
        </div>
    </form>

</body>
</html>
