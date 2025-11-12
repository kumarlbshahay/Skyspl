<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>My Help Requests</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h3 class="text-primary mb-4">My Help Requests</h3>
    <c:forEach var="req" items="${requests}">
        <div class="card mb-3 shadow-sm">
            <div class="card-body">
                <h5>${req.title}</h5>
                <p>${req.description}</p>
                <p><strong>Status:</strong> ${req.status}</p>

                <c:if test="${req.assignedNgo != null}">
                    <div class="alert alert-success mt-2">
                        <strong>Accepted by NGO:</strong> ${req.assignedNgo.name}<br>
                        <small>Email: ${req.assignedNgo.email}</small><br>
                        <small>Phone: ${req.assignedNgo.phone}</small>
                    </div>
                </c:if>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
