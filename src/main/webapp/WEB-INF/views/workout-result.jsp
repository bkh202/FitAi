<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="org.json.JSONArray, org.json.JSONObject"%>
<%@ include file="header.jsp"%>
<html>
<head>
<title>Workout Plan</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/workoutResult.css">
</head>
<body>
	<div class="result-container">
		<h2>🏋️ Your AI Workout Plan</h2>

		<%
		String responses = (String) request.getAttribute("aiResponse");

		if (responses != null) {
			try {
				JSONArray arr = new JSONArray(responses);
				for (int i = 0; i < arr.length(); i++) {
			JSONObject ex = arr.getJSONObject(i);
		%>
		<div class="exercise-card">

			<div class="exercise-info">
				<h3><%=ex.getString("exercise")%></h3>
				<p><%=ex.getString("description")%></p>
				<p>
					<strong>Level:</strong>
					<%=ex.getString("level")%></p>

			</div>
		</div>
		<%
		}
		} catch (Exception e) {
		%>
		<p class="error">
			⚠️ Failed to parse AI response:
			<%=e.getMessage()%></p>
		<%
		}
		} else {
		%>
		<p class="error">⚠️ No workout plan received. Please try again.</p>
		<%
		}
		%>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
