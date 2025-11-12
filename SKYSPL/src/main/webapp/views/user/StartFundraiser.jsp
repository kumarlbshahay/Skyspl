<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.demo.main.model.User" %>
<%
User u = (User) session.getAttribute("user");
if (u == null) {
    response.sendRedirect("/");
    return;
}
String ctx = request.getContextPath();
String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Start a Free Fundraiser | SkySpl Crowdfunding</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<style>
:root {
  --brand: #00b686;
  --brand-dark: #00634d;
}
body {
  font-family: 'Poppins', sans-serif;
  background-color: #f9fdfb;
  color: #1f2937;
}
.navbar { background: var(--brand); }
.navbar-brand img { height: 40px; border-radius: 8px; margin-right: .5rem; }
.btn-brand { background: var(--brand); color: #fff; border: none; }
.btn-brand:hover { background: var(--brand-dark); }
.form-section {
  background: #fff;
  border-radius: 15px;
  padding: 40px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.05);
  margin-top: 40px;
}
.form-section h2 { color: var(--brand-dark); font-weight: 700; margin-bottom: 20px; }
.form-label { font-weight: 500; }
footer {
  background: #012d24;
  color: #cfeae2;
  padding: 40px 0;
  text-align: center;
  margin-top: 60px;
}
.hidden { display: none; }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand d-flex align-items-center" href="<%=ctx%>/user/home">
      <img src="<%=ctx%>/images/logo.png" alt="Logo"> SkySpl Fundraising
    </a>
    <div class="d-flex align-items-center gap-3">
      <span class="text-white-50 d-none d-md-inline">Welcome, <strong><%=u.getName()%></strong></span>
      <a href="<%=ctx%>/user/logout" class="btn btn-light btn-sm"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </div>
  </div>
</nav>

