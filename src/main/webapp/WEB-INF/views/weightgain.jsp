
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
  superfoods.add(new Food("Eggs", 13.0, "/images/eggs.jpg"));
  superfoods.add(new Food("Chicken Breast", 31.0, "/images/chicken.jpg"));
  superfoods.add(new Food("Paneer", 18.0, "/images/paneer.jpg"));
  superfoods.add(new Food("Tofu", 8.0, "/images/tofu.jpg"));
  superfoods.add(new Food("Greek Yogurt", 10.0, "/images/yogurt.jpg"));
  superfoods.add(new Food("Milk", 3.4, "/images/milk.jpg"));
  superfoods.add(new Food("Lentils (Dal)", 9.0, "/images/lentils.jpg"));
  superfoods.add(new Food("Almonds", 21.0, "/images/almonds.jpg"));
  superfoods.add(new Food("Peanuts", 25.0, "/images/peanuts.jpg"));
  superfoods.add(new Food("Chickpeas", 19.0, "/images/chickpeas.jpg"));
  superfoods.add(new Food("Soya Chunks", 52.0, "/images/soya.jpg"));
  superfoods.add(new Food("Quinoa", 14.0, "/images/quinoa.jpg"));
  superfoods.add(new Food("Whey Protein", 80.0, "/images/whey.jpg"));
  superfoods.add(new Food("Fish (Salmon)", 20.0, "/images/salmon.jpg"));
  superfoods.add(new Food("Beef", 26.0, "/images/beef.jpg"));
  superfoods.add(new Food("Pumpkin Seeds", 19.0, "/images/pumpkin.jpg"));
  superfoods.add(new Food("Sunflower Seeds", 21.0, "/images/sunflower.jpg"));
  superfoods.add(new Food("Oats", 11.0, "/images/oats.jpg"));
  superfoods.add(new Food("Brown Rice", 2.6, "/images/rice.jpg"));
  superfoods.add(new Food("Cheese", 25.0, "/images/cheese.jpg"));

  request.setAttribute("superfoods", superfoods);
%>

<!DOCTYPE html>
<html>
<head>
  <title>Weight Gain Guide | FitAI</title>
  <link rel="stylesheet" href="/css/guied.css">
</head>
<body>

  <div class="container">
    <h1> Weight Gain Guide</h1>
    <p class="intro">
      Struggling to gain weight? Here's a complete guide to help you bulk up in a healthy and sustainable way.
    </p>

    <h2> Top 5 Weight Gain Tips:</h2>
    <ul class="tips-list">
      <li> Eat more calories than you burn daily (caloric surplus).</li>
      <li> Focus on protein-rich foods like eggs, chicken, tofu, and dairy.</li>
      <li> Don’t skip meals — eat 5–6 times a day including snacks.</li>
      <li> Train heavy — compound exercises (squat, bench, deadlift).</li>
      <li> Sleep at least 7–8 hours every night to aid muscle recovery.</li>
    </ul>

    <h2> Sample High-Calorie Diet Plan:</h2>
    <table class="diet-table">
      <tr><th>Meal</th><th>Items</th></tr>
      <tr><td>Breakfast</td><td>Oats + Banana + Peanut Butter + Milk</td></tr>
      <tr><td>Snack</td><td>Dry Fruits + Protein Shake</td></tr>
      <tr><td>Lunch</td><td>Rice + Chicken Curry + Boiled Eggs + Salad</td></tr>
      <tr><td>Evening</td><td>Banana Shake + Nuts</td></tr>
      <tr><td>Dinner</td><td>Chapati + Paneer/Chicken + Vegetables</td></tr>
    </table>

    <h2> Motivation Video:</h2>
    <video width="480" controls>
      <source src="/videos/weightgain.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>

    <h2> Bonus Tips:</h2>
    <ul>
      <li>Track your weight weekly and progress in the gym.</li>
      <li>Use mass gainers only if you're unable to meet calorie goals.</li>
      <li>Stay consistent — weight gain takes time.</li>
    </ul>

    <h2> Top 20 Protein-Rich Superfoods (per 100g)</h2>
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

    <h2> Common Mistakes in Weight Gain:</h2>
    <ul class="tips-list">
      <li> Relying only on junk food — leads to fat, not muscle</li>
      <li> Inconsistent meal timing</li>
      <li> Not tracking calories and macros</li>
      <li> Skipping workouts or recovery</li>
    </ul>

    <h2> Why Weight Gain is Important for Some:</h2>
    <p class="intro">
      For underweight individuals, healthy weight gain improves energy levels, immunity, physical appearance, and overall well-being. But always focus on <strong>lean muscle gain</strong> over fat gain.
    </p>
  </div>

</body>
</html>
<%@ include file="footer.jsp" %>