
function fetchAIFeedback() {
  const feedbackDiv = document.getElementById("ai-feedback");
  feedbackDiv.innerHTML = "🔄 Generating AI feedback... Please wait...";

  fetch("/dashboard/aiFeedback", {
    method: "POST",
  })
  .then(response => response.json()) // OpenRouter gives JSON response
  .then(data => {
    try {
      const aiContent = data.choices[0].message.content;
      feedbackDiv.innerHTML = `
        <div class="ai-box">
          <strong>🧠 AI Feedback:</strong><br><br>${aiContent.replace(/\n/g, "<br>")}
        </div>
      `;
    } catch (e) {
      console.error("Parse Error:", e);
      feedbackDiv.innerHTML = "❌ Unexpected response from AI.";
    }
  })
  .catch(error => {
    console.error("Error:", error);
    feedbackDiv.innerHTML = "❌ Failed to get AI feedback.";
  });
}

