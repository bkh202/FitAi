<%@ page import="java.util.*,java.io.*" %>
<%@ include file="header.jsp" %>
<%
  class Food {
    public String name, img;
    public String benefit;
    public Food(String name, String benefit, String img) {
      this.name = name; this.benefit = benefit; this.img = img;
    }
  }

  List<Food> superfoods = new ArrayList<>();
  superfoods.add(new Food("Turmeric", "Anti-inflammatory and antioxidant", "/images/turmeric.jpg"));
  superfoods.add(new Food("Garlic", "Boosts immunity and reduces blood pressure", "/images/garlic.jpg"));
  superfoods.add(new Food("Spinach", "Rich in iron and antioxidants", "/images/spinach.jpg"));
  superfoods.add(new Food("Blueberries", "High in antioxidants", "/images/berries.jpg"));
  superfoods.add(new Food("Green Tea", "Improves brain function and fat metabolism", "/images/greentea.jpg"));
  superfoods.add(new Food("Citrus Fruits", "High in Vitamin C for immune support", "/images/orange.jpg"));
  superfoods.add(new Food("Yogurt", "Good for gut health and immunity", "/images/yogurt.jpg"));
  superfoods.add(new Food("Almonds", "Healthy fats and vitamin E", "/images/almonds.jpg"));
  superfoods.add(new Food("Oats", "Helps regulate cholesterol", "/images/oats.jpg"));
  superfoods.add(new Food("Watermelon", "Keeps you hydrated", "/images/watermelon.jpg"));

  request.setAttribute("superfoods", superfoods);
%>

<!DOCTYPE html>
<html>
<head>
  <title>General Health Guide | FitAI</title>
  <link rel="stylesheet" href="/css/guied.css">
</head>
<body>

<div class="container">
  <h1> General Health Guide</h1>
  <p class="intro">
    Maintaining good health isn’t complicated. It’s about consistency, balance, and smart choices. Here's your complete guide to daily wellness.
  </p>

  <h2>🌿 Daily Healthy Habits:</h2>
  <ul class="tips-list">
    <li> Drink at least 2–3 liters of water daily.</li>
    <li> Sleep 7–8 hours every night.</li>
    <li> Eat seasonal fruits and vegetables daily.</li>
    <li> Do 30 minutes of physical activity or walking.</li>
    <li> Avoid processed food and sugary drinks.</li>
  </ul>

  <h2>🍽️ Sample Balanced Diet Plan:</h2>
  <table class="diet-table">
    <tr><th>Meal</th><th>Items</th></tr>
    <tr><td>Breakfast</td><td>Oats + Banana + Almonds + Green Tea</td></tr>
    <tr><td>Snack</td><td>Fruit Bowl + Yogurt</td></tr>
    <tr><td>Lunch</td><td>Chapati + Dal + Veg Curry + Salad</td></tr>
    <tr><td>Evening</td><td>Buttermilk + Roasted Chana</td></tr>
    <tr><td>Dinner</td><td>Khichdi + Steamed Veggies</td></tr>
  </table>

  <h2>🎥 Health Motivation Video:</h2>
  <div class="video-section">
    <video width="480" controls>
      <source src="/videos/healthmotivation.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>
  </div>

  <h2>🛡️ Top 10 Superfoods for Overall Health:</h2>
  <div class="superfoods-grid">
    <%
      for (Food food : superfoods) {
    %>
      <div class="superfood-card">
        <img src="<%= food.img %>" alt="<%= food.name %>">
        <h3><%= food.name %></h3>
        <p><%= food.benefit %></p>
      </div>
    <%
      }
    %>
  </div>

  <h2>❌ Mistakes That Harm Your Health:</h2>
  <ul class="tips-list">
    <li> Skipping meals or overeating at night.</li>
    <li> Lack of sleep and high screen time.</li>
    <li> Sedentary lifestyle (no movement).</li>
    <li> Ignoring mental health and stress management.</li>
  </ul>

  <h2>✅ Final Advice:</h2>
  <p class="intro">
    Good health is a lifelong investment. Start small, be consistent, and keep learning what works for your body. Your future self will thank you!
  </p>
</div>

</body>
</html>
<%@ include file="footer.jsp" %>
