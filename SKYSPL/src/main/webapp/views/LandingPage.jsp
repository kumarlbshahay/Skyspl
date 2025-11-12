<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SKYSPL | Connect for Change</title>
<!-- Bootstrap + SweetAlert -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body {
background-color: #f9fbfd;
font-family: 'Segoe UI', sans-serif;
}
.navbar {
background: linear-gradient(90deg, #1e88e5, #42a5f5);
}
.navbar-brand {
font-weight: 700;
color: white !important;
font-size: 1.5rem;
}
.nav-link {
color: white !important;
margin-right: 1rem;
}
.nav-link:hover {
text-decoration: underline;
}
.hero-section {
background: url('https://media.istockphoto.com/id/638897808/photo/mercy-two-hands-silhouette-help-concept.jpg?s=612x612&w=0&k=20&c=Dl-bYm0s8wxxW7lCXHLBl61fpmJC2cIOQ-k1JVjQQDQ=') center/cover no-repeat;
color: white;
text-align: center;
padding: 120px 20px;
}
.hero-section h1 {
font-size: 3rem;
font-weight: bold;
}
.hero-section p {
font-size: 1.2rem;
max-width: 700px;
margin: auto;
}
.btn-join {
background-color: #ffca28;
color: #000;
font-weight: 600;
}
.opportunity-section {
padding: 60px 0;
}
.card img {
height: 200px;
object-fit: cover;
}
.card {
border: none;
box-shadow: 0 4px 15px rgba(0,0,0,0.1);
border-radius: 15px;
}
.card-title {
color: #1e88e5;
font-weight: 600;
}
footer {
background: #1e88e5;
color: white;
text-align: center;
padding: 20px 0;
}
#otpInput {
letter-spacing: 5px;
font-size: 1.3rem;
text-align: center;
font-weight: bold;
}
.btn-custom {
border-radius: 10px;
font-weight: 500;
transition: all 0.3s ease;
}
.btn-custom:hover {
transform: scale(1.05);
}
</style>
</head>
<body>
<!-- ======================= NAVBAR ======================= -->
<nav class="navbar navbar-expand-lg navbar-dark">
<div class="container">
  <a class="navbar-brand" href="#">SKYSPL</a>
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navmenu">
    <ul class="navbar-nav ms-auto">
      <li class="nav-item"><a href="#ngos" class="nav-link">NGOs</a></li>
      <li class="nav-item"><a href="#projects" class="nav-link">Projects</a></li>
      <li class="nav-item"><a href="#about" class="nav-link">About Us</a></li>
      <li class="nav-item">
        <button class="btn btn-outline-light me-2" data-bs-toggle="modal" data-bs-target="#loginTypeModal">Login</button>
        <button class="btn btn-outline-light me-2" data-bs-toggle="modal" data-bs-target="#accountTypeModal">Register</button>
      </li>
    </ul>
  </div>
</div>
</nav>
<!-- ======================= HERO SECTION ======================= -->
<section class="hero-section">
<div class="container">
  <h1>Connecting Users & NGOs for a Better Tomorrow</h1>
  <p>Join SKYSPL today and become part of a growing network empowering change across communities.</p>
  <button class="btn btn-light btn-lg mt-3" data-bs-toggle="modal" data-bs-target="#accountTypeModal">Get Started</button>
</div>
</section>
<!-- ======================= OPPORTUNITY SECTION ======================= -->
<section class="opportunity-section" id="projects">
<div class="container">
  <h2 class="text-center mb-5 text-primary fw-bold">Opportunities to help</h2>
  <div class="row g-4">
    <div class="col-md-4">
      <div class="card">
        <img src="https://images.unsplash.com/photo-1753892208880-7032f44ad6ea?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1170" class="card-img-top">
        <div class="card-body text-center">
          <h5 class="card-title">Teach Underprivileged Kids</h5>
          <p class="card-text">Spend your weekends helping children learn basic subjects and life skills.</p>
          <button class="btn btn-light btn-lg mt-3" data-bs-toggle="modal" data-bs-target="#accountTypeModal">View & Apply</button>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <img src="https://images.unsplash.com/photo-1509099836639-18ba1795216d?auto=format&fit=crop&w=800&q=80" class="card-img-top">
        <div class="card-body text-center">
          <h5 class="card-title">Tree Plantation Drive</h5>
          <p class="card-text">Join us in making the city greener and cleaner by planting trees in local parks.</p>
          <button class="btn btn-light btn-lg mt-3" data-bs-toggle="modal" data-bs-target="#accountTypeModal">View & Apply</button>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <img src="https://images.unsplash.com/photo-1609139010253-40ad2ad5216d?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1171" class="card-img-top">
        <div class="card-body text-center">
          <h5 class="card-title">Food Distribution</h5>
          <p class="card-text">Be part of our initiative to provide meals to the homeless every weekend.</p>
          <button class="btn btn-light btn-lg mt-3" data-bs-toggle="modal" data-bs-target="#accountTypeModal">View & Apply</button>
        </div>
      </div>
    </div>
  </div>
