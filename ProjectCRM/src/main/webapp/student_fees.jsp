<%@ page import="java.sql.*" %>
<%
    String stdId = (String) session.getAttribute("std_id");
    if (stdId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int totalPaid = 0;
    int totalBalance = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Fees</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .sidebar {
            height: 100vh;
            background: #343a40;
            color: white;
            padding: 20px;
        }
        .sidebar a {
            color: white;
            display: block;
            padding: 10px 0;
            text-decoration: none;
        }
        .sidebar a:hover {
            background: #495057;
        }
        .right-section {
            padding: 30px;
        }
    </style>
</head>
<body>

<div class="d-flex">
    <!-- Sidebar -->
    <div class="sidebar">
        <h4>Student Panel</h4>
        <a href="student_dashboard.jsp">Dashboard</a>
        <a href="student_courses.jsp">My Courses</a>
        <a href="student_fees.jsp">My Fees</a>
        <a href="manage_profile.jsp">Manage Profile</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <!-- Right Section -->
    <div class="right-section w-100">
        <h3 class="mb-4">My Fee Details</h3>

        <div class="row mb-4">
            <%
                // Calculate total paid and balance
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

                    PreparedStatement ps = con.prepareStatement("SELECT amount_paid, pay_balance FROM fees WHERE std_id = ?");
                    ps.setString(1, stdId);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        totalPaid += rs.getInt("amount_paid");
                        totalBalance += rs.getInt("pay_balance");
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
            <div class="col-md-4">
                <div class="card text-white bg-success mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Total Paid</h5>
                        <p class="card-text">Rs. <%= totalPaid %></p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Total Balance</h5>
                        <p class="card-text">Rs. <%= totalBalance %></p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Fees Table -->
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Course Name</th>
                    <th>Amount Paid</th>
                    <th>Balance</th>
                    <th>Pay Date</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

                        String query = "SELECT f.*, c.course_name FROM fees f JOIN course c ON f.course_id = c.course_id WHERE f.std_id = ?";
                        PreparedStatement ps = con.prepareStatement(query);
                        ps.setString(1, stdId);
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            int courseId = rs.getInt("course_id");
                            String courseName = rs.getString("course_name");
                            int paid = rs.getInt("amount_paid");
                            int balance = rs.getInt("pay_balance");
                            String date = rs.getString("pay_date");
                            String status = (balance == 0) ? "Paid" : "Pending";
                %>
                    <tr>
                        <td><%= courseName %></td>
                        <td>Rs. <%= paid %></td>
                        <td>Rs. <%= balance %></td>
                        <td><%= date %></td>
                        <td>
                            <span class="badge <%= (balance == 0) ? "badge-success" : "badge-warning" %>"><%= status %></span>
                        </td>
                        <td>
                            <% if (balance > 0) { %>
                                <form action="pay_fees.jsp" method="post" class="d-inline">
                                    <input type="hidden" name="course_id" value="<%= courseId %>">
                                    <input type="hidden" name="std_id" value="<%= stdId %>">
                                    <input type="hidden" name="balance" value="<%= balance %>">
                                    <button class="btn btn-sm btn-primary" type="submit">Pay Now</button>
                                </form>
                            <% } else { %>
                                <button class="btn btn-sm btn-secondary" disabled>Paid</button>
                            <% } %>
                        </td>
                    </tr>
                <%
                        }

                        rs.close();
                        ps.close();
                        con.close();
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
