<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechLearn Institute - Software Training</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet">
   
</head>
<body>
  <jsp:include page="navigation.jsp" />

    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <h1 class="display-4 fw-bold mb-4">Advance Your Tech Career</h1>
            <p class="lead mb-5">Join our industry-leading software training programs and gain the skills employers are looking for</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="#courses" class="btn btn-light btn-lg px-4">Browse Courses</a>
                <a href="register.jsp" class="btn btn-outline-light btn-lg px-4">Get Started</a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold">Why Choose TechLearn?</h2>
                <p class="text-muted">We provide the best learning experience for aspiring developers</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="text-center p-4">
                        <div class="feature-icon">
                            <i class="fas fa-laptop-code"></i>
                        </div>
                        <h4>Hands-on Training</h4>
                        <p class="text-muted">Learn by doing with real-world projects and coding exercises.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="text-center p-4">
                        <div class="feature-icon">
                            <i class="fas fa-chalkboard-teacher"></i>
                        </div>
                        <h4>Expert Instructors</h4>
                        <p class="text-muted">Learn from industry professionals with years of experience.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="text-center p-4">
                        <div class="feature-icon">
                            <i class="fas fa-briefcase"></i>
                        </div>
                        <h4>Career Support</h4>
                        <p class="text-muted">Get resume reviews, interview prep, and job placement assistance.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Courses Section -->
    <section id="courses" class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold">Popular Courses</h2>
                <p class="text-muted">Browse our most in-demand programs</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <span class="course-badge badge bg-success">New</span>
                        <img src="assets/images/java-course.jpg" class="card-img-top" alt="Java Programming">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Master Java from basics to advanced concepts including Spring Framework.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">12 Weeks</span>
                                <span class="fw-bold">₹15,000</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <img src="assets/images/web-dev-course.jpg" class="card-img-top" alt="Web Development">
                        <div class="card-body">
                            <h5 class="card-title">Full Stack Web Development</h5>
                            <p class="card-text">Learn HTML, CSS, JavaScript, React, Node.js and MongoDB.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">16 Weeks</span>
                                <span class="fw-bold">₹18,000</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card course-card h-100">
                        <span class="course-badge badge bg-warning text-dark">Popular</span>
                        <img src="assets/images/data-science-course.jpg" class="card-img-top" alt="Data Science">
                        <div class="card-body">
                            <h5 class="card-title">Data Science with Python</h5>
                            <p class="card-text">Learn data analysis, visualization, and machine learning with Python.</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-primary">20 Weeks</span>
                                <span class="fw-bold">₹25,000</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <a href="login.jsp" class="btn btn-primary">View All Courses</a>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section id="testimonials" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold">What Our Students Say</h2>
                <p class="text-muted">Hear from our successful graduates</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 testimonial-card">
                        <div class="card-body">
                            <div class="mb-3">
                                <i class="fas fa-quote-left text-primary"></i>
                            </div>
                            <p class="card-text">TechLearn's Java course gave me the skills I needed to land my first developer job. The hands-on projects were invaluable.</p>
                            <div class="d-flex align-items-center mt-4">
                                <img src="assets/images/testimonial1.jpg" class="rounded-circle me-3" width="50" alt="Student">
                                <div>
                                    <h6 class="mb-0">Rahul Sharma</h6>
                                    <small class="text-muted">Software Developer at TechSolutions</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 testimonial-card">
                        <div class="card-body">
                            <div class="mb-3">
                                <i class="fas fa-quote-left text-primary"></i>
                            </div>
                            <p class="card-text">The Full Stack Web Development program was comprehensive and up-to-date with industry standards. Highly recommended!</p>
                            <div class="d-flex align-items-center mt-4">
                                <img src="assets/images/testimonial2.jpg" class="rounded-circle me-3" width="50" alt="Student">
                                <div>
                                    <h6 class="mb-0">Priya Patel</h6>
                                    <small class="text-muted">Frontend Developer at WebCraft</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 testimonial-card">
                        <div class="card-body">
                            <div class="mb-3">
                                <i class="fas fa-quote-left text-primary"></i>
                            </div>
                            <p class="card-text">The instructors were knowledgeable and supportive. I transitioned from finance to data science thanks to TechLearn.</p>
                            <div class="d-flex align-items-center mt-4">
                                <img src="assets/images/testimonial3.jpg" class="rounded-circle me-3" width="50" alt="Student">
                                <div>
                                    <h6 class="mb-0">Amit Singh</h6>
                                    <small class="text-muted">Data Analyst at DataInsights</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="py-5 bg-primary text-white">
        <div class="container text-center">
            <h2 class="fw-bold mb-4">Ready to Start Your Tech Journey?</h2>
            <p class="lead mb-4">Join hundreds of students who have transformed their careers with our programs</p>
            <a href="register.jsp" class="btn btn-light btn-lg px-4">Enroll Now</a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-dark text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4 mb-md-0">
                    <h5>TechLearn Institute</h5>
                    <p>Providing quality software education since 2010.</p>
                    <div class="social-icons">
                        <a href="#" class="text-white me-2"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-white me-2"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="text-white me-2"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-md-2 mb-4 mb-md-0">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Home</a></li>
                        <li><a href="#courses" class="text-white">Courses</a></li>
                        <li><a href="login.jsp" class="text-white">Login</a></li>
                        <li><a href="register.jsp" class="text-white">Register</a></li>
                    </ul>
                </div>
                <div class="col-md-3 mb-4 mb-md-0">
                    <h5>Contact Us</h5>
                    <ul class="list-unstyled">
                        <li><i class="fas fa-map-marker-alt me-2"></i> 123 Tech Street, Bangalore</li>
                        <li><i class="fas fa-phone me-2"></i> +91 9876543210</li>
                        <li><i class="fas fa-envelope me-2"></i> info@techlearn.com</li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h5>Newsletter</h5>
                    <p>Subscribe to get updates on new courses and offers.</p>
                    <form class="mb-3">
                        <div class="input-group">
                            <input type="email" class="form-control" placeholder="Your Email">
                            <button class="btn btn-primary" type="submit">Subscribe</button>
                        </div>
                    </form>
                </div>
            </div>
            <hr class="my-4">
            <div class="text-center">
                <p class="mb-0">&copy; 2023 TechLearn Institute. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   
    <script>
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
        
        // Change navbar style on scroll
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('navbar-scrolled');
            } else {
                navbar.classList.remove('navbar-scrolled');
            }
        });
    </script>
</body>
</html>