</div>
</section>
<!-- ======================= FOOTER ======================= -->
<footer>
<p>© 2025 SKYSPL | Empowering NGOs & Volunteers</p>
</footer>
<!-- ======================================================== -->
<!-- ALL MODALS AND JS MERGED FROM YOUR CODE -->
<!-- ======================================================== -->
<!-- (Same modal content from your earlier code block) -->
<!-- Account Type Modal -->
<div class="modal fade" id="accountTypeModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content">
    <div class="modal-header bg-primary text-white">
      <h5 class="modal-title">Join our community of changemakers</h5>
      <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
    </div>
    <div class="modal-body text-center">
      <p class="mb-4">Select an account type</p>
      <div class="d-flex justify-content-around mb-3">
        <button class="btn btn-outline-primary btn-lg w-50 me-2" id="chooseUser">User</button>
        <button class="btn btn-outline-primary btn-lg w-50" id="chooseNgo">NGO</button>
      </div>
      <button class="btn btn-secondary mt-3" data-bs-dismiss="modal">Cancel</button>
    </div>
  </div>
</div>
</div>
<!-- LOGIN TYPE MODAL -->
<div class="modal fade" id="loginTypeModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content">
    <div class="modal-header bg-primary text-white">
      <h5 class="modal-title">Login as</h5>
      <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
    </div>
    <div class="modal-body text-center">
      <p class="mb-4">Select login type</p>
      <div class="d-flex justify-content-around mb-3">
        <button class="btn btn-outline-primary btn-lg w-50 me-2" id="loginUserBtn">User</button>
        <button class="btn btn-outline-primary btn-lg w-50" id="loginNgoBtn">NGO</button>
      </div>
      <button class="btn btn-secondary mt-3" data-bs-dismiss="modal">Cancel</button>
    </div>
  </div>
</div>
</div>
<!-- USER REGISTER MODAL -->
<div class="modal fade" id="userRegisterModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content">
    <div class="modal-header bg-primary text-white">
      <h5 class="modal-title">User Registration</h5>
      <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
    </div>
    <div class="modal-body">
      <form id="userRegisterForm">
        <div id="registerFields">
          <div class="mb-3"><label>Full Name</label>
            <input type="text" name="name" class="form-control" required placeholder="Enter full name"></div>
          <div class="mb-3"><label>Email</label>
            <input type="email" name="email" class="form-control" required placeholder="Enter email"></div>
          <div class="mb-3"><label>Password</label>
            <input type="password" name="password" class="form-control" required placeholder="Create password"></div>
          <div class="mb-3"><label>Phone</label>
            <input type="text" name="phone" class="form-control" placeholder="Enter phone number"></div>
          <div class="mb-3"><label>Address</label>
            <input type="text" name="address" class="form-control" placeholder="Enter address"></div>
          <div class="d-grid"><button type="submit" class="btn btn-primary">Send OTP</button></div>
        </div>
        <div id="otpSection" style="display:none;">
          <div class="mb-3 mt-3"><label>Enter OTP</label>
            <input type="text" id="otpInput" class="form-control" placeholder="Enter OTP sent to your email"></div>
          <div class="d-grid"><button type="button" id="verifyOtpBtn" class="btn btn-primary">Verify OTP</button></div>
        </div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- ======================= NGO REGISTER MODAL (Updated Full Form) ======================= -->
