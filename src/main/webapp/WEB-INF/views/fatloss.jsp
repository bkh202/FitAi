<%@ include file="header.jsp"%>
<%@ page import="java.util.*,java.io.*"%>

<%
class Food {
	public String name, img;
	public String benefit;

	public Food(String name, String benefit, String img) {
		this.name = name;
		this.benefit = benefit;
		this.img = img;
	}
}

List<Food> superfoods = new ArrayList<>();
superfoods.add(new Food("Oats", "High fiber, keeps you full", "/images/oats.jpg"));
superfoods.add(new Food("Egg Whites", "Low calorie protein", "/images/eggwhites.jpg"));
superfoods.add(new Food("Chicken Breast", "Lean protein", "/images/chicken.jpg"));
superfoods.add(new Food("Greek Yogurt", "Probiotic & high protein", "/images/yogurt.jpg"));
superfoods.add(new Food("Broccoli", "Low cal + fiber-rich", "/images/broccoli.jpg"));
superfoods.add(new Food("Spinach", "Iron + very low cal", "/images/spinach.jpg"));
superfoods.add(new Food("Cottage Cheese", "Slow digesting protein", "/images/paneer.jpg"));
superfoods.add(new Food("Green Tea", "Boosts metabolism", "/images/greentea.jpg"));
superfoods.add(new Food("Avocado", "Healthy fats, keeps hunger away", "/images/avocado.jpg"));
superfoods.add(new Food("Almonds", "Healthy fats + protein", "/images/almonds.jpg"));
superfoods.add(new Food("Chia Seeds", "High fiber, expands in stomach", "/images/chia.jpg"));
superfoods.add(new Food("Apples", "Fiber + hydration", "/images/apple.jpg"));
superfoods.add(new Food("Berries", "Low sugar fruit", "/images/berries.jpg"));
superfoods.add(new Food("Salmon", "Omega-3 + protein", "/images/salmon.jpg"));
superfoods.add(new Food("Sweet Potato", "Complex carbs", "/images/sweetpotato.jpg"));
superfoods.add(new Food("Zucchini", "Very low cal veggie", "/images/zucchini.jpg"));
superfoods.add(new Food("Cucumber", "Almost zero cal", "/images/cucumber.jpg"));
superfoods.add(new Food("Lentils", "Protein + fiber", "/images/lentils.jpg"));
superfoods.add(new Food("Tomatoes", "Hydrating + low cal", "/images/tomato.jpg"));
superfoods.add(new Food("Bell Peppers", "Rich in Vitamin C, low cal", "/images/bellpepper.jpg"));
request.setAttribute("superfoods", superfoods);
%>

<!DOCTYPE html>
<html>
<head>
<title>Fat Loss Guide | FitAI</title>
<link rel="stylesheet" href="/css/guied.css">
</head>
<body>

	<div class="container">
		<h1>Fat Loss Guide</h1>
		<p class="intro">Want to burn fat effectively? Follow this
			scientifically backed guide to lose weight while staying strong and
			energetic.</p>

		<h2>💡 Top 5 Fat Loss Tips:</h2>
		<ul class="tips-list">
			<li>Be in a calorie deficit: Eat fewer calories than you burn.</li>
			<li>Prioritize protein to retain muscle while losing fat.</li>
			<li>Move more — include walking, cardio, and strength training.</li>
			<li>Stay hydrated — water helps suppress appetite.</li>
			<li>Sleep 7–8 hours — poor sleep leads to fat gain hormones.</li>
		</ul>

		<h2>Sample Low-Calorie Fat Loss Diet:</h2>
		<table class="diet-table">
			<tr>
				<th>Meal</th>
				<th>Items</th>
			</tr>
			<tr>
				<td>Breakfast</td>
				<td>Oats + Egg Whites + Green Tea</td>
			</tr>
			<tr>
				<td>Snack</td>
				<td>Apple + Almonds</td>
			</tr>
			<tr>
				<td>Lunch</td>
				<td>Grilled Chicken + Veggies + Salad</td>
			</tr>
			<tr>
				<td>Evening</td>
				<td>Greek Yogurt + Chia Seeds</td>
			</tr>
			<tr>
				<td>Dinner</td>
				<td>Paneer Stir Fry + Steamed Broccoli</td>
			</tr>
		</table>

		<h2>Motivation Video:</h2>
		<div class="video-section">
			<video width="480" controls>
				<source src="/videos/fatloss.mp4" type="video/mp4">
				Your browser does not support the video tag.
			</video>
		</div>


		<h2>20 Superfoods for Fat Loss</h2>
		<div class="superfoods-grid">
			<%
			for (Food food : superfoods) {
			%>
			<div class="superfood-card">
				<img src="<%=food.img%>" alt="<%=food.name%>">
				<h3><%=food.name%></h3>
				<p><%=food.benefit%></p>
			</div>
			<%
			}
			%>
		</div>

		<h2>Avoid These Mistakes:</h2>
		<ul class="tips-list">
			<li>Overdoing cardio and avoiding weights.</li>
			<li>Eating too little — leads to muscle loss.</li>
			<li>Not tracking food intake and calories.</li>
			<li>Expecting fast results without consistency.</li>
		</ul>

		<h2>The Smart Approach:</h2>
		<p class="intro">Fat loss is a marathon, not a sprint. Focus on
			building healthy, sustainable habits, and stay consistent. You’ll
			thank yourself later!</p>
	</div>

</body>
</html>
<%@ include file="footer.jsp"%>