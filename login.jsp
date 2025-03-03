<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            display: flex;
            height: 100vh;
        }
        
        .container {
            display: flex;
            width: 100%;
            height: 100%;
        }

        /* Left side with image */
        .left {
            flex: 1;
            background: url('assets/login.jpg') no-repeat center center/cover; /* Replace with your image */
        }

        /* Right side with login form */
        .right {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f4;
        }

        .login-box {
            background-color: white;
            padding: 40px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .login-box h2 {
            margin-bottom: 20px;
            font-size: 24px;
            text-align: center;
        }

        .login-box input[type="text"], 
        .login-box input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-box input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .login-box input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Left side (image) -->
        <div class="left"></div>

        <!-- Right side (login form) -->
        <div class="right">
            <div class="login-box">
                <h2>Login</h2>
                <form action="LoginServlet" method="GET">
                    <label for="id">Username:</label>
                    <input type="text" id="id" name="id" placeholder="Enter your username">
                    
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password">
                    
                    <input type="submit" value="Submit">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
