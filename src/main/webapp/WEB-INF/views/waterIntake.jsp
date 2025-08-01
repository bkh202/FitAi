<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<%@ page import="java.text.DecimalFormat" %>
<html>
<head>
    <title>💧 Water Intake Calculator - FitAI</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/waterIntake.css">
</head>
<body>
<main>
    <div class="water-intake-container">
        <h2>💧 Daily Water Intake Calculator</h2>
        <form action="/dashboard/water-intake" method="post" class="water-form">
            <label for="weight">Your Weight (kg):</label>
            <input type="number" name="weight" id="weight" required placeholder="e.g. 65">

            <label for="gender">Gender:</label>
            <select name="gender" id="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>

            <label for="activity">Activity Level:</label>
            <select name="activity" id="activity">
                <option value="low">Low</option>
                <option value="moderate">Moderate</option>
                <option value="high">High</option>
            </select>

            <label for="climate">Climate:</label>
            <select name="climate" id="climate">
                <option value="normal">Normal</option>
                <option value="hot">Hot</option>
            </select>

            <button type="submit">💧 Calculate Intake</button>
        </form>

        <%-- Show Result if present --%>
        <%
            Double intake = (Double) request.getAttribute("waterIntake");
            if (intake != null) {
                DecimalFormat df = new DecimalFormat("#.##");
        %>
            <div class="result-box">
                <h3>✅ Your Recommended Daily Water Intake:</h3>
                <p><strong><%= df.format(intake) %> Liters</strong> per day</p>

                <div class="tips">
                    <h4>💡 Hydration Tips:</h4>
                    <ul>
                        <li>Start your day with a glass of water.</li>
                        <li>Carry a reusable water bottle with you.</li>
                        <li>Drink before you're thirsty.</li>
                        <li>Eat water-rich foods like cucumber & watermelon.</li>
                        <li>Set hourly water reminders.</li>
                    </ul>
                </div>
            </div>
        <%
            }
        %>
    </div>
</main>
<%@ include file="footer.jsp" %>
</body>
</html>
