<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Back Workouts</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chestWorkouts.css">
</head>
<body>
    <div class="workout-container">
        <h2>🔥Back Workout Guide</h2>

        <div class="exercise-card">
            <video controls id="barbellPressVideo" src="videos/pullup.mp4"></video>
            <div class="exercise-info">
                <h3>Pull-Ups / Chin-Ups (Vertical Pull - Width Focus)</h3>
                <p><strong>Why:</strong> Gold standard for chest mass & strength. Heavy loading, targets middle chest.The ultimate bodyweight test of back strength. Excellent for developing V-taper width and functional pulling power. Chin-ups (palms facing you) involve biceps more; Pull-ups (palms away) emphasize lats more.</p>
                <p><strong>Key:</strong>  Initiate by depressing shoulders (pull shoulder blades down & back). Pull chest towards the bar. Control the descent fully.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="inclinePressVideo" src="videos/bentover.mp4"></video>
            <div class="exercise-info">
                <h3>Bent-Over Barbell Row (Horizontal Pull - Thickness Focus)</h3>
                <p><strong>Why:</strong> The king of barbell back builders for overall thickness and mid-back development. Allows heavy loading.</p>
                <p><strong>Key:</strong> Hinge at hips (45-60 degree torso angle), maintain neutral spine (NO rounding!). Row bar to lower chest/upper abs, squeezing shoulder blades together. Keep elbows tucked (~45 degrees).</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="flatDumbbellVideo" src="videos/deadlift.mp4"></video>
            <div class="exercise-info">
                <h3>Deadlift (Hip Hinge - Overall Mass & Strength)</h3>
                <p><strong>Why:</strong> The ultimate full-body strength builder. While not purely a "back" exercise, it's unparalleled for developing spinal erectors, traps, and overall back density and resilience. Builds foundational strength.</p>
                <p><strong>Key:</strong> Critical for safety. Neutral spine throughout. Bar close to shins. Drive through heels, extend hips forcefully at the top. Engage lats hard to keep bar close ("bend the bar around your legs").</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="dipsVideo" src="videos/latpulldown.mp4"></video>
            <div class="exercise-info">
                <h3>Lat Pulldown (Vertical Pull - Width Focus - Accessible)</h3>
                <p><strong>Why:</strong> Lower chest & triceps overload, progressable.</p>
                <p><strong>Key:</strong> Lean forward, go shoulder-below-elbow, push through palms.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="flyesVideo" src="videos/dummbleflyes.mp4"></video>
            <div class="exercise-info">
                <h3>Dumbbell Flyes</h3>
                <p><strong>Why:</strong> The best machine alternative to pull-ups. Allows precise loading for hypertrophy and lat width development. Great for beginners or those unable to do many pull-ups. Use a wide or medium grip.</p>
                <p><strong>Key:</strong> Depress shoulders before pulling. Pull bar to upper chest, leading with elbows. Squeeze lats at bottom. Avoid excessive leaning back or using momentum.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="cableFlyesVideo" src="videos/seatedcable.mp4"></video>
            <div class="exercise-info">
                <h3>Seated Cable Row (Horizontal Pull - Thickness Focus - Controlled)</h3>
                <p><strong>Why:</strong> Excellent for targeting the mid-back muscles (rhomboids, traps) with constant tension. Allows a strong squeeze at peak contraction. More back-focused than machine rows with chest support.</p>
                <p><strong>Key:</strong>  Sit tall, slight forward lean at start. Pull handle to lower abdomen/ribs, focusing on retracting shoulder blades hard. Keep chest up, avoid excessive torso sway. Control the return stretch.</p>
            </div>
        </div>

        <div class="exercise-card">
            <video controls id="pushupVideo" src="videos/Tbar.mp4"></video>
            <div class="exercise-info">
                <h3>T-Bar Row (or Chest-Supported Row) (Horizontal Pull - Heavy Thickness)</h3>
                <p><strong>Why:</strong> Allows heavy loading with potentially less lower back stress than bent-over rows (especially chest-supported versions). Great for building brute strength and thickness in the mid-back.</p>
                <p><strong>Key:</strong> Maintain stable torso position (hinged or chest on pad). Pull the weight towards your chest/lower sternum, squeezing shoulder blades together. Focus on driving elbows back.</p>
            </div>
        </div>

    </div>
</body>
</html>
<%@ include file="footer.jsp" %>
