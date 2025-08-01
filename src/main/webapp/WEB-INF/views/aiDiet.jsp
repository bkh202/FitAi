<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="header.jsp"%>

<html>
<head>
    <title>AI Diet Plan | FitAI</title>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    
    <!-- Lottie Spinner CDN -->
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

    <link rel="stylesheet" href="/css/ai-diet-plan.css">
</head>

<body>

    <!-- Spinner Overlay -->
    <div id="spinner-overlay" style="display: none;">
        <lottie-player
            src="https://assets6.lottiefiles.com/packages/lf20_pprxh53t.json"
            background="transparent" speed="1"
            style="width: 200px; height: 200px;" loop autoplay>
        </lottie-player>
    </div>

    <!-- AI Diet Form -->
    <section class="diet-form-container">
        <h2><i class="fas fa-utensils"></i> Get Your AI-Based Diet Plan</h2>

        <form id="aiDietForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

            <div class="form-group">
                <label>Age:</label>
                <input type="number" name="age" required min="12" max="100" />
            </div>

            <div class="form-group">
                <label>Current Weight (kg):</label>
                <input type="number" name="weight" required min="20" max="300" />
            </div>

            <div class="form-group">
                <label>Goal:</label>
                <select name="goalType" required>
                    <option value="">--Select--</option>
                    <option value="gain">Weight Gain</option>
                    <option value="lose">Weight Loss</option>
                </select>
            </div>

            <div class="form-group">
                <label>How Many Kg:</label>
                <input type="number" name="targetKg" required min="1" max="100" />
            </div>

            <div class="form-group">
                <label>Duration (in weeks):</label>
                <input type="number" name="duration" required min="1" max="52" />
            </div>

            <div class="form-group">
                <label>Gender:</label>
                <select name="gender" required>
                    <option value="">--Select--</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>

            <button type="submit" class="btn">Generate AI Diet Plan</button>
        </form>
        <button id="savePdfBtn" class="btn btn-outline" style="margin-top: 10px;">Save as PDF</button>
        

        <div id="aiDietResult" class="result-box"></div>
    </section>

    <!-- JavaScript to Handle Submission -->
    <script>
        document.getElementById('aiDietForm').addEventListener('submit', function (e) {
            e.preventDefault();

            const formData = new FormData(this);
            const payload = {
                age: formData.get('age'),
                weight: formData.get('weight'),
                goalType: formData.get('goalType'),
                targetKg: formData.get('targetKg'),
                duration: formData.get('duration'),
                gender: formData.get('gender')
            };

            document.getElementById("spinner-overlay").style.display = "flex";

            fetch('/api/ai-diet-full', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '${_csrf.token}'
                },
                body: JSON.stringify(payload)
            })
                .then(response => response.text())
                .then(diet => {
                    document.getElementById("spinner-overlay").style.display = "none";
                    console.log("📥 AI Diet Plan:", diet);

                    const cleanDiet = diet.replace(/^"|"$/g, '').replace(/\\n/g, '\n');
                    document.getElementById("aiDietResult").innerHTML =
                        '<div class="diet-plan">' + formatDietPlan(cleanDiet) + '</div>';
                })
                .catch(err => {
                    document.getElementById("spinner-overlay").style.display = "none";
                    document.getElementById("aiDietResult").innerHTML =
                        '<div class="error">Failed to fetch AI diet plan: ' + err.message + '</div>';
                });
        });

        // ✅ Format the diet plan with proper HTML
        function formatDietPlan(text) {
            return text
                .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>') // Bold
                .replace(/\n/g, '<br>') // Line breaks
                .replace(/(\d+\.\s+.*?)(?=\d+\.|$)/g, '<p>$1</p>') // Numbered points
                .replace(/^#\s+(.*)$/gm, '<h3>$1</h3>'); // Headings
        }
        
        document.getElementById("savePdfBtn").addEventListener("click", function () {
        	  const resultElement = document.getElementById("aiDietResult");
        	  
        	  if (!resultElement.innerText.trim()) {
        	    alert("❌ No diet plan found. Please generate it first.");
        	    return;
        	  }

        	  // Optional: Clone the element so styling stays intact
        	  const clone = resultElement.cloneNode(true);
        	  clone.style.padding = "20px";
        	  clone.style.fontFamily = "Segoe UI, sans-serif";

        	  const opt = {
        	    margin:       0.5,
        	    filename:     'ai-diet-plan.pdf',
        	    image:        { type: 'jpeg', quality: 0.98 },
        	    html2canvas:  { scale: 2 },
        	    jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
        	  };

        	  html2pdf().set(opt).from(clone).save();
        	});

    </script>

</body>
</html>

<%@ include file="footer.jsp"%>
