
<%@ include file="header.jsp" %>
<html>
<head>
    <title>AI Workout & Videos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/workoutsuggest.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
   
    <div class="feature-card" onclick="location.href='/aiWorkout'">
      <i class="fas fa-dumbbell icon"></i>
      <h2>Workout Suggestion</h2>
      <p>AI - Exercises Based on your Goal</p>
    </div>

    <div class="feature-card" onclick="location.href='/MuscleGroups'">
      <i class="fas fa-video icon"></i>
      <h2>Workout Videos</h2>
      <p>Videos of the Exercises</p>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>