<div class="modal fade" id="ngoRegisterModal" tabindex="-1" aria-labelledby="ngoRegisterModalLabel" aria-hidden="true">
 <div class="modal-dialog modal-xl modal-dialog-scrollable">
   <div class="modal-content">
     <div class="modal-header bg-primary text-white">
       <h5 class="modal-title" id="ngoRegisterModalLabel">NGO Registration - SKYSPL</h5>
       <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
     </div>
     <div class="modal-body">
       <form action="${pageContext.request.contextPath}/ngo/register" method="post" enctype="multipart/form-data" id="ngoRegisterForm">
         <!-- Basic Info -->
         <div class="row">
           <div class="col-md-6 mb-3">
             <label>Name:</label>
             <input type="text" name="name" class="form-control" required />
           </div>
           <div class="col-md-6 mb-3">
             <label>Registration Number:</label>
             <input type="text" name="registrationNumber" class="form-control" required />
           </div>
           <div class="col-md-6 mb-3">
             <label>PAN Number:</label>
             <input type="text" name="panNumber" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Darpan ID:</label>
             <input type="text" name="darpanId" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Upload Registration Certificate:</label>
             <input type="file" name="certificateFile" class="form-control" required />
           </div>
           <div class="col-md-6 mb-3">
             <label>Upload PAN Document:</label>
             <input type="file" name="panFile" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Upload Darpan Document:</label>
             <input type="file" name="darpanFile" class="form-control" />
           </div>
         </div>
         <hr>
         <!-- Contact Info -->
         <h6 class="text-primary fw-bold">Contact Information</h6>
         <div class="row">
           <div class="col-md-6 mb-3">
             <label>Contact Person:</label>
             <input type="text" name="contactPerson" class="form-control" required />
           </div>
           <div class="col-md-6 mb-3">
             <label>Designation:</label>
             <input type="text" name="designation" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Email:</label>
             <input type="email" name="email" class="form-control" required />
           </div>
           <div class="col-md-6 mb-3">
             <label>Phone:</label>
             <input type="text" name="phone" class="form-control" required />
           </div>
           <div class="col-md-6 mb-3">
             <label>Alternate Phone:</label>
             <input type="text" name="alternatePhone" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Website:</label>
             <input type="text" name="website" class="form-control" />
           </div>
           <div class="col-md-12 mb-3">
             <label>Address:</label>
             <input type="text" name="address" class="form-control" required />
           </div>
           <div class="col-md-4 mb-3">
             <label>City:</label>
             <input type="text" name="city" class="form-control" required />
           </div>
           <div class="col-md-4 mb-3">
             <label>State:</label>
             <input type="text" name="state" class="form-control" required />
           </div>
           <div class="col-md-4 mb-3">
             <label>Pincode:</label>
             <input type="text" name="pincode" class="form-control" required />
           </div>
         </div>
         <hr>
         <!-- Banking Info -->
         <h6 class="text-primary fw-bold">Banking Details</h6>
         <div class="row">
           <div class="col-md-6 mb-3">
             <label>Bank Account Number:</label>
             <input type="text" name="bankAccountNumber" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Bank IFSC:</label>
             <input type="text" name="bankIFSC" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Bank Name:</label>
             <input type="text" name="bankName" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Bank Branch:</label>
             <input type="text" name="bankBranch" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Account Type:</label>
             <input type="text" name="accountType" class="form-control" />
           </div>
         </div>
         <hr>
         <!-- Operational Scope -->
         <h6 class="text-primary fw-bold">Operational Scope</h6>
         <div class="row">
           <div class="col-md-6 mb-3">
             <label>Service Categories (comma-separated):</label>
             <input type="text" name="serviceCategories" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Operating Regions:</label>
             <input type="text" name="operatingRegions" class="form-control" />
           </div>
           <div class="col-md-4 mb-3">
             <label>Total Volunteers:</label>
             <input type="number" name="totalVolunteers" class="form-control" />
           </div>
           <div class="col-md-4 mb-3">
             <label>Total Staff:</label>
             <input type="number" name="totalStaff" class="form-control" />
           </div>
           <div class="col-md-4 mb-3">
             <label>Years of Operation:</label>
             <input type="text" name="yearsOfOperation" class="form-control" />
           </div>
         </div>
         <hr>
         <!-- Location Coordinates -->
         <h6 class="text-primary fw-bold">Location</h6>
         <div class="row">
           <div class="col-md-6 mb-3">
             <label>Latitude:</label>
             <input type="text" name="latitude" class="form-control" />
           </div>
           <div class="col-md-6 mb-3">
             <label>Longitude:</label>
             <input type="text" name="longitude" class="form-control" />
           </div>
         </div>
         <hr>
         <!-- Audit Info -->
         <div class="mb-3">
           <label>Updated By:</label>
           <input type="text" name="updatedBy" class="form-control" />
         </div>
         <div class="d-grid mt-3">
           <button type="submit" class="btn btn-primary btn-lg">Register NGO</button>
         </div>
       </form>
     </div>
   </div>
 </div>
</div>
<!-- LOGIN MODALS -->
<div class="modal fade" id="userLoginModal" tabindex="-1">
<div class="modal-dialog modal-dialog-centered">
  <div class="modal-content">
    <div class="modal-header bg-primary text-white">
      <h5 class="modal-title">User Login</h5>
      <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
    </div>
    <div class="modal-body">
      <form id="userLoginForm">
        <div class="mb-3"><label>Email</label><input type="email" name="email" class="form-control" required></div>
        <div class="mb-3"><label>Password</label><input type="password" name="password" class="form-control" required></div>
        <div class="d-grid"><button type="submit" class="btn btn-primary">Login</button></div>
      </form>
    </div>
  </div>
