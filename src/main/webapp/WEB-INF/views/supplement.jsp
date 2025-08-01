<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Supplement Recommendation | FitAI</title>
    <link rel="stylesheet" href="<c:url value='/css/supplement.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    
</head>
<body>
    <section class="supplement-container">
        <h2><i class="fas fa-capsules"></i> Get AI-Based Supplement Suggestions</h2>

        <form id="supplementForm">
            <div class="form-group">
                <label>Enter Your Budget (₹):</label>
                <input type="number" name="budget" required min="500" max="10000" value="5000">
            </div>

            <div class="form-group">
                <label>Purpose:</label>
                <select name="purpose" required>
                    <option value="">--Select Purpose--</option>
                    <option value="hardcore gym" selected>Muscle Gain (Hardcore Gym)</option>
                    <option value="normal gym">Fat Loss (Normal Gym)</option>
                    <option value="home workout">General Fitness (Home Workout)</option>
                    <option value="cardio">Energy & Endurance (Cardio)</option>
                </select>
            </div>

            <button type="submit" class="btn">Get AI Suggestions</button>
        </form>

        <!-- 📦 Suggestions Result -->
        <div id="supplementResult" class="result-box" style="display: none;">
            <div id="spinner" class="spinner" style="display: none;">
                <i class="fas fa-spinner fa-spin fa-2x"></i>
                <p>Generating AI Suggestions...</p>
            </div>

            <div id="budgetBar"></div>

           

            <div id="supplementList" class="supplement-list"></div>
        </div>
    </section>

    <!-- JavaScript logic -->
    <script src="<c:url value='/js/supplement.js'/>"></script>
</body>
</html>
<%@ include file="footer.jsp" %>
