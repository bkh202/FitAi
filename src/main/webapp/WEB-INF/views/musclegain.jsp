<%@ page import="java.util.*,java.io.*" %>
<%@ include file="header.jsp" %>
<%
  class Food {
    public String name, img;
    public double protein;
    public Food(String name, double protein, String img) {
      this.name = name; this.protein = protein; this.img = img;
    }
  }

  List<Food> superfoods = new ArrayList<>();
  superfoods.add(new Food("Chicken Breast", 31.0, "/images/chicken.jpg"));
  superfoods.add(new Food("Eggs", 13.0, "/images/eggs.jpg"));
  superfoods.add(new Food("Whey Protein", 80.0, "/images/whey.jpg"));
  superfoods.add(new Food("Tofu", 8.0, "/images/tofu.jpg"));
  superfoods.add(new Food("Paneer", 18.0, "/images/paneer.jpg"));
  superfoods.add(new Food("Greek Yogurt", 10.0, "/images/yogurt.jpg"));
  superfoods.add(new Food("Milk", 3.4, "/images/milk.jpg"));
  superfoods.add(new Food("Soya Chunks", 52.0, "/images/soya.jpg"));
  superfoods.add(new Food("Lentils", 9.0, "/images/lentils.jpg"));
  superfoods.add(new Food("Peanuts", 25.0, "/images/peanuts.jpg"));
  superfoods.add(new Food("Salmon", 20.0, "/images/salmon.jpg"));
  superfoods.add(new Food("Quinoa", 14.0, "/images/quinoa.jpg"));
  superfoods.add(new Food("Almonds", 21.0, "/images/almonds.jpg"));
  superfoods.add(new Food("Pumpkin Seeds", 19.0, "/images/pumpkin.jpg"));
  superfoods.add(new Food("Beef", 26.0, "/images/beef.jpg"));
  superfoods.add(new Food("Cheese", 25.0, "/images/cheese.jpg"));
  superfoods.add(new Food("Chickpeas", 19.0, "/images/chickpeas.jpg"));
  superfoods.add(new Food("Brown Rice", 2.6, "/images/rice.jpg"));
  superfoods.add(new Food("Oats", 11.0, "/images/oats.jpg"));
  superfoods.add(new Food("Sunflower Seeds", 21.0, "/images/sunflower.jpg"));

  request.setAttribute("superfoods", superfoods);
%>

<!DOCTYPE html>
<html>
<head>
  <title>Muscle Gain Guide | FitAI</title>
  <link rel="stylesheet" href="/css/guied.css">
</head>
<body>

<div class="container">
  <h1> Muscle Gain Guide</h1>
  <p class="intro">
    Want to build strong muscles naturally? Follow this science-backed guide to gain lean muscle mass effectively.
  </p>

  <h2>💪 Top 5 Muscle Building Tips:</h2>
  <ul class="tips-list">
    <li> Follow a calorie surplus — eat more than you burn.</li>
    <li> Prioritize high-quality protein in every meal.</li>
    <li> Train with progressive overload — lift heavier over time.</li>
    <li> Don’t neglect sleep and recovery.</li>
    <li> Stay consistent with nutrition + training.</li>
  </ul>

  <h2> 🥗 Sample Muscle Gain Diet Plan:</h2>
  <table class="diet-table">
    <tr><th>Meal</th><th>Items</th></tr>
    <tr><td>Breakfast</td><td>Oats + Milk + Eggs + Banana</td></tr>
    <tr><td>Snack</td><td>Protein Shake + Almonds</td></tr>
    <tr><td>Lunch</td><td>Rice + Chicken + Dal + Salad</td></tr>
    <tr><td>Evening</td><td>Tofu/Paneer Sandwich + Peanut Butter</td></tr>
    <tr><td>Dinner</td><td>Chapati + Soya/Chicken + Mixed Veggies</td></tr>
  </table>

  <h2>🔥 Motivation Video:</h2>
  <div class="video-section">
    <video width="480" controls>
      <source src="/videos/musclegain.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>
  </div>

  <h2>🥜 20 Superfoods for Muscle Gain (per 100g)</h2>
  <div class="superfoods-grid">
    <%
      for (Food food : superfoods) {
    %>
      <div class="superfood-card">
        <img src="<%= food.img %>" alt="<%= food.name %>">
        <h3><%= food.name %></h3>
        <p>Protein: <strong><%= food.protein %>g</strong> / 100g</p>
      </div>
    <%
      }
    %>
  </div>

  <h2>⚠️ Avoid These Mistakes:</h2>
  <ul class="tips-list">
    <li> Skipping meals or protein intake.</li>
    <li> Training without proper form or overload.</li>
    <li> Not tracking progress (diet or workouts).</li>
    <li> Ignoring recovery — rest is when growth happens.</li>
  </ul>

  <h2>🚀 Long-Term Strategy:</h2>
  <p class="intro">
    Muscle building takes patience and discipline. Stick to the plan, stay motivated, and enjoy the transformation.
  </p>
</div>

</body>
</html>
<%@ include file="footer.jsp" %>
