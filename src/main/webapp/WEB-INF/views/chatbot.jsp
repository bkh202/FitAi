<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>🤖 FitAI Chatbot</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatbot.css">
</head>
<body>
    <div class="chat-container">
        <h2>🤖 FitAI Chatbot Assistant</h2>
        <div id="chat-box"></div>
        <div class="chat-input">
            <input type="text" id="user-input" placeholder="Type your message..." />
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/chatbot.js"></script>
    <%@ include file="footer.jsp" %>
</body>
</html>