</div>
</div>
<!-- NGO LOGIN MODAL (UPDATED: DARPAN ID ONLY) -->
<!-- NGO LOGIN MODAL (EMAIL OR DARPAN ID) -->
<div class="modal fade" id="ngoLoginModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title">NGO Login</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <form id="ngoLoginForm">
          <div class="mb-3">
            <label class="form-label">Email (optional)</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your NGO email">
          </div>

          <div class="text-center mb-2 fw-bold text-secondary">— OR —</div>

          <div class="mb-3">
            <label class="form-label">DARPAN ID (optional)</label>
            <input type="text" name="darpanId" class="form-control" placeholder="e.g. KA/2024/12345">
          </div>

          <div class="d-grid mt-3">
            <button type="submit" class="btn btn-primary">Login NGO</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>


<!-- ======================= JS Section ======================= -->
<script>
// Register modals toggling
document.getElementById("chooseUser").onclick = ()=>{bootstrap.Modal.getInstance(document.getElementById("accountTypeModal")).hide();new bootstrap.Modal(document.getElementById("userRegisterModal")).show();};
document.getElementById("chooseNgo").onclick = ()=>{bootstrap.Modal.getInstance(document.getElementById("accountTypeModal")).hide();new bootstrap.Modal(document.getElementById("ngoRegisterModal")).show();};
document.getElementById("loginUserBtn").onclick = ()=>{bootstrap.Modal.getInstance(document.getElementById("loginTypeModal")).hide();new bootstrap.Modal(document.getElementById("userLoginModal")).show();};
document.getElementById("loginNgoBtn").onclick = ()=>{bootstrap.Modal.getInstance(document.getElementById("loginTypeModal")).hide();new bootstrap.Modal(document.getElementById("ngoLoginModal")).show();};
// OTP send
document.getElementById("userRegisterForm").onsubmit = e=>{
e.preventDefault();
const email = e.target.email.value;
fetch('/user/send-otp',{method:'POST',body:new URLSearchParams({email})})
.then(r=>r.json()).then(d=>{
  if(d.status==='success'){
    Swal.fire('OTP Sent!','OTP sent to '+email,'success');
    document.getElementById("registerFields").style.display="none";
    document.getElementById("otpSection").style.display="block";
  }else Swal.fire('Error!',d.message,'error');
});
};
// OTP verify
document.getElementById("verifyOtpBtn").onclick=()=>{
const otp=document.getElementById("otpInput").value.trim();
if(!otp)return Swal.fire('Warning!','Please enter OTP.','warning');
const f=document.getElementById("userRegisterForm");
const fd=new FormData(f);fd.append("otp",otp);
const params=new URLSearchParams();for(let[k,v]of fd.entries())params.append(k,v);
fetch('/user/verify-otp',{method:'POST',headers:{'Content-Type':'application/x-www-form-urlencoded'},body:params})
.then(r=>r.json()).then(res=>{
  if(res.status==='success'){Swal.fire('Success!',res.message,'success');f.reset();
    document.getElementById("registerFields").style.display="block";document.getElementById("otpSection").style.display="none";
    bootstrap.Modal.getInstance(document.getElementById('userRegisterModal')).hide();}
  else Swal.fire('Error!',res.message,'error');
});
};
// NGO register
document.getElementById("ngoRegisterForm").onsubmit=e=>{
e.preventDefault();fetch('/ngo/register',{method:'POST',body:new FormData(e.target)})
.then(r=>r.json()).then(d=>{Swal.fire({icon:d.status==='success'?'success':'error',title:d.status==='success'?'NGO Registered!':'Error!',text:d.message});
if(d.status==='success'){e.target.reset();bootstrap.Modal.getInstance(document.getElementById('ngoRegisterModal')).hide();}});
};
// User login
document.getElementById("userLoginForm").onsubmit=e=>{
e.preventDefault();fetch('/user/login',{method:'POST',body:new FormData(e.target)})
.then(r=>r.json()).then(d=>{if(d.status==='success'){Swal.fire('Welcome!',d.message,'success').then(()=>{window.location='/user/home';});}
else Swal.fire('Login Failed!',d.message,'error');});};
//NGO login using Email or DARPAN ID
document.getElementById("ngoLoginForm").onsubmit = e => {
  e.preventDefault();

  const formData = new FormData(e.target);
  const email = formData.get("email")?.trim();
  const darpanId = formData.get("darpanId")?.trim();

  // Validate input
  if (!email && !darpanId) {
    Swal.fire("Warning!", "Please enter either Email or DARPAN ID.", "warning");
    return;
  }

  fetch("/ngo/login", {
    method: "POST",
    body: formData
  })
    .then(res => res.json())
    .then(data => {
    	if (data.status === "success") {
    		  Swal.fire("Welcome NGO!", data.message, "success").then(() => {
    		    window.location = "/ngo/dashboard/" + data.id;
    		  });
    		}
 else {
        Swal.fire("Login Failed!", data.message, "error");
      }
    })
    .catch(() => {
      Swal.fire("Error", "Something went wrong. Please try again later.", "error");
    });
};


</script>
</body>
</html>

