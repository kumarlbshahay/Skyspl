<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${ngo.name} | NGO Dashboard</title>

    <!-- Bootstrap + Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', sans-serif;
        }

        .navbar {
            background: linear-gradient(90deg, #1e88e5, #42a5f5);
        }

        .navbar-brand {
            color: #fff !important;
            font-weight: 700;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            background: #fff;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
        }

        .trusted {
            background-color: #28a745;
            color: white;
        }

        .pending {
            background-color: #ffc107;
            color: #000;
        }

        .header-bg {
            background: linear-gradient(90deg, #1e88e5, #42a5f5);
            color: white;
            border-radius: 20px 20px 0 0;
            padding: 1.5rem;
        }

        footer {
            margin-top: 40px;
            background-color: #1e88e5;
            color: white;
            text-align: center;
            padding: 15px 0;
            border-radius: 0 0 20px 20px;
        }

        .info-label {
            font-weight: 600;
            color: #555;
        }

        .action-buttons .btn {
            border-radius: 10px;
            font-weight: 500;
        }

        .docs-section ul {
            list-style: none;
            padding-left: 0;
        }

        .docs-section li {
            margin-bottom: 8px;
        }

        .docs-section a {
            text-decoration: none;
            font-weight: 500;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">SKYSPL NGO Portal</a>
        <div class="ms-auto">
            <a href="/" class="btn btn-outline-light btn-sm"><i class="bi bi-house-door"></i> Home</a>
            <a href="/logout" class="btn btn-light btn-sm ms-2"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </div>
    </div>
</nav>

<!-- Dashboard -->
<div class="container my-5">
    <div class="card">
        <div class="header-bg">
            <h3 class="mb-0">${ngo.name}</h3>
            <p class="mb-1">${ngo.registrationNumber}</p>

            <span class="status-badge 
                <c:choose>
                    <c:when test='${ngo.status eq "VERIFIED"}'>trusted</c:when>
                    <c:otherwise>pending</c:otherwise>
                </c:choose>">
                ${ngo.status}
                <c:if test="${ngo.trustedBadge}"> | Trusted NGO</c:if>
            </span>
        </div>

        <div class="card-body">
            <div class="row mb-3">
                <div class="col-md-6">
                    <p><span class="info-label">Contact Person:</span> ${ngo.contactPerson}</p>
                    <p><span class="info-label">Email:</span> ${ngo.email}</p>
                    <p><span class="info-label">Phone:</span> ${ngo.phone}</p>
                </div>
                <div class="col-md-6">
                    <p><span class="info-label">Address:</span> ${ngo.address}, ${ngo.city}, ${ngo.state}</p>
                    <p><span class="info-label">Pincode:</span> ${ngo.pincode}</p>
                    <p><span class="info-label">Website:</span>
                        <a href="${ngo.website}" target="_blank">${ngo.website}</a>
                    </p>
                </div>
            </div>

            <hr>

            <div class="row">
                <div class="col-md-6">
                    <p><span class="info-label">Service Categories:</span> ${ngo.serviceCategories}</p>
                    <p><span class="info-label">Operating Regions:</span> ${ngo.operatingRegions}</p>
                </div>
                <div class="col-md-6">
                    <p><span class="info-label">Volunteers:</span> ${ngo.totalVolunteers}</p>
                    <p><span class="info-label">Staff:</span> ${ngo.totalStaff}</p>
                </div>
            </div>

            <hr>

            <!-- Uploaded Documents (your section kept as-is) -->
            <div class="docs-section mt-4">
                <h5 class="text-primary"><i class="bi bi-folder2-open"></i> Uploaded Documents</h5>
                <ul>
                    <c:forEach var="doc" items="${ngo.documents}">
                        <li>${doc.documentType}: 
                            <a href="/${doc.filePath}" target="_self" class="text-decoration-none text-success">
                                <i class="bi bi-file-earmark-text"></i> View
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>

            <div class="text-center mt-4 action-buttons">
                <a href="/ngo/profile/edit/${ngo.id}" class="btn btn-outline-primary me-2">
                    <i class="bi bi-pencil-square"></i> Edit Profile
                </a>
                <a href="/logout" class="btn btn-outline-danger">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </div>

        <footer>
            <small>© 2025 SKYSPL | Empowering NGOs & Volunteers</small>
        </footer>
    </div>
</div>
<div class="text-center mt-4">

        <!-- ADD THIS NEW BUTTON BELOW -->
      <a href="/ngo/requests" class="btn btn-success position-relative">
    <i class="bi bi-bell"></i> View Help Requests
    <c:if test="${not empty newRequestsCount}">
        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
            ${newRequestsCount}
        </span>
    </c:if>
</a>
    </div>
</div>

</body>
</html>
