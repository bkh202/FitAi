<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp"%>
<html>
<head>
  <title>Supplement Results</title>
  <link rel="stylesheet" href="/css/supplement.css">
</head>
<body>

  <div class="supplement-container">
    <h2>📦 Your AI Supplement Plan</h2>

    <div id="budgetBar"></div>
    <div id="supplementList" class="supplement-list"></div>
  </div>

  <script>
  const raw = sessionStorage.getItem("supplementData");
  if (!raw) {
    document.body.innerHTML = "<p style='color:red;'>❌ No supplement data found in sessionStorage. Go back and generate it again.</p>";
    throw new Error("No supplementData found in sessionStorage");
  }

  let data;
  try {
    data = JSON.parse(raw);
  } catch (e) {
    document.body.innerHTML = "<p style='color:red;'>❌ Failed to parse data.</p>";
    console.error("JSON Parse Error:", e);
    throw e;
  }

  console.log("✅ Parsed Data:", data);

  const { suggestions, totalUsed } = data;

  document.getElementById('budgetBar').innerHTML = `
    <p>💸 Used: ₹${totalUsed}</p>
    <progress value="${totalUsed}" max="10000"></progress>
  `;

  const html = suggestions.map(item => `
    <div class="supplement-item">
      <h4>${item.name}</h4>
      <p><strong>Purpose:</strong> ${item.purpose}</p>
      <p><strong>Price:</strong> ₹${item.price}</p>
      <a href="${item.link}" target="_blank">🔗 Buy Now</a>
    </div>
  `).join("");

  document.getElementById('supplementList').innerHTML = html;
</script>

</body>
</html>
<%@ include file="footer.jsp"%>