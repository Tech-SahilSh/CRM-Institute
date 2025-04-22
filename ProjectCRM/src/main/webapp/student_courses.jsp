<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    String stdId = (String) session.getAttribute("std_id");
    if (stdId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Enrolled Courses</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color:#f0f0f0;">
    <div class="container mt-5">
        <h2 class="mb-4 text-center"> My Enrolled Courses</h2>

        <table class="table table-bordered table-hover bg-white">
            <thead class="thead-dark">
                <tr>
                    <th>#</th>
                    <th>Course Name</th>
                    <th>Duration</th>
                    <th>Fees</th>
                    <th>Enroll Date</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
            <%
                int count = 1;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

                    String query = "SELECT e.enroll_date, e.status, c.course_name, c.course_duration, c.course_fees " +
                                   "FROM enrollment e " +
                                   "JOIN course c ON e.course_id = c.course_id " +
                                   "WHERE e.std_id = ?";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, stdId);
                    ResultSet rs = ps.executeQuery();

                    while(rs.next()) {
                        String courseName = rs.getString("course_name");
                        String duration = rs.getString("course_duration");
                        int fees = rs.getInt("course_fees");
                        String enrollDate = rs.getString("enroll_date");
                        String status = rs.getString("status");
            %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= courseName %></td>
                        <td><%= duration %></td>
                        <td>Rs. <%= fees %></td>
                        <td><%= enrollDate %></td>
                        <td><%= status.equalsIgnoreCase("active") ? "Active" : "Inactive" %></td>
                    </tr>
            <%
                    }

                    rs.close();
                    ps.close();
                    con.close();
                } catch(Exception e) {
                    out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
            </tbody>
        </table>

        <div class="text-center">
            <a href="student_dashboard.jsp" class="btn btn-primary"> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
