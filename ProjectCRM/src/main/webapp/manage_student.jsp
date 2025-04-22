<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        .action-btns a {
            margin-right: 5px;
        }
    </style>
    <script>
        function confirmEdit(id) {
            if (confirm("Are you sure you want to edit this student?")) {
                window.location.href = 'edit_student.jsp?id=' + id;
            }
        }

        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this student?")) {
                window.location.href = 'delete_student.jsp?id=' + id;
            }
        }
    </script>
</head>
<body>

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
%>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <a href="manage_students.jsp">Student Manage</a>
            <a href="manage_courses.jsp">Course Manage</a>
            <a href="manage_fees.jsp">Fees Manage</a>
            <a href="logout.jsp">Logout</a>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 p-4">
            <div class="d-flex justify-content-between mb-3">
                <input type="text" class="form-control w-50" placeholder="Filter by name or email...">
                <a href="add_student.jsp" class="btn btn-primary">Add New Student</a>
            </div>

            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>DOB</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Reg. Date</th>
                        <th>Password</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM student");

                        while (rs.next()) {
                %>
                    <tr>
                        <td><%= rs.getString("std_id") %></td>
                        <td><%= rs.getString("std_first_name") %></td>
                        <td><%= rs.getString("std_last_name") %></td>
                        <td><%= rs.getString("std_email") %></td>
                        <td><%= rs.getString("std_phone") %></td>
                        <td><%= rs.getString("std_dob") %></td>
                        <td><%= rs.getString("std_gender") %></td>
                        <td><%= rs.getString("std_address") %></td>
                        <td><%= rs.getString("std_registration_date") %></td>
                        <td><%= rs.getString("std_passward") %></td>
                        <td class="action-btns">
                            <button class="btn btn-sm btn-warning" onclick="confirmEdit('<%= rs.getString("std_id") %>')">Edit</button>
                            <button class="btn btn-sm btn-danger" onclick="confirmDelete('<%= rs.getString("std_id") %>')">Delete</button>
                        </td>
                    </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='11' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException ignore) {}
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
