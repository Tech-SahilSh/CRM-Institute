<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Fees</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .sidebar {
            width: 220px;
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding: 20px 10px;
        }
        .sidebar h4 {
            text-align: center;
            margin-bottom: 30px;
        }
        .sidebar a {
            display: block;
            padding: 10px;
            color: white;
            margin-bottom: 10px;
            text-decoration: none;
            border-radius: 5px;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            flex: 1;
            padding: 30px;
        }
        .table-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div class="container-fluid d-flex mt-5">
<!-- Left Sidebar -->
<div class="sidebar">
    <h4>Admin Panel</h4>
    <a href="manage_student.jsp">Student Manage</a>
    <a href="manage_course.jsp">Course Manage</a>
    <a href="manage_fees.jsp" style="background-color: #495057;">Fees Manage</a>
    <a href="logout.jsp">Logout</a>
</div>

<!-- Right Content -->
<div class="content">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <input type="text" class="form-control" placeholder="Search by student or course..." style="width: 300px;">
        </div>
        <div>
            <a href="add_fees.jsp" class="btn btn-success">Add New Fees</a>
        </div>
    </div>

    <div class="table-responsive table-container">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Student ID</th>
                    <th>Course ID</th>
                    <th>Amount Paid</th>
                    <th>Pay Date</th>
                    <th>Balance</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM fees");

                        while (rs.next()) {
                            int std_id = rs.getInt("std_id");
                            int course_id = rs.getInt("course_id");
                            int amount_paid = rs.getInt("amount_paid");
                            String pay_date = rs.getString("pay_date");
                            int pay_balance = rs.getInt("pay_balance");
                            String status = (pay_balance == 0) ? "Paid" : "Pending";
                %>
                <tr>
                    <td><%= std_id %></td>
                    <td><%= course_id %></td>
                    <td><%= amount_paid %></td>
                    <td><%= pay_date %></td>
                    <td><%= pay_balance %></td>
                    <td>
                        <span class="badge <%= (pay_balance == 0) ? "bg-success" : "bg-warning text-dark" %>">
                            <%= status %>
                        </span>
                    </td>
                    <td>
                        <a href="edit_fees.jsp?std_id=<%= std_id %>&course_id=<%= course_id %>" class="btn btn-primary btn-sm"
                           onclick="return confirm('Are you sure to edit this fees record?')">Edit</a>
                        <a href="delete_fees.jsp?std_id=<%= std_id %>&course_id=<%= course_id %>" class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure to delete this fees record?')">Delete</a>
                    </td>
                </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        out.println("<tr><td colspan='7'>Error: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
</div>
</body>
</html>
