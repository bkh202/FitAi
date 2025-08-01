<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>AI Workout Generator</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AiWorkout.css">
</head>
<body>
    <div class="form-container">
        <h2>💪 AI Workout Generator</h2>
        <form action="generate-workout" method="post">
            <label>Gender:</label>
            <select name="gender" required>
                <option value="">Select</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>

            <label>Fitness Goal:</label>
            <select name="goal" required>
                <option value="">Select</option>
                <option>Muscle Gain</option>
                <option>Fat Loss</option>
                <option>Endurance</option>
            </select>

            <label>Muscle Group:</label>
            <select name="muscleGroup" required>
                <option value="">Select</option>
                <option>Full Body</option>
                <option>Chest</option>
                <option>Back</option>
                <option>Legs</option>
                <option>Arms</option>
                <option>Shoulders</option>
                <option>Core</option>
            </select>

            <label>Level:</label>
            <select name="level" required>
                <option value="">Select</option>
                <option>Beginner</option>
                <option>Intermediate</option>
                <option>Advanced</option>
            </select>

            <label>Available Equipment:</label>
            <select name="equipment" required>
                <option value="">Select</option>
                <option>Bodyweight Only</option>
                <option>Dumbbells</option>
                <option>Resistance Bands</option>
                <option>Gym Machines</option>
                <option>Mixed Equipment</option>
            </select>

            <button type="submit" class="btn">Generate Workout</button>
        </form>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
