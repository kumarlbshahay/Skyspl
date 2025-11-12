<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.demo.main.model.User" %>
<%
User u = (User) session.getAttribute("user");
if (u == null) {
    response.sendRedirect("/");
    return;
}
String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SkySpl Fundraising | Medical Crowdfunding</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
:root {
  --brand: #00b686;
  --brand-dark: #00634d;
  --light: #f0fff9;
  --muted: #6b7280;
}
body {
  font-family: 'Poppins', sans-serif;
  background: #f9fdfb;
  color: #1f2937;
}
.navbar {
  background: var(--brand);
}
.navbar-brand img {
  height: 40px;
  border-radius: 8px;
  margin-right: .5rem;
}
.btn-brand {
  background: var(--brand);
  color: #fff;
  border: none;
}
.btn-brand:hover {
  background: var(--brand-dark);
}

/* Hero */
.hero {
  background: linear-gradient(120deg, #aef1d3, #e0fff1);
  position: relative;
  border-radius: 20px;
  overflow: hidden;
  text-align: left;
}
.hero img {
  max-width: 450px;
  position: absolute;
  right: 5%;
  bottom: 0;
}
.hero-content {
  padding: 100px 50px;
  max-width: 600px;
}
.hero h1 {
  font-weight: 800;
  font-size: 2.7rem;
  color: #05391f;
}
.hero p {
  color: #06472b;
  font-size: 1.2rem;
}
.stats-bar {
  background: #fff;
  border-radius: 15px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 20px;
  margin-top: -40px;
  position: relative;
  z-index: 5;
}

/* Cards */
.card-fund {
  border: none;
  background: #fff;
  border-radius: 16px;
  padding: 25px;
  text-align: center;
  transition: .3s;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}
.card-fund:hover {
  transform: translateY(-4px);
  box-shadow: 0 6px 20px rgba(0,0,0,0.1);
}
.card-fund i {
  font-size: 48px;
  color: var(--brand);
}

/* Sections */
.section-title {
  text-align: center;
  font-weight: 700;
  margin-bottom: 10px;
}
.section-sub {
  text-align: center;
  color: var(--muted);
  margin-bottom: 40px;
}

/* How Works */
.how-section {
  background: #fff;
  border-radius: 20px;
  padding: 60px 30px;
}
.step-num {
  font-weight: 800;
  font-size: 2.3rem;
  color: var(--brand);
}
.mobile-box {
  width: 260px;
  margin: auto;
  background: #fff;
  border-radius: 35px;
  padding: 25px 20px;
  box-shadow: 0 10px 35px rgba(0,0,0,0.12);
}
.mobile-screen {
  border-radius: 25px;
  overflow: hidden;
  border: 1px solid #e2e8f0;
  background: #f9fafb;
}
.mobile-header {
  background: var(--light);
  padding: 10px;
  text-align: center;
  font-weight: 600;
  color: var(--brand);
}
.mobile-form {
  padding: 15px;
  text-align: left;
}
.mobile-form .form-line {
  height: 2px;
  background: #d9d9d9;
  margin: 10px 0;
}
.mobile-bot img {
  width: 100%;
  border-radius: 15px;
}

/* Why Section */
.why-section {
  background: #f9fdfb;
  padding: 60px 20px;
}
.why-box {
  background: #fff;
  border-radius: 16px;
  padding: 25px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
  transition: .3s;
}
.why-box:hover {
  transform: translateY(-3px);
}

/* FAQ */
.accordion-button:not(.collapsed) {
  background: #e8fff5;
  color: var(--brand-dark);
  font-weight: 600;
}
.accordion-button:focus {
  box-shadow: none;
}

/* Footer */
footer {
  background: #012d24;
  color: #cfeae2;
  padding: 60px 0;
  text-align: center;
}
footer .social i {
  font-size: 22px;
  margin: 0 8px;
  color: #fff;
  transition: .3s;
}
footer .social i:hover {
  color: var(--brand);
}
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

<!-- HERO -->
<section class="hero my-4 mx-3">
  <div class="hero-content">
    <h1>Need Funds For Your Medical Treatment?</h1>
    <p>Raise money to pay hospital & medical bills for free.</p>
    <a href="<%=ctx%>/user/StartFundraiser" class="btn btn-brand btn-lg mt-3">Start a Free Fundraiser</a>

  </div>
  <img src="<%=ctx%>/images/banner.png" alt="banner">
</section>

<!-- Stats -->
<div class="container stats-bar">
  <div><b>0%</b><br>Platform Fee</div>
  <div><b>Quick</b><br>Funds Disbursal</div>
  <div><b>40,000+</b><br>Patients Supported</div>
  <div><b>2+ Lakh</b><br>Lives Impacted</div>
</div>

<!-- Medical Treatments Carousel -->
<div class="container my-5">
  <h2 class="section-title">Raise Funds For Medical Treatment</h2>
  <p class="section-sub">Get emergency financial help to pay hospital bills and medication bills with online fundraising.</p>

  <div id="fundCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner text-center">
      <div class="carousel-item active">
        <div class="row g-4 justify-content-center">
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-droplet-half"></i><h6>Kidney Transplant</h6><p>₹46 Lakh Raised</p></div></div>
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-capsule"></i><h6>Cancer Crowdfunding</h6><p>₹2 Crore Raised</p></div></div>
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-bandaid"></i><h6>Bone Marrow Transplant</h6><p>₹61 Lakh Raised</p></div></div>
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-heart-pulse"></i><h6>Heart Transplant</h6><p>₹49 Lakh Raised</p></div></div>
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-virus"></i><h6>Covid-19 Support</h6><p>₹69 Lakh Raised</p></div></div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="row g-4 justify-content-center">
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-car-front"></i><h6>Accident & Injury</h6><p>₹80 Lakh Raised</p></div></div>
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-activity"></i><h6>Liver Transplant</h6><p>₹35 Lakh Raised</p></div></div>
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-bug"></i><h6>Preterm Baby Care</h6><p>₹40 Lakh Raised</p></div></div>
          
          <!-- ✅ UPDATED CARD BELOW (No emoji, clean layout) -->
          <div class="col-md-2">
            <div class="card-fund">
              <i class="bi bi-dna"></i>
              <h6>Spinal Muscular Atrophy</h6>
              <p>₹16 Crore Raised</p>
            </div>
          </div>
          
          <div class="col-md-2"><div class="card-fund"><i class="bi bi-flower2"></i><h6>Memorial Crowdfunding</h6><p>₹45 Lakh Raised</p></div></div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#fundCarousel" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span></button>
    <button class="carousel-control-next" type="button" data-bs-target="#fundCarousel" data-bs-slide="next"><span class="carousel-control-next-icon"></span></button>
  </div>
</div>

<div class="text-center mt-4">
    <h5 class="text-secondary mb-3">Need Help from NGO?</h5>
    <div class="d-flex justify-content-center gap-3">
        <a href="<%= request.getContextPath() %>/user/help/create" class="btn btn-success btn-lg">
            <i class="bi bi-pencil-square"></i> Create Help Post
        </a>
        <a href="<%= request.getContextPath() %>/user/my-requests" class="btn btn-primary btn-lg">
            <i class="bi bi-list-ul"></i> View My Requests
        </a>
    </div>
</div>


<!-- HOW IT WORKS -->
<div class="container how-section my-5 py-5">
  <h2 class="text-center fw-bold mb-5">How Does Crowdfunding Work?</h2>
  <div class="row align-items-center justify-content-between">
    
    <!-- LEFT SIDE CONTENT -->
    <div class="col-lg-6">
      <div class="step-item active" data-step="1">
        <span class="step-number">1</span>
        <div>
          <h5 class="fw-semibold mb-1">Start a Free Fundraiser</h5>
          <p class="text-muted">Create a fundraiser by filling in all relevant details such as patient's information and goal amount.</p>
        </div>
      </div>

      <div class="step-item" data-step="2">
        <span class="step-number">2</span>
        <div>
          <h5 class="fw-semibold mb-1">Share Your Fundraiser</h5>
          <p class="text-muted">Share your fundraiser link on WhatsApp, social media, and with your friends & family to reach donors faster.</p>
        </div>
      </div>

      <div class="step-item" data-step="3">
        <span class="step-number">3</span>
        <div>
          <h5 class="fw-semibold mb-1">Withdraw All Donations</h5>
          <p class="text-muted">Withdraw the funds you receive anytime during your fundraising journey directly into your account.</p>
        </div>
      </div>
    </div>

    <!-- RIGHT SIDE - MOBILE DEMO -->
    <div class="col-lg-5 text-center">
      <div class="mobile-demo shadow-lg mx-auto">
        <div class="mobile-top"></div>
        <div class="mobile-body text-start" id="mobileBody">
          <h6 class="fw-bold text-success mb-3" id="mobileTitle">Start a Free Fundraiser</h6>
          <div id="formLines" class="typing-area"></div>
        </div>
        <div class="mobile-bottom text-center">
          <div class="bot-face">🤖</div>
          <div class="dot-nav mt-2">
            <span class="dot active" data-step="1"></span>
            <span class="dot" data-step="2"></span>
            <span class="dot" data-step="3"></span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- JS ANIMATION -->
<script>
document.addEventListener("DOMContentLoaded", () => {
  const steps = document.querySelectorAll(".step-item");
  const dots = document.querySelectorAll(".dot");
  const title = document.getElementById("mobileTitle");
  const formLines = document.getElementById("formLines");

  const stepData = {
    1: {
      title: "Start a Free Fundraiser",
      lines: [
        "Patient’s full name...",
        "Health issue...",
        "Hospital name...",
        "City of residence..."
      ]
    },
    2: {
      title: "Share Your Fundraiser",
      lines: [
        "Share via WhatsApp...",
        "Share on Instagram...",
        "Send Email Link...",
        "Reach more donors..."
      ]
    },
    3: {
      title: "Withdraw All Donations",
      lines: [
        "Add Bank Details...",
        "Submit Verification...",
        "Request Withdrawal...",
        "Funds Transferred..."
      ]
    }
  };

  let activeStep = 1;
  let typingTimer;

  function typeLines(step) {
    clearTimeout(typingTimer);
    const lines = stepData[step].lines;
    formLines.innerHTML = "";
    let i = 0;
    function typeNext() {
      if (i < lines.length) {
        const line = document.createElement("div");
        line.classList.add("typed-line");
        line.textContent = lines[i];
        formLines.appendChild(line);
        i++;
        typingTimer = setTimeout(typeNext, 600);
      }
    }
    typeNext();
  }

  function updateStep(step) {
    activeStep = step;
    steps.forEach(s => s.classList.toggle("active", s.dataset.step == step));
    dots.forEach(d => d.classList.toggle("active", d.dataset.step == step));
    title.textContent = stepData[step].title;
    typeLines(step);
  }

  steps.forEach(s => s.addEventListener("mouseenter", () => updateStep(s.dataset.step)));
  dots.forEach(d => d.addEventListener("click", () => updateStep(d.dataset.step)));

  // Auto-switch
  setInterval(() => {
    const next = activeStep % 3 + 1;
    updateStep(next);
  }, 5000);

  typeLines(1);
});
</script>

<!-- STYLES -->
<style>
.how-section { background: #fff; border-radius: 25px; padding: 60px 20px; }
.step-item {
  display: flex; gap: 15px; align-items: flex-start;
  padding: 15px 10px; border-left: 4px solid transparent;
  border-radius: 8px; transition: all 0.3s ease; cursor: pointer;
}
.step-item:hover, .step-item.active { background: #f6fffa; border-left: 4px solid #00b686; transform: translateX(4px); }
.step-number {
  background: #00b686; color: white; border-radius: 50%;
  width: 35px; height: 35px; text-align: center;
  line-height: 35px; font-weight: bold; font-size: 1.1rem;
}

/* MOBILE DEMO PHONE */
.mobile-demo {
  width: 270px; border-radius: 40px; background: #fff;
  padding: 10px 0 15px 0; overflow: hidden; position: relative;
  border: 1.5px solid #e6f5ef;
  background: #fafffd; transition: all 0.4s ease;
}
.mobile-top {
  height: 30px; width: 50%; background: #c8f7df; margin: auto;
  border-radius: 0 0 15px 15px;
}
.mobile-body { padding: 15px; font-size: 0.9rem; }
.typing-area { min-height: 140px; animation: fadeIn 0.6s ease; }
.typed-line {
  width: 0; overflow: hidden; white-space: nowrap;
  animation: typing 0.8s steps(30, end) forwards;
  margin-bottom: 8px; color: #333;
}
@keyframes typing { from { width: 0; } to { width: 100%; } }

.mobile-bottom {
  background: #e9fff4; border-top: 1px solid #d8f9e9;
  padding-top: 10px; border-radius: 0 0 30px 30px;
}
.bot-face {
  font-size: 2.2rem; background: #d1f7e3;
  display: inline-block; border-radius: 50%; padding: 10px 14px;
}
.dot-nav { display: flex; justify-content: center; gap: 8px; }
.dot {
  width: 9px; height: 9px; border-radius: 50%;
  background: #ccc; transition: all 0.3s ease;
}
.dot.active { background: #00b686; transform: scale(1.2); }

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}

@media (max-width: 991px) {
  .how-section .row { flex-direction: column-reverse; text-align: center; }
  .mobile-demo { margin-top: 25px; }
}
</style>


<!-- WHY FUNDRAISE -->
<div class="container why-section text-center">
  <h2 class="fw-bold mb-4">Why Fundraise With SkySpl?</h2>
  <div class="row g-4 justify-content-center">
    <div class="col-md-3"><div class="why-box"><h3>0%</h3><p>Platform Fee</p></div></div>
    <div class="col-md-3"><div class="why-box"><i class="bi bi-phone"></i><h5>Free Mobile App</h5><p>For iOS and Android</p></div></div>
    <div class="col-md-3"><div class="why-box"><i class="bi bi-people"></i><h5>30+ Lakh</h5><p>Donor Community</p></div></div>
  </div>
  <a href="<%=ctx%>/user/StartFundraiser" class="btn btn-brand btn-lg mt-4">Start a Free Fundraiser</a>


</div>

<!-- WHAT IS CROWDFUNDING -->
<div class="container my-5">
  <h2 class="text-center fw-bold mb-4">What Is Crowdfunding?</h2>
  <div class="row align-items-center g-5">
    <div class="col-lg-7">
      <p>Crowdfunding helps raise funds from people nationwide using donation-based fundraising platforms. It enables individuals and NGOs to fund medical treatments, emergencies, or chosen causes with 24×7 expert support.</p>
      <p>Unlike loans, crowdfunding doesn’t require repayment. All funds raised directly support emergency medical expenses.</p>
    </div>
    <div class="col-lg-5 text-center">
      <img src="<%=ctx%>/images/map.png" alt="India Map" class="img-fluid rounded-4">
    </div>
  </div>
</div>

<!-- FAQ -->
<div class="container my-5">
  <h2 class="text-center fw-bold mb-4">FAQ’s</h2>
  <div class="accordion" id="faq">
    <%
    String[] faq = {
      "What is crowdfunding?",
      "Is crowdfunding legal in India?",
      "How much does it cost to raise funds on ImpactGuru?",
      "Do we need to return the funds raised?",
      "What do I need to start a fundraiser?",
      "When will I receive the raised funds?",
      "What makes me ineligible to raise money?",
      "Who should I contact for more questions?",
      "What if I don’t see my medical treatment listed?",
      "What is the difference between crowdfunding and medical loans?",
      "Why is SkySpl the best fundraising platform?",
      "How does crowdfunding help for treatment?",
      "Is SkySpl a donation platform?",
      "How can I create a fundraiser?",
      "I need urgent donations, how can SkySpl help?",
      "Is medical fundraising good to reduce bills?",
      "How to accept donations for my medical expenses?",
      "What are other donation platforms in India?",
      "Which diseases can be covered?",
      "How is SkySpl different from GoFundMe?",
      "Can I raise money for surgery?",
      "Is raising funds safe on SkySpl?",
      "What is the verification process for fund transfer?"
    };
    for(int i=0;i<faq.length;i++){ %>
      <div class="accordion-item">
        <h2 class="accordion-header">
          <button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#f<%=i%>">
            <%=faq[i]%>
          </button>
        </h2>
        <div id="f<%=i%>" class="accordion-collapse collapse" data-bs-parent="#faq">
          <div class="accordion-body">Details for "<%=faq[i]%>" go here. You can provide short answers based on your policies or help info.</div>
        </div>
      </div>
    <% } %>
  </div>
</div>

<!-- FOOTER -->
<footer>
  <div class="container">
    <h4>Join The SkySpl Community</h4>
    <div class="d-flex justify-content-center mt-3">
      <input type="email" class="form-control w-25 me-2" placeholder="Enter email">
      <button class="btn btn-brand">Subscribe</button>
    </div>
    <div class="social mt-4">
      <i class="bi bi-whatsapp"></i>
      <i class="bi bi-facebook"></i>
      <i class="bi bi-twitter"></i>
      <i class="bi bi-linkedin"></i>
      <i class="bi bi-youtube"></i>
      <i class="bi bi-instagram"></i>
    </div>
    <p class="small mt-4 mb-0">© <%=java.time.Year.now()%> SkySpl | Built with ❤️ Humanity</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
