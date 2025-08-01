
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  String goal = request.getParameter("goal");
  String goalText = goal.equals("weightgain") ? "Weight Gain" :
                    goal.equals("fatloss") ? "Fat Loss" :
                    goal.equals("musclegain") ? "Muscle Gain" : "General Health";
%>
<html>
<head>
  <title><%= goalText %> Tips | FitAI</title>
  <link rel="stylesheet" href="/css/healthTips.css">
</head>
<body>
  <div class="health-main">
    <h2>🧠 AI Tips for <%= goalText %></h2>
    <div id="spinner">⚙️ Generating Tips...</div>
    <div id="tips-output"></div>

    <div class="media-box">
      <img src="/images/<%=goal%>.jpg" alt="<%=goalText%>" class="goal-image" />
      <video src="/videos/<%=goal%>.mp4" controls autoplay muted loop class="goal-video"></video>
    </div>
  </div>

  <script>
    fetch("/getHealthTips", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ goal: "<%= goalText %>" })
    })
    .then(res => res.json())
    .then(data => {
      document.getElementById("spinner").style.display = "none";
      const tips = data.tips;
      tips.forEach((tip, i) => {
        const div = document.createElement("div");
        div.className = "tip-card";
        div.innerHTML = `<strong>Tip ${i+1}:</strong> ${tip}`;
        document.getElementById("tips-output").appendChild(div);
      });
    });
  </script>
</body>
</html>
