<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>Progress Tracker | FitAI</title>
    <link rel="stylesheet" href="/css/progress.css">
</head>
<body>

<div class="container">
    <h2 class="title">Add Progress</h2>
    <form class="progress-form" action="/dashboard/saveProgress"
          method="post" enctype="multipart/form-data">
        <label>Date:</label>
        <input type="date" name="date" required>

        <label>Weight (kg):</label>
        <input type="number" name="weight" step="0.1" required>

        <label>Image:</label>
        <input type="file" name="image">

        <label>Notes:</label>
        <textarea name="notes" rows="3"></textarea>

        <input type="submit" value="Save Progress">
    </form>

    <form action="/dashboard/bmi-history" method="get" class="sort-form">
        <button type="submit" class="sort-btn">Sort by Date</button>
    </form>

    <h2 class="title">Your Progress</h2>
    <div class="progress-list">
        <c:forEach var="p" items="${progressList}">
            <div class="progress-card">
                <p><strong>Date:</strong> ${p.date}</p>
                <p><strong>Weight:</strong> ${p.weight} kg</p>
                <p><strong>Notes:</strong> ${p.notes}</p>

                <c:if test="${p.imagePath != null}">
                    <img src="/user-progress-images/${p.imagePath}" alt="Progress Image" />
                </c:if>

                <div class="action-buttons">
                    <form action="/dashboard/deleteProgress" method="post">
                        <input type="hidden" name="id" value="${p.id}" />
                        <button type="submit" class="delete-btn">Delete</button>
                    </form>

                    <form action="/dashboard/editProgress" method="get">
                        <input type="hidden" name="id" value="${p.id}" />
                        <button type="submit" class="edit-btn">Update</button>
                    </form>

                    <a href="/dashboard/progressOverview" class="extra-link-btn">view Chart</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
<%@ include file="footer.jsp"%>
