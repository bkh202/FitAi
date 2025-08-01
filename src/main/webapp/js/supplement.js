document.getElementById('supplementForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const formData = new FormData(this);
    const payload = {
        budget: formData.get('budget'),
        purpose: formData.get('purpose')
    };

    const resultDiv = document.getElementById('supplementResult');
    resultDiv.style.display = 'block';

    // ⏳ Show loading spinner
    document.getElementById('supplementList').innerHTML = `
        <div class="spinner"></div>
        <p style="text-align:center;">⏳ Please wait...</p>
    `;
    document.getElementById('budgetBar').innerHTML = '';

    fetch('/api/ai-supplements', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
    })
    .then(res => {
        if (!res.ok) {
            throw new Error(`HTTP error! status: ${res.status}`);
        }
        return res.json();
    })
    .then(data => {
        console.log("✅ AI Response:", data);

        if (data.error) {
            throw new Error(data.error);
        }

        // Save in sessionStorage
        sessionStorage.setItem("supplementData", JSON.stringify(data));

        renderSuggestions(data); // ✅ central render call

    })
    .catch(err => {
        console.error("❌ Error:", err);
        document.getElementById('supplementList').innerHTML = `
            <p class="error">⚠️ Error: ${err.message}</p>
            <p>Please try again with different parameters.</p>
        `;
    });
});

// 🏷️ Badge helper
function getCategoryBadge(name = '') {
    name = name.toLowerCase();
    if (name.includes('whey') || name.includes('protein')) return 'Protein';
    if (name.includes('creatine')) return 'Creatine';
    if (name.includes('bcaa')) return 'BCAA';
    if (name.includes('pre-workout')) return 'Pre-Workout';
    if (name.includes('multivitamin')) return 'Multivitamin';
    return 'Other';
}

// 📦 Render suggestions (also used for back button)
function renderSuggestions(data) {
    const suggestions = data.suggestions;
    const totalUsed = data.totalUsed || 0;
    const budget = data.budget || 5000;
    const budgetPercentage = (totalUsed / budget) * 100;

    document.getElementById('budgetBar').innerHTML = `
        <p>💸 Used: ₹${Math.round(totalUsed)} / ₹${budget} (${budgetPercentage.toFixed(1)}%)</p>
        <progress value="${totalUsed}" max="${budget}" style="width: 100%; height: 20px;"></progress>
    `;

    const html = suggestions.map(item => `
        <div class="supplement-item">
            <h4>${item.name || 'Unknown Product'}
                <span class="badge">${getCategoryBadge(item.name)}</span>
            </h4>
            <p><strong>Purpose:</strong> ${item.purpose || 'General fitness'}</p>
            <p><strong>Price:</strong> ₹${Math.round(item.price)}</p>
            <a href="${item.link || '#'}" target="_blank" class="buy-btn">🔗 Buy Now</a>
            <button class="wishlist-btn">🛒 Add to Wishlist</button>
        </div>
    `).join("");

    document.getElementById('supplementList').innerHTML = html;

    // 🛒 Wishlist future logic (optional)
    document.querySelectorAll('.wishlist-btn').forEach(btn => {
        btn.addEventListener('click', function () {
            const itemName = this.parentElement.querySelector('h4').innerText;
            alert(`🛒 "${itemName}" added to wishlist (not saved yet)`);
        });
    });

    // 📄 Download as PDF
    const downloadBtn = document.createElement('button');
    downloadBtn.innerText = '📄 Download as PDF';
    downloadBtn.className = 'btn';
    downloadBtn.style.marginTop = '20px';
    downloadBtn.onclick = async function () {
        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        doc.setFontSize(14);
        doc.text("AI-Based Supplement Suggestions", 10, 10);

        suggestions.forEach((item, i) => {
            doc.text(`• ${item.name} - ₹${item.price} (${item.purpose})`, 10, 20 + i * 10);
        });

        doc.save('supplements.pdf');
    };
    document.getElementById('supplementResult').appendChild(downloadBtn);
}

// 🚀 Restore from cache (on page load)
window.addEventListener('DOMContentLoaded', () => {
    const cached = sessionStorage.getItem("supplementData");
    if (cached) {
        const data = JSON.parse(cached);
        renderSuggestions(data);
        document.getElementById('supplementResult').style.display = 'block';
    }
});
