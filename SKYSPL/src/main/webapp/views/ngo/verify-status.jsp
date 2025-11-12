<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Registration Status</title>
</head>
<body>
    <h2>Registration Submitted Successfully</h2>
    <p>${message}</p>

    <h3>NGO Details</h3>
    <ul>
        <li>Name: ${ngo.name}</li>
        <li>Contact Person: ${ngo.contactPerson}</li>
        <li>Email: ${ngo.email}</li>
        <li>Phone: ${ngo.phone}</li>
        <li>City: ${ngo.city}</li>
        <li>State: ${ngo.state}</li>
        <li>Status: ${ngo.status}</li>
    </ul>

    <p>We’ve sent a confirmation email to your registered address. Our admin team will verify your documents shortly.</p>
</body>
</html>
