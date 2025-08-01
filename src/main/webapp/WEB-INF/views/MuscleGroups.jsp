<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<html>
<head>
    <title>Muscle Groups - FitAI</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/muscleGroups.css">
</head>
<body>
    <div class="container">
        <h2 class="page-title">🏋️‍♂️ Choose Your Muscle Group</h2>
        <div class="muscle-card-grid">
            <div class="muscle-card" onclick="location.href='workout?group=Chest'">
                <img src="${pageContext.request.contextPath}/images/chest.png" alt="Chest">
                <p>Chest</p>
            </div>
            <div class="muscle-card" onclick="location.href='workout?group=Back'">
                <img src="${pageContext.request.contextPath}/images/back.png" alt="Back">
                <p>Back</p>
            </div>
            <div class="muscle-card" onclick="location.href='workout?group=Shoulders'">
                <img src="${pageContext.request.contextPath}/images/shoulders.png" alt="Shoulders">
                <p>Shoulders</p>
            </div>
            <div class="muscle-card" onclick="location.href='workout?group=Arms'">
                <img src="${pageContext.request.contextPath}/images/arms.png" alt="Arms">
                <p>Arms</p>
            </div>
            <div class="muscle-card" onclick="location.href='workout?group=Legs'">
                <img src="${pageContext.request.contextPath}/images/legs.png" alt="Legs">
                <p>Legs</p>
            </div>
            <div class="muscle-card" onclick="location.href='workout?group=Abs'">
                <img src="${pageContext.request.contextPath}/images/abs.png" alt="Abs">
                <p>Abs</p>
            </div>
             <div class="muscle-card" onclick="location.href='workout?group=Shoulders'">
                <img src="${pageContext.request.contextPath}/images/bicep.png" alt="Shoulders">
                <p>Biceps</p>
            </div>
            <div class="muscle-card" onclick="location.href='workout?group=Arms'">
                <img src="${pageContext.request.contextPath}/images/tricep.png" alt="Arms">
                <p>Triceps</p>
            </div>
            <div class="muscle-card" onclick="location.href='workout?group=Legs'">
                <img src="${pageContext.request.contextPath}/images/cardio.png" alt="Legs">
                <p>Cardio</p>
            </div>
            <div class="muscle-card" onclick="location.href='workout?group=Abs'">
                <img src="${pageContext.request.contextPath}/images/calf.png" alt="Abs">
                <p>Calf</p>
            </div>
        </div>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>
