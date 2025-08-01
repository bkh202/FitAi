<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>💧 Water Intake Result</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/waterResult.css">
</head>
<body>
<div class="result-container">
    <h2>💧 Your Recommended Water Intake</h2>
    <p><strong>${recommendedMl} ml</strong> per day (~ <strong>${recommendedLiters} liters</strong>)</p>

    <hr>
    <h3>📊 Your Water Intake Logs</h3>

    <table class="styled-table">
        <thead>
            <tr>
                <th>Date</th>
                <th>Weight</th>
                <th>Activity</th>
                <th>Climate</th>
                <th>Recommended (ml)</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="log" items="${logs}">
            <tr>
              <td>${entry.createdAt}</td>
                <td>${log.weight}</td>
                <td>${log.activity}</td>
                <td>${log.climate}</td>
                <td>${log.recommendedMl}</td>
                <td>
                    <form action="ai-water-tip" method="post" style="display:inline;">
                        <input type="hidden" name="logId" value="${log.id}" />
                        <button type="submit">AI Suggestion</button>
                    </form>
                    <form action="update-water-log" method="get" style="display:inline;">
                        <input type="hidden" name="id" value="${log.id}" />
                        <button type="submit">Update</button>
                    </form>
                    <form action="delete-water-log" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="${log.id}" />
                        <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
