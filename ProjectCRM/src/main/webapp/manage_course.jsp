<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        .sidebar {
            width: 250px;
            background-color: #343a40;
            height: 100vh;
            padding: 20px;
        }
        .content {
            flex: 1;
            padding: 30px;
        }
         .sidebar a:hover {
            background-color: #495057;
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp"/>
<div class="container-fluid d-flex mt-5">
<div class="sidebar">
    <h5 class="text-light">Admin Dashboard</h5>
    <ul class="nav flex-column">
        <li class="nav-item"><a href="manage_student.jsp" class="nav-link">Student Manage</a></li>
        <li class="nav-item"><a href="manage_course.jsp" class="nav-link active">Course Manage</a></li>
        <li class="nav-item"><a href="manage_fees.jsp" class="nav-link">Fees Manage</a></li>
        <li class="nav-item"><a href="logout.jsp" class="nav-link text-danger">Logout</a></li>
    </ul>
</div>

<div class="content">
    <div class="d-flex justify-content-between mb-3">
        <input type="text" class="form-control w-50" placeholder="Search Course">
        <a href="add_course.jsp" class="btn btn-success">Add New Course</a>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Duration</th>
            <th>Fees</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM course");

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("course_id") %></td>
            <td><%= rs.getString("course_name") %></td>
            <td><%= rs.getString("course_duration") %></td>
            <td><%= rs.getInt("course_fees") %></td>
            <td>
                <a href="edit_course.jsp?course_id=<%= rs.getInt("course_id") %>" class="btn btn-primary btn-sm"
                   onclick="return confirm('Edit this course?')">Edit</a>
                <a href="delete_course.jsp?course_id=<%= rs.getInt("course_id") %>" class="btn btn-danger btn-sm"
                   onclick="return confirm('Are you sure you want to delete this course?')">Delete</a>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.print("Error: " + e.getMessage());
            }
        %>
        </tbody>
    </table>
</div>
</div>
</body>
</html>
