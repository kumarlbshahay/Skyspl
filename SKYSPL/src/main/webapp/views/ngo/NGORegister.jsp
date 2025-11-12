<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/views/includes/header.jsp" %>

<html>
<head>
    <title>NGO Registration</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/assets/style.css" />
</head>
<body>
    <div class="container">
        <h2>Register Your NGO</h2>
        <p class="note">You must give all the original documents</p>


   <form action="${pageContext.request.contextPath}/ngo/register" method="post" enctype="multipart/form-data">

         <!-- Basic Info -->
        <label>Name:</label><input type="text" name="name" required /><br/>
        <label>Registration Number:</label><input type="text" name="registrationNumber" required /><br/>
        <label>PAN Number:</label><input type="text" name="panNumber" /><br/>
        <label>Darpan ID:</label><input type="text" name="darpanId" /><br/>
        <label>Upload Registration Certificate:</label><input type="file" name="certificateFile" required /><br/>
        <label>Upload PAN Document:</label><input type="file" name="panFile" /><br/>
        <label>Upload Darpan Document:</label><input type="file" name="darpanFile" /><br/>
        <!-- Contact Info -->
        <label>Contact Person:</label><input type="text" name="contactPerson" required /><br/>
        <label>Designation:</label><input type="text" name="designation" /><br/>
        <label>Email:</label><input type="email" name="email" required /><br/>
        <label>Phone:</label><input type="text" name="phone" required /><br/>
        <label>Alternate Phone:</label><input type="text" name="alternatePhone" /><br/>
        <label>Website:</label><input type="text" name="website" /><br/>
        <label>Address:</label><input type="text" name="address" required /><br/>
        <label>City:</label><input type="text" name="city" required /><br/>
        <label>State:</label><input type="text" name="state" required /><br/>
        <label>Pincode:</label><input type="text" name="pincode" required /><br/>

        <!-- Banking Info -->
        <label>Bank Account Number:</label><input type="text" name="bankAccountNumber" /><br/>
        <label>Bank IFSC:</label><input type="text" name="bankIFSC" /><br/>
        <label>Bank Name:</label><input type="text" name="bankName" /><br/>
        <label>Bank Branch:</label><input type="text" name="bankBranch" /><br/>
        <label>Account Type:</label><input type="text" name="accountType" /><br/>

        <!-- Operational Scope -->
        <label>Service Categories (comma-separated):</label><input type="text" name="serviceCategories" /><br/>
        <label>Operating Regions:</label><input type="text" name="operatingRegions" /><br/>
        <label>Total Volunteers:</label><input type="number" name="totalVolunteers" /><br/>
        <label>Total Staff:</label><input type="number" name="totalStaff" /><br/>
        <label>Years of Operation:</label><input type="text" name="yearsOfOperation" /><br/>

        <!-- Location Coordinates -->
        <label>Latitude:</label><input type="text" name="latitude" /><br/>
        <label>Longitude:</label><input type="text" name="longitude" /><br/>

        <!-- Audit Info -->
        <label>Updated By:</label><input type="text" name="updatedBy" /><br/>

        <input type="submit" value="Register NGO" />
    </form>
    </div>
</body>
</html>

