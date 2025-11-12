<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - NGOs</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #1e88e5;
            color: white;
            padding: 20px 0;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 1px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .container {
            width: 90%;
            max-width: 1300px;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 30px 20px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
        }

        .btn-logout {
            display: inline-block;
            padding: 10px 25px;
            background-color: #e53935;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            float: right;
            margin-top: -60px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .btn-logout:hover { background-color: #b71c1c; }

        /* Toggle buttons */
        .toggle-buttons {
            text-align: center;
            margin-bottom: 30px;
        }

        .toggle-buttons button {
            background-color: #1e88e5;
            color: white;
            border: none;
            padding: 12px 30px;
            margin: 5px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .toggle-buttons button:hover {
            background-color: #1565c0;
        }

        .toggle-buttons button.active {
            background-color: #43a047;
        }

        /* Tables */
        .ngo-section {
            display: none;
            animation: fadeIn 0.4s ease-in-out;
        }

        .ngo-section.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            margin-bottom: 40px;
        }

        th, td {
            padding: 14px 18px;
            text-align: left;
        }

        th {
            background-color: #1e88e5;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        tr:nth-child(even) td { background-color: #f7f9fb; }
        tr:hover td { background-color: #e3f2fd; }

        /* Buttons inside table */
        .btn-approve {
            background-color: #43a047;
            color: white;
            border: none;
            padding: 6px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-reject {
            background-color: #e53935;
            color: white;
            border: none;
            padding: 6px 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn-approve:hover { background-color: #2e7d32; }
        .btn-reject:hover { background-color: #b71c1c; }

        @media screen and (max-width: 768px) {
            table, th, td {
                display: block;
                width: 100%;
            }
            th { display: none; }
            td {
                text-align: right;
                padding-left: 50%;
                position: relative;
            }
            td::before {
                content: attr(data-label);
                position: absolute;
                left: 20px;
                top: 15px;
                font-weight: bold;
                color: #555;
                text-transform: uppercase;
            }
        }
    </style>
</head>
<body>

<header>
    Admin Dashboard
</header>

<div class="container">
    <a href="${pageContext.request.contextPath}/logout" class="btn-logout">Logout</a>

    <!-- ======= Toggle Buttons ======= -->
    <div class="toggle-buttons">
        <button id="btnPending" class="active">Pending NGOs</button>
        <button id="btnApproved">Approved NGOs</button>
        <button id="btnRegistered">Registered NGOs</button>
        <button id="btnUsers">Users</button>
    </div>
    
 
    <!-- ======= Pending NGOs ======= -->
    <div id="sectionPending" class="ngo-section active">
        <h2>Pending NGOs</h2>
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Phone</th>
                <th>City</th><th>State</th><th>Status</th><th>Action</th>
            </tr>
            <c:forEach var="ngo" items="${ngos}">
                <c:if test="${ngo.status eq 'PENDING'}">
                    <tr>
                        <td data-label="ID">${ngo.id}</td>
                        <td data-label="Name">${ngo.name}</td>
                        <td data-label="Email">${ngo.email}</td>
                        <td data-label="Phone">${ngo.phone}</td>
                        <td data-label="City">${ngo.city}</td>
                        <td data-label="State">${ngo.state}</td>
                        <td data-label="Status">${ngo.status}</td>
                        <td data-label="Action">
                            <form action="${pageContext.request.contextPath}/admin/approveNgo" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${ngo.id}" />
                                <button type="submit" class="btn-approve">Approve</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/admin/rejectNgo" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${ngo.id}" />
                                <button type="submit" class="btn-reject">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>

    <!-- ======= Approved NGOs ======= -->
    <div id="sectionApproved" class="ngo-section">
        <h2>Approved NGOs</h2>
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Phone</th>
                <th>City</th><th>State</th><th>Status</th>
            </tr>
            <c:forEach var="ngo" items="${ngos}">
                <c:if test="${ngo.status eq 'APPROVED'}">
                    <tr>
                        <td>${ngo.id}</td>
                        <td>${ngo.name}</td>
                        <td>${ngo.email}</td>
                        <td>${ngo.phone}</td>
                        <td>${ngo.city}</td>
                        <td>${ngo.state}</td>
                        <td>${ngo.status}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>

    <!-- ======= Registered NGOs ======= -->
    <div id="sectionRegistered" class="ngo-section">
        <h2>All Registered NGOs</h2>
        <table>
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Phone</th>
                <th>City</th><th>State</th><th>Status</th><th>Trusted Badge</th><th>Registered At</th>
            </tr>
            <c:forEach var="ngo" items="${ngos}">
                <tr>
                    <td>${ngo.id}</td>
                    <td>${ngo.name}</td>
                    <td>${ngo.email}</td>
                    <td>${ngo.phone}</td>
                    <td>${ngo.city}</td>
                    <td>${ngo.state}</td>
                    <td>${ngo.status}</td>
                    <td>${ngo.trustedBadge ? 'Yes' : 'No'}</td>
                    <td>${ngo.registeredAt}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    
    <!-- ======= Users ======= -->
<div id="sectionUsers" class="ngo-section">
    <h2>Users</h2>
    <table>
        <tr>
            <th>ID</th><th>Full Name</th><th>Email</th><th>Role</th><th>Mobile</th>
            <th>City</th>
        </tr>
        <c:forEach var="u" items="${users}">
            <tr>
                <td data-label="ID">${u.id}</td>
                <td data-label="Full Name">${u.name}</td>
                <td data-label="Email">${u.email}</td>
                <td data-label="Role">${u.password}</td>
                <td data-label="Mobile">${u.phone}</td>
                <td data-label="City">${u.address}</td>
                
            </tr>
        </c:forEach>
    </table>
</div>
    
</div>


<!-- ======= JavaScript to Toggle Sections ======= -->
<script>
    const btnPending = document.getElementById('btnPending');
    const btnApproved = document.getElementById('btnApproved');
    const btnRegistered = document.getElementById('btnRegistered');
    
    const btnUsers      = document.getElementById('btnUsers');

    const sectionPending = document.getElementById('sectionPending');
    const sectionApproved = document.getElementById('sectionApproved');
    const sectionRegistered = document.getElementById('sectionRegistered');
    
    const sectionUsers      = document.getElementById('sectionUsers');

    function showSection(sectionToShow, activeBtn) {
        [sectionPending, sectionApproved, sectionRegistered].forEach(sec => sec.classList.remove('active'));
        sectionToShow.classList.add('active');

        [btnPending, btnApproved, btnRegistered].forEach(btn => btn.classList.remove('active'));
        activeBtn.classList.add('active');
    }

    btnPending.onclick = () => showSection(sectionPending, btnPending);
    btnApproved.onclick = () => showSection(sectionApproved, btnApproved);
    btnRegistered.onclick = () => showSection(sectionRegistered, btnRegistered);
    
    btnUsers.onclick      = () => showSection(sectionUsers, btnUsers);
</script>

</body>
</html>
