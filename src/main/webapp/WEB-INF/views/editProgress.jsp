<%@ include file="header.jsp" %>
<%@ page import="org.fitAI.model.Entity.*" %>
<%@ page import="java.util.*" %>

<%
    ProgressTracker progress = (ProgressTracker) request.getAttribute("progress");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Progress</title>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/EditProgress.css">

</head>
<body>
    <div class="container">
        <h2 class="title">Edit Progress</h2>
        <form class="progress-form" action="updateProgress" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= progress.getId() %>" />

            <label>Date:</label>
            <input type="date" name="date" value="<%= progress.getDate().toString() %>" required />

            <label>Weight (kg):</label>
            <input type="number" name="weight" step="0.1" value="<%= progress.getWeight() %>" required />

            <label>Notes:</label>
            <textarea name="notes" rows="3" required><%= progress.getNotes() %></textarea>

            <label>Image:</label>
            <input type="file" name="image" />

            <input type="submit" value="Update Progress" />
        </form>
    </div>
</body>
</html>
<%@ include file="footer.jsp" %>