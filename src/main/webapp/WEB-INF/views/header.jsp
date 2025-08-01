<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
  .header {
    position: sticky;
    top: 0;
    z-index: 1000; /* taaki content ke neeche na chala jaye */
    background-color: #ffffff;
    color: #1f2937;
    padding: 1.2rem 1rem;
    border-bottom: 1px solid #e5e7eb;
    font-family: 'Segoe UI', sans-serif;
  }

  .header-container {
    max-width: 1400px;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
  }

  .header h2 {
    margin: 0;
    font-weight: 700;
    font-size: 1.5rem;
    color: #111827;
  }

  .header nav {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
  }

  .header nav a {
    color: #1e3a8a;
    font-weight: 600;
    text-decoration: none;
    position: relative;
    padding-bottom: 4px;
    transition: color 0.3s ease;
  }

  .header nav a::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    height: 2px;
    width: 0%;
    background-color: #1e3a8a;
    transition: width 0.3s ease;
  }

  .header nav a:hover {
    color: #2563eb;
  }

  .header nav a:hover::after {
    width: 100%;
  }
</style>

<header class="header">
  <div class="header-container">
    <h2>🏋️ FitAI</h2>
    <nav>
      <a href="/">Home</a>
      <a href="/diet">Diet</a>
      <a href="/supplement">Supplements</a>
      <a href="/progress">Progress</a>
      <a href="/tips">Tips</a>
      <a href="/exercise">Workout</a>
      <a href="/login">Login</a>
      <a href="/signup">Sign Up</a>
    </nav>
  </div>
</header>
