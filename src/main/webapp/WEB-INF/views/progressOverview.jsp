<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <title>Progress Tracker</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/progressOverview.css">
    
</head>
<body>
    <h2>Your Transformation</h2>

    <div class="progress-section">
        <div>
            <h3>Before</h3>
            <img src="${pageContext.request.contextPath}/user-progress-images/${beforeImage}" alt="Before Image">
        </div>
        <div>
            <h3>After</h3>
            <img src="${pageContext.request.contextPath}/user-progress-images/${afterImage}" alt="After Image">
        </div>
    </div>

    <div class="chart-container">
        <h2>Weight Progress Chart</h2>
        <canvas id="weightChart"></canvas>
    </div>
    <button onclick="fetchAIFeedback()" class="ai-feedback-btn"> Get AI Feedback</button>
   <div id="ai-feedback" style="margin-top: 20px;"></div>

    

    <script>
        const labels = [
            <c:forEach var="progress" items="${progressList}" varStatus="loop">
                "${progress.date}"<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];

        const data = [
            <c:forEach var="progress" items="${progressList}" varStatus="loop">
                ${progress.weight}<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];

        const ctx = document.getElementById('weightChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Weight Over Time',
                    data: data,
                    borderColor: 'orange',
                    backgroundColor: 'rgba(255,165,0,0.3)',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: false,
                        title: {
                            display: true,
                            text: 'Weight (kg)'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Date'
                        }
                    }
                }
            }
        });
    </script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/aifeedback.js"></script>

</body>
</html>
<%@ include file="footer.jsp" %>