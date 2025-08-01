<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>BMI Calculator | FitAI</title>

<link rel="stylesheet" href="/css/bmi.css" />
</head>
<body>

	<section class="bmi-container">
		<h1>
			<i class="fas fa-weight"></i> BMI Calculator
		</h1>

		<form id="bmi-form">
			<div class="form-group">
				<label for="age">Age</label> <input type="number" id="age"
					name="age" required min="2" max="120" />
			</div>

			<div class="form-group">
				<label for="height">Height (in cm)</label> <input type="number"
					id="height" name="height" required min="50" max="300" />
			</div>

			<div class="form-group">
				<label for="weight">Weight (in kg)</label> <input type="number"
					id="weight" name="weight" required min="5" max="500" />
			</div>

			<button type="submit">Calculate BMI</button>

		</form>

		<!-- BMI History Button -->
		

		<!-- Result container -->
		<div id="result" class="result-container" style="display: none;">
			<h3>BMI Result</h3>
			<div id="result-content"></div>
		</div>
	</section>

	<script>
  document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("bmi-form");
    const resultContainer = document.getElementById("result");
    const resultContent = document.getElementById("result-content");

    form.addEventListener("submit", function (e) {
      e.preventDefault();

      const age = parseInt(document.getElementById("age").value.trim());
      const height = parseFloat(document.getElementById("height").value.trim());
      const weight = parseFloat(document.getElementById("weight").value.trim());

      // Reset UI
      resultContainer.style.display = "none";
      resultContent.innerHTML = "";

      // Validate inputs
      if (isNaN(age) || isNaN(height) || isNaN(weight) || age <= 0 || height <= 0 || weight <= 0) {
        showError("Please enter valid age, height and weight.");
        return;
      }

      if (age < 2 || age > 120) {
        showError("Please enter age between 2-120 years");
        return;
      }

      // Calculate BMI
      const bmiValue = weight / Math.pow(height / 100, 2);
      const bmi = bmiValue.toFixed(2);
      let category = "", advice = "", statusClass = "";

      if (bmiValue < 18.5) {
        category = "Underweight";
        advice = "Start a calorie surplus diet, include protein-rich foods.";
        statusClass = "warning";
      } else if (bmiValue < 25) {
        category = "Normal weight";
        advice = "Maintain current routine. Balanced diet + activity.";
        statusClass = "success";
      } else if (bmiValue < 30) {
        category = "Overweight";
        advice = "Start light workouts and clean diet.";
        statusClass = "warning";
      } else {
        category = "Obese";
        advice = "Consult nutritionist and start slow walks.";
        statusClass = "error";
      }

      // Display results using string concatenation
      resultContent.innerHTML = 
        '<p><strong>Age:</strong> ' + age + ' years</p>' +
        '<p><strong>Height:</strong> ' + height + ' cm</p>' +
        '<p><strong>Weight:</strong> ' + weight + ' kg</p>' +
        '<p><strong>BMI:</strong> <span class="' + statusClass + '">' + bmi + '</span></p>' +
        '<p><strong>Category:</strong> <span class="' + statusClass + '">' + category + '</span></p>' +
        '<p><strong>Advice:</strong> ' + advice + '</p>';

      // Show results
      resultContainer.style.display = "block";
      resultContainer.scrollIntoView({ behavior: 'smooth' });

      // Save to DB
      fetch("/api/save-bmi", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ 
          height: height, 
          weight: weight, 
          bmi: bmiValue, 
          category: category 
        })
      })
      .then(res => res.text())
      .then(data => console.log("Saved to DB:", data))
      .catch(err => console.error("Save error:", err));
    });

    function showError(message) {
      resultContent.innerHTML = '<div class="error">' + message + '</div>';
      resultContainer.style.display = "block";
      resultContainer.scrollIntoView({ behavior: 'smooth' });
    }
  });
</script>

</body>
</html>
<%@ include file="footer.jsp"%>