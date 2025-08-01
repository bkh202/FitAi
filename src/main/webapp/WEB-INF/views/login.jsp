<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login | FitAI</title>
  <link rel="stylesheet" href="css/auth.css">
</head>
<body>

<div class="auth-container">
  <h2>Login to <span>FitAI</span></h2>
  <form action="login" method="post" class="auth-form">
    <input type="email" name="email" placeholder="Email" required />
    <input type="password" name="password" placeholder="Password" required />
    <button type="submit">Login</button>
    <p class="msg">${msg}</p>
    <p class="switch">Don't have an account? <a href="signup">Sign up</a></p>
  </form>
</div>

</body>
</html>
<%@ include file="footer.jsp" %>
