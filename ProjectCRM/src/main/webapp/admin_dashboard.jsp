<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .card {
            border-radius: 10px;
        }
        .dashboard-title {
            font-weight: bold;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>

<%
    // Initialize counters
    int studentCount = 0;
    int courseCount = 0;
    double totalFees = 0;

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        stmt = conn.createStatement();

        // Count students
        rs = stmt.executeQuery("SELECT COUNT(*) FROM student");
        if (rs.next()) {
            studentCount = rs.getInt(1);
        }
        rs.close();

        // Count courses
        rs = stmt.executeQuery("SELECT COUNT(*) FROM course");
        if (rs.next()) {
            courseCount = rs.getInt(1);
        }
        rs.close();

        // Sum of fees
        rs = stmt.executeQuery("SELECT SUM(amount_paid) FROM fees");
        if (rs.next()) {
            totalFees = rs.getDouble(1);
        }
        rs.close();

    } catch (Exception e) {
%>
    <div class="alert alert-danger">Error: <%= e.getMessage() %></div>
<%
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException ignore) {}
    }
%>

<div class="container-fluid mt-5">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <a href="manage_student.jsp">Student Manage</a>
            <a href="manage_course.jsp">Course Manage</a>
            <a href="manage_fees.jsp">Fees Manage</a>
            <a href="logout.jsp">Logout</a>
        </div>

        <!-- Dashboard Content -->
        <div class="col-md-10 p-5">
            <h2 class="dashboard-title">Admin Dashboard</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card bg-primary text-white text-center p-4">
                        <h5>Total Students</h5>
                        <h2><%= studentCount %></h2>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-success text-white text-center p-4">
                        <h5>Total Courses</h5>
                        <h2><%= courseCount %></h2>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-warning text-dark text-center p-4">
                        <h5>Total Fees Collected</h5>
                        <h2>₹ <%= totalFees %></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
