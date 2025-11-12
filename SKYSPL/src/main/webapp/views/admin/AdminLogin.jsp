<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login | Skyspl</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74b9ff, #0984e3);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }




    .container {
        width: 380px;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        padding: 40px 30px;
        transition: all 0.3s ease;
    }


    .container:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
    }


    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
        font-size: 24px;
    }


    label {
        display: block;
        margin-top: 15px;
        color: #444;
        font-weight: 500;
    }


    input {
        width: 100%;
        padding: 10px 12px;
        margin-top: 6px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 15px;
        outline: none;
        transition: 0.2s;
    }


    input:focus {
        border-color: #0984e3;
        box-shadow: 0 0 4px #74b9ff;
    }


    button {
        width: 100%;
        padding: 12px;
        margin-top: 25px;
        background: #0984e3;
        border: none;
        color: #fff;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }


    button:hover {
        background: #74b9ff;
    }


    .error {
        color: #e74c3c;
        background: #ffeaea;
        border: 1px solid #e74c3c;
        padding: 8px;
        text-align: center;
        border-radius: 5px;
        margin-top: 15px;
    }


    .footer {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
        color: #555;
    }


    .footer a {
        color: #0984e3;
        text-decoration: none;
        font-weight: 500;
    }


    .footer a:hover {
        text-decoration: underline;
    }
</style>




</head>
<body>
<div class="container">
    <h2>Admin Login</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <label>Username:</label>
        <input type="text" name="username" placeholder="Enter your username" required />




    <label>Password:</label>
    <input type="password" name="password" placeholder="Enter your password" required />
   
    <button type="submit">Login</button>
</form>


<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>


<div class="footer">
    <p>New Admin? <a href="${pageContext.request.contextPath}/register">Register Here</a></p>
    <p><a href="${pageContext.request.contextPath}/">Back to Home</a></p>
</div>




</div>
</body>
</html>



