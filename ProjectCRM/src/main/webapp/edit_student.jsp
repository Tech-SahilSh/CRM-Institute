<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String id = request.getParameter("id");
    String firstName = "", lastName = "", email = "", phone = "", dob = "", gender = "", address = "", regDate = "", password = "";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        ps = conn.prepareStatement("SELECT * FROM student WHERE std_id = ?");
        ps.setString(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
            firstName = rs.getString("std_first_name");
            lastName = rs.getString("std_last_name");
            email = rs.getString("std_email");
            phone = rs.getString("std_phone");
            dob = rs.getString("std_dob");
            gender = rs.getString("std_gender");
            address = rs.getString("std_address");
            regDate = rs.getString("std_registration_date");
            password = rs.getString("std_passward");
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
    <div class="container">
        <h3>Edit Student</h3>
        <form action="save_student.jsp" method="post">
            <input type="hidden" name="std_id" value="<%= id %>">
            <div class="mb-2"><input type="text" name="std_first_name" value="<%= firstName %>" class="form-control" required></div>
            <div class="mb-2"><input type="text" name="std_last_name" value="<%= lastName %>" class="form-control" required></div>
            <div class="mb-2"><input type="email" name="std_email" value="<%= email %>" class="form-control" required></div>
            <div class="mb-2"><input type="text" name="std_phone" value="<%= phone %>" class="form-control" required></div>
            <div class="mb-2"><input type="date" name="std_dob" value="<%= dob %>" class="form-control" required></div>
            <div class="mb-2">
                <select name="std_gender" class="form-control" required>
                    <option <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
                    <option <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
                </select>
            </div>
            <div class="mb-2"><textarea name="std_address" class="form-control" required><%= address %></textarea></div>
            <div class="mb-2"><input type="date" name="std_registration_date" value="<%= regDate %>" class="form-control" required></div>
            <div class="mb-2"><input type="text" name="std_passward" value="<%= password %>" class="form-control" required></div>
            <button type="submit" class="btn btn-success">Update Student</button>
            <a href="manage_student.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
