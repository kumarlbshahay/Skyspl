<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #007bff, #00c6ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }


        .register-container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            width: 380px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }


        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }


        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }


        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s ease;
        }


        input[type="submit"]:hover {
            background-color: #0056b3;
        }


        .error {
            color: red;
            text-align: center;
            font-size: 14px;
        }


        .link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }


        .link a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }


        .link a:hover {
            text-decoration: underline;
        }
    </style>


    <script>
        function validatePasswords() {
            const pass = document.getElementById("password").value;
            const confirm = document.getElementById("confirmPassword").value;
            const errorMsg = document.getElementById("error-msg");


            if (pass !== confirm) {
                errorMsg.textContent = "Passwords do not match!";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>


<div class="register-container">
    <h2>Admin Registration</h2>


    <form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return validatePasswords()">
        <input type="text" name="username" placeholder="Username" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <input type="password" id="confirmPassword" placeholder="Confirm Password" required>
        <p id="error-msg" class="error">
            ${error}
        </p>
        <input type="submit" value="Register">
    </form>


    <div class="link">
        Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a>
    </div>
</div>


</body>
</html>