<!-- FORM SECTION -->
<div class="container">
  <div class="form-section">
    <h2><i class="bi bi-heart-fill text-success"></i> Start a Free Fundraiser</h2>
    <p class="text-muted mb-4">Select your fundraiser type and fill in the details below to begin your campaign.</p>

    <!-- ✅ Message -->
    <% if (message != null) { %>
      <div class="alert alert-info text-center fw-semibold"><%= message %></div>
    <% } %>

    <!-- Select Category -->
    <div class="mb-4">
      <label class="form-label">Choose Fundraiser Category</label>
      <select id="fundCategory" class="form-select" required>
        <option value="">-- Select Category --</option>
        <option value="medical">🏥 Medical & Health Emergencies</option>
        <option value="education">🎓 Education & Student Support</option>
        <option value="food">🍱 Food & Hunger Relief</option>
        <option value="elderly">👵 Elderly Care & Senior Support</option>
        <option value="others">❤️ Others / Personal Causes</option>
      </select>
    </div>

    <div class="alert alert-success fade show mb-4 hidden" id="categoryHint"></div>

    <!-- ✅ Main Form -->
    <form id="fundraiserForm" action="<%=ctx%>/fundraiser/save" method="post" enctype="multipart/form-data">
      <input type="hidden" name="category" id="selectedCategory"><!-- ✅ Hidden category value -->

      <!-- 🏥 MEDICAL -->
      <div id="medicalForm" class="hidden">
        <h5 class="mb-3 text-success"><i class="bi bi-hospital"></i> Medical & Health Emergencies</h5>
        <div class="row g-3">
          <div class="col-md-6"><label class="form-label">Patient Name</label>
            <input type="text" name="patientName" class="form-control"></div>
          <div class="col-md-6"><label class="form-label">Health Issue / Treatment</label>
            <input type="text" name="treatmentType" class="form-control"></div>
          <div class="col-md-6"><label class="form-label">Hospital Name</label>
            <input type="text" name="hospital" class="form-control"></div>
          <div class="col-md-6"><label class="form-label">City</label>
            <input type="text" name="city" class="form-control"></div>
        </div>
      </div>

      <!-- 🎓 EDUCATION -->
      <div id="educationForm" class="hidden">
        <h5 class="mb-3 text-primary"><i class="bi bi-book"></i> Education & Student Support</h5>
        <div class="row g-3">
          <div class="col-md-6"><label class="form-label">Student Name</label>
            <input type="text" name="studentName" class="form-control"></div>
          <div class="col-md-6"><label class="form-label">Institution / College</label>
            <input type="text" name="institution" class="form-control"></div>
          <div class="col-md-6"><label class="form-label">Purpose</label>
            <input type="text" name="educationPurpose" class="form-control"></div>
        </div>
      </div>

      <!-- 🍱 FOOD -->
      <div id="foodForm" class="hidden">
        <h5 class="mb-3 text-warning"><i class="bi bi-egg-fried"></i> Food & Hunger Relief</h5>
        <div class="row g-3">
          <div class="col-md-6"><label class="form-label">Campaign Name</label>
            <input type="text" name="foodCampaign" class="form-control"></div>
          <div class="col-md-6"><label class="form-label">Location / Area</label>
            <input type="text" name="foodLocation" class="form-control"></div>
        </div>
      </div>

      <!-- 👵 ELDERLY -->
      <div id="elderlyForm" class="hidden">
        <h5 class="mb-3 text-secondary"><i class="bi bi-person-heart"></i> Elderly Care & Senior Support</h5>
        <div class="row g-3">
          <div class="col-md-6"><label class="form-label">Elder / Home Name</label>
            <input type="text" name="elderName" class="form-control"></div>
          <div class="col-md-6"><label class="form-label">Purpose</label>
            <input type="text" name="elderPurpose" class="form-control"></div>
        </div>
      </div>

      <!-- ❤️ OTHERS -->
      <div id="othersForm" class="hidden">
        <h5 class="mb-3 text-danger"><i class="bi bi-heart"></i> Other / Personal Causes</h5>
        <div class="mb-3">
          <label class="form-label">Cause Title</label>
          <input type="text" name="causeTitle" class="form-control">
        </div>
      </div>

      <hr class="my-4">

      <!-- Common Fields -->
      <div class="row g-3">
        <div class="col-md-6"><label class="form-label">Goal Amount (₹)</label>
          <input type="number" name="goalAmount" class="form-control" required></div>
        <div class="col-md-6"><label class="form-label">Duration (Days)</label>
          <input type="number" name="duration" class="form-control" required></div>
      </div>

      <div class="mb-3 mt-4">
        <label class="form-label">Story / Description</label>
        <textarea name="story" class="form-control" rows="5"></textarea>
      </div>

      <div class="mb-3">
        <label class="form-label">Upload Photos / Documents</label>
        <input type="file" name="documents" class="form-control" accept="image/*" multiple>
      </div>

      <div class="row g-3">
        <div class="col-md-6"><label class="form-label">Contact Number</label>
          <input type="text" name="contact" class="form-control" required></div>
        <div class="col-md-6"><label class="form-label">Email ID</label>
          <input type="email" name="email" class="form-control" required></div>
      </div>

      <div class="text-center mt-5">
        <button type="submit" class="btn btn-brand btn-lg px-5">
          <i class="bi bi-upload"></i> Submit Fundraiser
        </button>
      </div>
    </form>
  </div>
</div>

<footer>
  <div class="container">
    <p>© <%=java.time.Year.now()%> SkySpl | Empowering Hope</p>
  </div>
</footer>

<script>
document.addEventListener("DOMContentLoaded", function() {
  const select = document.getElementById("fundCategory");
  const hint = document.getElementById("categoryHint");
  const hiddenCategory = document.getElementById("selectedCategory");
  const forms = ["medicalForm","educationForm","foodForm","elderlyForm","othersForm"];

  const messages = {
    medical: "Include hospital details, diagnosis, and treatment cost.",
    education: "Mention institution name and fee details for clarity.",
    food: "Describe how you’ll use the funds to provide meals.",
    elderly: "Mention the senior citizens or old-age home you’ll support.",
    others: "Explain your cause clearly to inspire donors."
  };

  select.addEventListener("change", () => {
    forms.forEach(id => {
      const form = document.getElementById(id);
      form.classList.add("hidden");
      form.querySelectorAll("input").forEach(inp => inp.disabled = true);
    });

    const value = select.value;
    hiddenCategory.value = value;

    if (value) {
      const activeForm = document.getElementById(value + "Form");
      activeForm.classList.remove("hidden");
      activeForm.querySelectorAll("input").forEach(inp => inp.disabled = false);
      hint.classList.remove("hidden");
      hint.innerHTML = `<i class='bi bi-lightbulb'></i> ${messages[value]}`;
    } else {
      hint.classList.add("hidden");
      hiddenCategory.value = "";
    }
  });
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
