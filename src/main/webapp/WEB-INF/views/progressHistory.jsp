<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Base64" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Progress History</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/progressHistory.css" />
</head>
<body>

<h2>📅 Your Progress History</h2>

<table>
    <thead>
        <tr>
            <th>Date</th>
            <th>Weight (kg)</th>
            <th>Notes</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${progressList}">
        <tr>
            <td>${p.date}</td>
            <td>${p.weight}</td>
            <td>${p.notes}</td>
            <td>
                <c:if test="${not empty p.image}">
                    <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(p.image)}" />
                </c:if>
            </td>
            <td>
                <button class="btn" onclick="viewDetails('${p.id}')">View</button>
                <button class="btn" onclick="downloadAsPDF('${p.id}')">Download</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
function viewDetails(id) {
    alert("Show details for ID: " + id);
}

function downloadAsPDF(id) {
    alert("Download PDF for ID: " + id);
}
</script>

</body>
</html>
