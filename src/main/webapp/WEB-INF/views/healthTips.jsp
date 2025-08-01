<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
  <title>AI Health Tips | FitAI</title>
  <link rel="stylesheet" href="/css/healthTips.css">
</head>
<body>
  <div class="health-main">
    <h2>🧠 Choose Your Health Goal</h2>

    <div class="cards-container">
      <div class="goal-card" onclick="goToTips('weightgain')">⚖️<br>Weight Gain</div>
      <div class="goal-card" onclick="goToTips('fatloss')">🔥<br>Fat Loss</div>
      <div class="goal-card" onclick="goToTips('musclegain')">💪<br>Muscle Gain</div>
      <div class="goal-card" onclick="goToTips('general')">🧘<br>General Health</div>
    </div>
  </div>

  <script>
  function goToTips(goal) {
	  window.location.href = '/dashboard/healthTips?goal=' + goal;
	}

  </script>
</body>
</html>
<%@ include file="footer.jsp" %>