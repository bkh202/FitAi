<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Shoulder Workouts</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chestWorkouts.css">
</head>
<body>
    <div class="workout-container">
        <h2>🏋️ Shoulder Workout Guide</h2>

        <div class="exercise-card">
            <video controls src="videos/overheadpress.mp4"></video>
            <div class="exercise-info">
                <h3>Overhead Shoulder Press (Dumbbell or Barbell)</h3>
                <p><strong>Why:</strong> Builds size and strength in front & side delts. Core compound move.</p>
                <p><strong>Key:</strong> Keep core tight, press weights straight overhead without locking elbows fully.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls src="videos/lateralraise.mp4"></video>
            <div class="exercise-info">
                <h3>Lateral Raises</h3>
                <p><strong>Why:</strong> Best for side delts width and shoulder definition.</p>
                <p><strong>Key:</strong> Raise dumbbells to shoulder height with control, avoid swinging.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls src="videos/frontraise.mp4"></video>
            <div class="exercise-info">
                <h3>Front Raises</h3>
                <p><strong>Why:</strong> Targets front deltoids and gives rounded look from front.</p>
                <p><strong>Key:</strong> Lift with straight arms to eye level, using dumbbells or plate.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls src="videos/reardeltflyes.mp4"></video>
            <div class="exercise-info">
                <h3>Rear Delt Flyes</h3>
                <p><strong>Why:</strong> Targets rear delts for balanced 3D shoulders and posture.</p>
                <p><strong>Key:</strong> Bend over, raise dumbbells outwards, squeeze shoulder blades.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls src="videos/arnoldpress.mp4"></video>
            <div class="exercise-info">
                <h3>Arnold Press</h3>
                <p><strong>Why:</strong> Hits all 3 deltoid heads with one rotational move.</p>
                <p><strong>Key:</strong> Start with palms facing you, rotate while pressing overhead.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls src="videos/uprightrow.mp4"></video>
            <div class="exercise-info">
                <h3>Upright Rows</h3>
                <p><strong>Why:</strong> Great for traps and side delts when done with proper form.</p>
                <p><strong>Key:</strong> Pull weight up to chest with elbows higher than wrists.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls src="videos/pikepushup.mp4"></video>
            <div class="exercise-info">
                <h3>Pike Push-Ups</h3>
                <p><strong>Why:</strong> Bodyweight move for front delts & shoulder strength.</p>
                <p><strong>Key:</strong> Keep body in inverted V, lower head to floor and push back.</p>
            </div>
        </div>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>