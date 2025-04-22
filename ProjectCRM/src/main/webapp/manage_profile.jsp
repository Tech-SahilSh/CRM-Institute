<%@ page import="java.sql.*" %>
<%
    String stdId = (String) session.getAttribute("std_id");
    if (stdId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String firstName = "", lastName = "", email = "", phone = "", dob = "", gender = "", address = "", regDate = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE std_id = ?");
        ps.setString(1, stdId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            firstName = rs.getString("std_first_name");
            lastName = rs.getString("std_last_name");
            email = rs.getString("email");
            phone = rs.getString("phone");
            dob = rs.getString("dob");
            gender = rs.getString("gender");
            address = rs.getString("address");
            regDate = rs.getString("registration_date");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color:#f7f7f7;">
    <div class="container mt-5">
        <h2 class="mb-4 text-center">Manage Your Profile</h2>

        <form action="update_profile.jsp" method="post" class="bg-white p-4 rounded shadow">
            <input type="hidden" name="std_id" value="<%= stdId %>">

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>First Name</label>
                    <input type="text" class="form-control" name="std_first_name" value="<%= firstName %>" required>
                </div>
                <div class="form-group col-md-6">
                    <label>Last Name</label>
                    <input type="text" class="form-control" name="std_last_name" value="<%= lastName %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" value="<%= email %>" required>
                </div>
                <div class="form-group col-md-6">
                    <label>Phone</label>
                    <input type="text" class="form-control" name="phone" value="<%= phone %>" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Date of Birth</label>
                    <input type="date" class="form-control" name="dob" value="<%= dob %>" required>
                </div>
                <div class="form-group col-md-4">
                    <label>Gender</label>
                    <select class="form-control" name="gender">
                        <option <%= gender.equalsIgnoreCase("Male") ? "selected" : "" %>>Male</option>
                        <option <%= gender.equalsIgnoreCase("Female") ? "selected" : "" %>>Female</option>
                        <option <%= gender.equalsIgnoreCase("Other") ? "selected" : "" %>>Other</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <label>Registration Date</label>
                    <input type="text" class="form-control" value="<%= regDate %>" disabled>
                </div>
            </div>

            <div class="form-group">
                <label>Address</label>
                <textarea class="form-control" name="address" rows="2" required><%= address %></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">Update Profile</button>
                <a href="student_dashboard.jsp" class="btn btn-secondary ml-2">Back</a>
            </div>
        </form>
    </div>
</body>
</html>
