<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>AI Gym & Health Dashboard</title>
  <link rel="stylesheet" href="/css/Home.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  
</head>
<body>

  <div class="quote">
    "Push yourself, because no one else is going to do it for you."
  </div>

  <main class="grid-container">
    <!-- AI Diet Plan -->
    <div class="feature-card" onclick="location.href='/dashboard/aiDiet'">
      <i class="fas fa-utensils icon"></i>
      <h2>AI Diet Plan</h2>
      <p>Personalized meal plans for your body goals</p>
    </div>

    <!-- Supplements -->
    <div class="feature-card" onclick="location.href='/dashboard/supplement'">
      <i class="fas fa-pills icon"></i>
      <h2>Supplements</h2>
      <p>Top budget picks just for you</p>
    </div>

    <!-- Progress Tracker -->
    <div class="feature-card" onclick="location.href='/dashboard/progress'">
      <i class="fas fa-camera icon"></i>
      <h2>Progress Tracker</h2>
      <p>Upload and monitor your fitness journey</p>
    </div>

    <!-- Health Tips -->
    <div class="feature-card" onclick="location.href='/dashboard/healthTips'">
      <i class="fas fa-heartbeat icon"></i>
      <h2>Health Tips</h2>
      <p>AI-generated wellness insights</p>
    </div>

    <!-- Workout Guide -->
    <div class="feature-card" onclick="location.href='dashboard/WorkoutSuggest'">
      <i class="fas fa-dumbbell icon"></i>
      <h2>Workout Guide</h2>
      <p>Smart exercise suggestions with videos</p>
    </div>

    <!-- BMI Calculator -->
    <div class="feature-card" onclick="location.href='bmi'">
      <i class="fas fa-weight icon"></i>
      <h2>BMI Calculator</h2>
      <p>Check your body mass index instantly</p>
    </div>

    <!-- Weight Loss Tips -->
    <div class="feature-card" onclick="location.href='dashboard/waterIntake'">
      <i class="fas fa-water icon"></i>
      <h2> WaterIntake Calculator</h2>
      <p>Calculate Your WaterIntake in Easy Way</p>
    </div>

    <!-- Weight Gain Tips -->
    <div class="feature-card" onclick="location.href='/dashboard/chatbot'">
      <i class="fas fa-ai"></i>
      <h2>Ask AI</h2>
      <p>Ask Anything About Health</p>
    </div>
    <div class="feature-card" onclick="location.href='bmi-history'">
      <i class="fas fa-history "></i>
      <h2>BMI History</h2>
      <p>Grab Ai-based Diet Based on your BMI</p>
    </div>
    
  </main>
</body>
</html>
<%@ include file="footer.jsp" %>
