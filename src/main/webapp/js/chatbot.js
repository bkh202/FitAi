
async function sendMessage() {
           const userInput = document.getElementById("user-input");
           const chatBox = document.getElementById("chat-box");

           const message = userInput.value.trim();
           if (!message) return;

           chatBox.innerHTML += `<div class="user">🧑‍💬 ${message}</div>`;
           userInput.value = "";

           const response = await fetch("/chatbot/ask", {
               method: "POST",
               headers: { "Content-Type": "application/json" },
               body: JSON.stringify({ prompt: message })
           });

           const reply = await response.text();
           chatBox.innerHTML += `<div class="bot">🤖 ${reply}</div>`;
           chatBox.scrollTop = chatBox.scrollHeight;
       }
	   // Show the spinner
	   function showSpinner() {
	       const spinner = document.createElement('div');
	       spinner.className = 'spinner';
	       spinner.id = 'loading-spinner';
	       document.querySelector('.chat-input').appendChild(spinner);
	   }

	   // Hide the spinner
	   function hideSpinner() {
	       const spinner = document.getElementById('loading-spinner');
	       if (spinner) {
	           spinner.remove();
	       }
	   }
