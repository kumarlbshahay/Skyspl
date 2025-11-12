<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit NGO Profile | SKYSPL</title>
    
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

        .form-card {
            background: #fff;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            margin-top: 40px;
        }

        .form-label {
            font-weight: 600;
            color: #333;
        }

        .btn-custom {
            border-radius: 10px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            transform: scale(1.03);
        }

        footer {
            margin-top: 40px;
            background-color: #1e88e5;
            color: white;
            text-align: center;
            padding: 15px 0;
            border-radius: 0 0 15px 15px;
        }

        hr {
            margin: 2rem 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">SKYSPL NGO Portal</a>
        <div class="ms-auto">
            <a href="/ngo/dashboard/${ngo.id}" class="btn btn-outline-light btn-sm">
                <i class="bi bi-arrow-left"></i> Back to Dashboard
            </a>
            <a href="/logout" class="btn btn-light btn-sm ms-2">
                <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>
</nav>

<!-- Edit NGO Profile Form -->
<div class="container">
    <div class="form-card">
        <h3 class="text-center text-primary mb-4">
            <i class="bi bi-pencil-square"></i> Edit NGO Profile
        </h3>

        <form action="${pageContext.request.contextPath}/ngo/update" method="post">
            <input type="hidden" name="id" value="${ngo.id}"/>

            <!-- Basic Details -->
            <h5 class="text-success">Basic Information</h5>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">NGO Name</label>
                    <input type="text" name="name" class="form-control" value="${ngo.name}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Registration Number</label>
                    <input type="text" name="registrationNumber" class="form-control" value="${ngo.registrationNumber}" readonly>
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">PAN Number</label>
                    <input type="text" name="panNumber" class="form-control" value="${ngo.panNumber}">
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">Darpan ID</label>
                    <input type="text" name="darpanId" class="form-control" value="${ngo.darpanId}">
                </div>
            </div>

            <hr>

            <!-- Contact Info -->
            <h5 class="text-success">Contact Information</h5>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Contact Person</label>
                    <input type="text" name="contactPerson" class="form-control" value="${ngo.contactPerson}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Designation</label>
                    <input type="text" name="designation" class="form-control" value="${ngo.designation}">
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" value="${ngo.email}" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">Phone</label>
                    <input type="text" name="phone" class="form-control" value="${ngo.phone}" required>
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">Alternate Phone</label>
                    <input type="text" name="alternatePhone" class="form-control" value="${ngo.alternatePhone}">
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">Website</label>
                    <input type="text" name="website" class="form-control" value="${ngo.website}">
                </div>
            </div>

            <hr>

            <!-- Address -->
            <h5 class="text-success">Address Details</h5>
            <div class="row mb-3">
                <div class="col-md-12">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" class="form-control" value="${ngo.address}" required>
                </div>
                <div class="col-md-4 mt-3">
                    <label class="form-label">City</label>
                    <input type="text" name="city" class="form-control" value="${ngo.city}">
                </div>
                <div class="col-md-4 mt-3">
                    <label class="form-label">State</label>
                    <input type="text" name="state" class="form-control" value="${ngo.state}">
                </div>
                <div class="col-md-4 mt-3">
                    <label class="form-label">Pincode</label>
                    <input type="text" name="pincode" class="form-control" value="${ngo.pincode}">
                </div>
            </div>

            <hr>

            <!-- Banking Info -->
            <h5 class="text-success">Banking Information</h5>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Bank Account Number</label>
                    <input type="text" name="bankAccountNumber" class="form-control" value="${ngo.bankAccountNumber}">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Bank IFSC</label>
                    <input type="text" name="bankIFSC" class="form-control" value="${ngo.bankIFSC}">
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">Bank Name</label>
                    <input type="text" name="bankName" class="form-control" value="${ngo.bankName}">
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">Bank Branch</label>
                    <input type="text" name="bankBranch" class="form-control" value="${ngo.bankBranch}">
                </div>
                <div class="col-md-6 mt-3">
                    <label class="form-label">Account Type</label>
                    <input type="text" name="accountType" class="form-control" value="${ngo.accountType}">
                </div>
            </div>

            <hr>

            <!-- Operational Info -->
            <h5 class="text-success">Operational Details</h5>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Service Categories</label>
                    <input type="text" name="serviceCategories" class="form-control" value="${ngo.serviceCategories}">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Operating Regions</label>
                    <input type="text" name="operatingRegions" class="form-control" value="${ngo.operatingRegions}">
                </div>
                <div class="col-md-4 mt-3">
                    <label class="form-label">Total Volunteers</label>
                    <input type="number" name="totalVolunteers" class="form-control" value="${ngo.totalVolunteers}">
                </div>
                <div class="col-md-4 mt-3">
                    <label class="form-label">Total Staff</label>
                    <input type="number" name="totalStaff" class="form-control" value="${ngo.totalStaff}">
                </div>
                <div class="col-md-4 mt-3">
                    <label class="form-label">Years of Operation</label>
                    <input type="text" name="yearsOfOperation" class="form-control" value="${ngo.yearsOfOperation}">
                </div>
            </div>

            <hr>

            <!-- Location -->
            <h5 class="text-success">Location Coordinates</h5>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Latitude</label>
                    <input type="text" name="latitude" class="form-control" value="${ngo.latitude}">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Longitude</label>
                    <input type="text" name="longitude" class="form-control" value="${ngo.longitude}">
                </div>
            </div>

            <hr>

            <div class="mb-3">
                <label class="form-label">Updated By</label>
                <input type="text" name="updatedBy" class="form-control" value="${ngo.updatedBy}">
            </div>

            <!-- Buttons -->
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary btn-lg btn-custom">
                    <i class="bi bi-check-circle"></i> Save Changes
                </button>
                <a href="/ngo/dashboard/${ngo.id}" class="btn btn-secondary btn-lg btn-custom ms-3">
                    <i class="bi bi-x-circle"></i> Cancel
                </a>
            </div>
        </form>
    </div>
</div>

<footer>
    <small>© 2025 SKYSPL | Empowering NGOs & Volunteers</small>
</footer>

</body>
</html>
