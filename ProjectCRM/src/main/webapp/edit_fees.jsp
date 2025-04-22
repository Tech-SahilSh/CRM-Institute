<%@ page import="java.sql.*" %>
<%
    int std_id = Integer.parseInt(request.getParameter("std_id"));
    int course_id = Integer.parseInt(request.getParameter("course_id"));

    int amount_paid = 0, pay_balance = 0;
    String pay_date = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM fees WHERE std_id=? AND course_id=?");
        ps.setInt(1, std_id);
        ps.setInt(2, course_id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            amount_paid = rs.getInt("amount_paid");
            pay_date = rs.getString("pay_date");
            pay_balance = rs.getInt("pay_balance");
        }
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Fees</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { display: flex; }
        .sidebar {
            width: 220px;
            height: 100vh;
            background-color: #343a40;
            color: white;
            padding: 20px 10px;
        }
        .sidebar a {
            display: block;
            padding: 10px;
            color: white;
            margin-bottom: 10px;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            flex: 1;
            padding: 40px;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h4>Admin Panel</h4>
    <a href="manage_student.jsp">Student Manage</a>
    <a href="manage_course.jsp">Course Manage</a>
    <a href="manage_fees.jsp" style="background-color: #495057;">Fees Manage</a>
    <a href="logout.jsp">Logout</a>
</div>

<div class="content">
    <h3>Edit Fees</h3>
    <form action="update_fees.jsp" method="post" class="mt-4">
        <input type="hidden" name="std_id" value="<%= std_id %>">
        <input type="hidden" name="course_id" value="<%= course_id %>">
        <div class="mb-3">
            <label>Amount Paid</label>
            <input type="number" name="amount_paid" class="form-control" value="<%= amount_paid %>" required>
        </div>
        <div class="mb-3">
            <label>Payment Date</label>
            <input type="date" name="pay_date" class="form-control" value="<%= pay_date %>" required>
        </div>
        <div class="mb-3">
            <label>Balance</label>
            <input type="number" name="pay_balance" class="form-control" value="<%= pay_balance %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="manage_fees.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
