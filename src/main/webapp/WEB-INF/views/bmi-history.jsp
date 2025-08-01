<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<head>
    <title>BMI History | FitAI</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="/css/Bmi-history.css">

    <!-- ✅ Lottie Spinner CSS + Script -->
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
    <style>
        #spinner-overlay {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          background-color: rgba(17, 24, 39, 0.85);
          display: none;
          justify-content: center;
          align-items: center;
          z-index: 9999;
        }
    </style>
</head>
<body>

	<section class="bmi-container">
		<h1><i class="fas fa-chart-line"></i> Your BMI History</h1>

		<c:if test="${not empty error}">
			<div class="error-message">
				<i class="fas fa-exclamation-triangle"></i> ${error}
			</div>
		</c:if>

		<c:choose>
			<c:when test="${emptyHistory}">
				<div class="empty-history">
					<i class="fas fa-chart-bar"></i>
					<h3>No BMI History Found</h3>
					<p>Calculate your BMI to start tracking your progress</p>
					<a href="/bmi" class="btn">Calculate BMI Now</a>
				</div>
			</c:when>
			<c:otherwise>
				<canvas id="bmiChart" height="150"></canvas>

				<h2 style="margin-top: 40px;">History Table</h2>
				<div style="overflow-x: auto;">
					<table>
						<thead>
							<tr>
								<th>Date</th>
								<th>Height (cm)</th>
								<th>Weight (kg)</th>
								<th>BMI</th>
								<th>Category</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="record" items="${history}">
								<tr>
									<td>${record.formattedDate}</td>
									<td>${record.height}</td>
									<td>${record.weight}</td>
									<td>${record.bmi}</td>
									<td>${record.category}</td>
									<td style="display: flex; gap: 0.5rem; flex-wrap: wrap;">
										<!-- 🔴 Delete Button -->
										<form method="post" action="/deleteBMI" style="display: inline;">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<input type="hidden" name="id" value="${record.id}" />
											<button type="submit" class="delete-btn"
												onclick="return confirm('Are you sure you want to delete this record?');">
												Delete
											</button>
										</form>

										<!-- 💡 AI Diet Plan Button -->
										<button type="button" class="ai-plan-btn" 
											data-bmi="${record.bmi}" data-category="${record.category}"
											data-age="${user.age}" data-gender="${user.gender}">
											AI Plan
										</button>

										<!-- 📄 AI Diet Plan PDF Button -->
										<form method="post" action="/api/downloadAIDietPdf" target="_blank">
											<input type="hidden" name="bmi" value="${record.bmi}" />
											<input type="hidden" name="category" value="${record.category}" />
											<input type="hidden" name="age" value="${user.age}" />
											<input type="hidden" name="gender" value="${user.gender}" />
											<button type="submit" class="pdf-btn">AI PDF</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
	</section>

	<!-- ✅ Lottie Spinner Overlay -->
	<!-- ✅ Final Gym Dumbbell Spinner -->
<div id="spinner-overlay">
  <lottie-player
    src="https://assets6.lottiefiles.com/packages/lf20_pprxh53t.json"
    background="transparent"
    speed="1"
    style="width: 200px; height: 200px;"
    loop
    autoplay>
  </lottie-player>
</div>


	<!-- ✅ Chart.js BMI Graph -->
	<c:if test="${not empty history}">
	<script>
    document.addEventListener("DOMContentLoaded", function() {
        const bmiLabels = [
            <c:forEach var="date" items="${formattedDates}">
                "${date}"<c:if test="${not loop.last}">,</c:if>
            </c:forEach>
        ];

        const bmiData = [
            <c:forEach var="record" items="${history}">
                ${record.bmi}<c:if test="${not loop.last}">,</c:if>
            </c:forEach>
        ];

        const ctx = document.getElementById("bmiChart").getContext("2d");
        new Chart(ctx, {
            type: "line",
            data: {
                labels: bmiLabels,
                datasets: [{
                    label: "BMI Over Time",
                    data: bmiData,
                    borderColor: "#3b82f6",
                    backgroundColor: "rgba(59,130,246,0.1)",
                    borderWidth: 3,
                    pointBackgroundColor: "#3b82f6",
                    pointRadius: 5,
                    tension: 0.3,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: true, position: 'top' },
                    tooltip: {
                        callbacks: {
                            label: (context) => `BMI: ${context.parsed.y.toFixed(1)}`
                        }
                    }
                },
                scales: {
                    y: { beginAtZero: false, title: { display: true, text: 'BMI Value' } },
                    x: { title: { display: true, text: 'Date' } }
                }
            }
        });
    });
	</script>
	</c:if>

	<!-- ✅ AI Diet Fetch with Spinner -->
	<script>
document.querySelectorAll(".ai-plan-btn").forEach(btn => {
  btn.addEventListener("click", () => {
    const bmi = btn.dataset.bmi;
    const category = btn.dataset.category;
    const age = btn.dataset.age;
    const gender = btn.dataset.gender;

    // Show spinner
    document.getElementById("spinner-overlay").style.display = "flex";

    fetch("/api/ai-diet", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-TOKEN": '${_csrf.token}'
      },
      body: JSON.stringify({ bmi, category, age, gender })
    })
    .then(res => res.text())
    .then(diet => {
      document.getElementById("spinner-overlay").style.display = "none";
      alert(" AI Diet Plan:\n\n" + diet);
    })
    .catch(err => {
      console.error("Error fetching AI diet plan:", err);
      document.getElementById("spinner-overlay").style.display = "none";
      alert(" Failed to fetch AI plan. Try again later.");
    });
  });
});
</script>

</body>
</html>

<%@ include file="footer.jsp"%>
