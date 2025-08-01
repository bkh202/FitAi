<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Chest Workouts</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chestWorkouts.css">
</head>
<body>
    <div class="workout-container">
        <h2>🔥 Chest Workout Guide</h2>

        <div class="exercise-card">
            <video controls id="barbellPressVideo" src="videos/barbell_press.mp4"></video>
            <div class="exercise-info">
                <h3>Barbell Bench Press</h3>
                <p><strong>Why:</strong> Gold standard for chest mass & strength. Heavy loading, targets middle chest.</p>
                <p><strong>Key:</strong> Slight arch, shoulder retraction, heels drive, bar to mid-chest, avoid elbow flare.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="inclinePressVideo" src="videos/incline_press.mp4"></video>
            <div class="exercise-info">
                <h3>Incline Barbell or Dumbbell Press</h3>
                <p><strong>Why:</strong> Targets upper chest. Dumbbells help fix imbalances.</p>
                <p><strong>Key:</strong> 30-45° bench, press slightly backward, deep safe ROM.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="flatDumbbellVideo" src="videos/flat_dumbbell.mp4"></video>
            <div class="exercise-info">
                <h3>Flat or Incline Dumbbell Press</h3>
                <p><strong>Why:</strong> Better stretch and shoulder movement, works each side.</p>
                <p><strong>Key:</strong> Deep control, palms neutral, explosive press.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="dipsVideo" src="videos/weighted_dips.mp4"></video>
            <div class="exercise-info">
                <h3>Weighted Dips</h3>
                <p><strong>Why:</strong> Lower chest & triceps overload, progressable.</p>
                <p><strong>Key:</strong> Lean forward, go shoulder-below-elbow, push through palms.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="flyesVideo" src="videos/flyes.mp4"></video>
            <div class="exercise-info">
                <h3>Dumbbell Flyes</h3>
                <p><strong>Why:</strong> Isolation, chest stretch and contraction, inner chest focus.</p>
                <p><strong>Key:</strong> Slight bend in elbows, moderate weight, squeeze at top.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="cableFlyesVideo" src="videos/low_to_high_flyes.mp4"></video>
            <div class="exercise-info">
                <h3>Low-to-High Cable Flyes</h3>
                <p><strong>Why:</strong> Constant tension, targets upper chest.</p>
                <p><strong>Key:</strong> Stand tall, one foot forward, arc up, squeeze upper pecs.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="pushupVideo" src="videos/pushups.mp4"></video>
            <div class="exercise-info">
                <h3>Push-Ups (with Variations)</h3>
                <p><strong>Why:</strong> Versatile, targets different chest zones, easy to load.</p>
                <p><strong>Key:</strong> Rigid plank form, deep descent, explosive push, use variations.</p>
            </div>
        </div>

    </div>
</body>
</html>
<%@ include file="footer.jsp" %>