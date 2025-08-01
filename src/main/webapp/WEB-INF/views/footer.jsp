
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
  .footer {
    background: #111827; /* Match content area */
    color: #f3f4f6;
    padding: 60px 30px 30px;
    font-family: 'Segoe UI', sans-serif;
    border-top: 1px solid #1f2937;
  }

  .footer-container {
    max-width: 1400px;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 40px;
  }

  .footer-section {
    flex: 1 1 250px;
    min-width: 200px;
  }

  .footer h3 {
    margin-bottom: 15px;
    font-size: 18px;
    color: #facc15; /* Yellow shade */
    font-weight: 600;
  }

  .footer p, .footer li, .footer a {
    color: #d1d5db;
    font-size: 14px;
    text-decoration: none;
    line-height: 1.7;
  }

  .footer ul {
    list-style: none;
    padding: 0;
  }

  .footer a:hover {
    color: #facc15;
    transition: 0.3s ease;
  }

  .social-icons a {
    margin-right: 15px;
    font-size: 18px;
    color: #9ca3af;
  }

  .social-icons a:hover {
    color: #facc15;
  }

  .footer-bottom {
    text-align: center;
    padding-top: 25px;
    margin-top: 40px;
    font-size: 13px;
    color: #9ca3af;
    border-top: 1px solid #1f2937;
  }

  .footer-bottom strong {
    color: #f87171; /* Soft red */
  }

  @media (max-width: 768px) {
    .footer-container {
      flex-direction: column;
      text-align: center;
      gap: 30px;
    }

    .social-icons {
      justify-content: center;
    }
  }
</style>

<footer class="footer">
  <div class="footer-container">

    <!-- About Us -->
    <div class="footer-section">
      <h3>About Us</h3>
      <p>FitAI is your smart gym partner offering personalized fitness plans, supplement guides, and progress tracking with the power of AI.</p>
    </div>

    <!-- Our Bunker -->
    <div class="footer-section">
      <h3>Our Bunker</h3>
      <ul>
        <li> Bhopal, India</li>
        <li> CodeZone Lab</li>
        <li> Mon–Sat: 10 AM – 7 PM</li>
      </ul>
    </div>

    <!-- Social Links -->
    <div class="footer-section">
      <h3>Connect With Us</h3>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-linkedin"></i></a>
      </div>
    </div>

  </div>

  <!-- Footer Bottom -->
  <div class="footer-bottom">
    &copy; <span id="year"></span> FitAI | Developed by <strong>BKH</strong>
  </div>
</footer>

<script>
  document.getElementById("year").innerText = new Date().getFullYear();
</script>
