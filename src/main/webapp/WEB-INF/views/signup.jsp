<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup | FitAI</title>
<link rel="stylesheet" href="css/auth.css">
</head>
<body>

	<div class="auth-container">
		<h2>
			Create Your <span>FitAI</span> Account
		</h2>
		<form action="signup" method="post" class="auth-form">
			<input type="text" name="name" placeholder="Full Name" required /> <input
				type="email" name="email" placeholder="Email" required /> <input
				type="password" name="password" placeholder="Password" required />
		       <input type="number" name="age" placeholder="Age" required min="10" />

			<label>Gender:</label> <select name="gender" required>
				<option value="">Select</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				<option value="Other">Other</option>
			</select>

			<button type="submit">Sign Up</button>
			<p class="msg">${msg}</p>
			<p class="switch">
				Already have an account? <a href="login">Login</a>
			</p>
		</form>
	</div>

</body>
</html>
<%@ include file="footer.jsp"%>
