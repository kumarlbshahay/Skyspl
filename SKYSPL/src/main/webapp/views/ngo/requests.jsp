<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Help Requests | NGO Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h3 class="text-primary mb-4">Help Requests Matching Your Services</h3>

    <c:if test="${empty requests}">
        <div class="alert alert-info">No matching help requests found.</div>
    </c:if>

    <c:forEach var="r" items="${requests}">
        <div class="card mb-3 shadow-sm">
            <div class="card-body">
                <h5>${r.title}</h5>
                <p>${r.description}</p>
                <p><strong>Category:</strong> ${r.category}</p>
                <p><strong>Requested by:</strong> ${r.user.name} (${r.user.email})</p>

                <form action="/ngo/requests/accept/${r.id}" method="post" style="display:inline;">
                    <button class="btn btn-success btn-sm">Accept</button>
                </form>

                <form action="/ngo/requests/reject/${r.id}" method="post" style="display:inline;">
                    <button class="btn btn-danger btn-sm">Reject</button>
                </form>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
