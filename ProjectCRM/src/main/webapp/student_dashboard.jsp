<%@ page import="java.sql.*, java.util.*" %>
<%
    String studentId = (String) session.getAttribute("std_id");
    if(studentId == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .sidebar {
            min-height: 100vh;
            background-color: #343a40;
            color: white;
        }
        .sidebar .nav-link {
            color: #fff;
        }
        .card-course {
            min-height: 200px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">

        <!-- Left Sidebar -->
        <div class="col-md-2 sidebar p-3">
            <h5 class="text-white">Student Panel</h5>
            <ul class="nav flex-column">
                <li class="nav-item"><a href="student_dashboard.jsp" class="nav-link">Dashboard</a></li>
                <li class="nav-item"><a href="manage_profile.jsp" class="nav-link">Manage Profile</a></li>
                <li class="nav-item"><a href="student_fees.jsp" class="nav-link">Manage Fees</a></li>
                <li class="nav-item"><a href="student_courses.jsp" class="nav-link">My Courses</a></li>
                <li class="nav-item"><a href="logout.jsp" class="nav-link">Logout</a></li>
            </ul>
        </div>

        <!-- Right Content -->
        <div class="col-md-10 p-4">

            <%
                int enrolledCourses = 0;
                int totalPaid = 0;
                int totalBalance = 0;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

                    // Total enrolled
                    PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM enrollment WHERE std_id = ?");
                    ps1.setString(1, studentId);
                    ResultSet rs1 = ps1.executeQuery();
                    if(rs1.next()) enrolledCourses = rs1.getInt(1);

                    // Total fees paid and balance
                    PreparedStatement ps2 = con.prepareStatement("SELECT SUM(amount_paid), SUM(pay_balance) FROM fees WHERE std_id = ?");
                    ps2.setString(1, studentId);
                    ResultSet rs2 = ps2.executeQuery();
                    if(rs2.next()) {
                        totalPaid = rs2.getInt(1);
                        totalBalance = rs2.getInt(2);
                    }

                    rs1.close(); rs2.close(); ps1.close(); ps2.close(); con.close();
                } catch(Exception e) {
                    out.println("Error loading summary: " + e.getMessage());
                }
            %>

            <!-- Summary Cards -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="card text-white bg-info mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Total Enrolled Courses</h5>
                            <p class="card-text"><%= enrolledCourses %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Fees Paid</h5>
                            <p class="card-text">Rs. <%= totalPaid %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-danger mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Remaining Balance</h5>
                            <p class="card-text">Rs. <%= totalBalance %></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Filter -->
            <form method="get" class="form-inline mb-3">
                <input type="text" name="search" class="form-control mr-2" placeholder="Search course...">
                <button class="btn btn-outline-primary">Filter</button>
            </form>

            <!-- Course List -->
            <div class="row">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

                        String search = request.getParameter("search");
                        String query = "SELECT * FROM course";
                        if (search != null && !search.trim().equals("")) {
                            query += " WHERE course_name LIKE '%" + search + "%'";
                        }

                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery(query);

                        while(rs.next()) {
                %>
                <div class="col-md-4">
                    <div class="card card-course">
                        <div class="card-body">
                            <h5 class="card-title"><%= rs.getString("course_name") %></h5>
                            <p class="card-text">
                                Duration: <%= rs.getString("course_duration") %><br>
                                Fees: Rs. <%= rs.getInt("course_fees") %>
                            </p>
                            <form action="enroll_course.jsp" method="post">
                                <input type="hidden" name="std_id" value="<%= studentId %>">
                                <input type="hidden" name="course_id" value="<%= rs.getInt("course_id") %>">
                                <input type="hidden" name="enroll_date" value="<%= new java.sql.Date(System.currentTimeMillis()) %>">
                                <button class="btn btn-primary btn-block">Enroll</button>
                            </form>
                        </div>
                    </div>
                </div>
                <%
                        }
                        rs.close();
                        st.close();
                        con.close();
                    } catch(Exception e) {
                        out.println("Error loading courses: " + e.getMessage());
                    }
                %>
            </div>

        </div>
    </div>
</div>
</body>
</html>
