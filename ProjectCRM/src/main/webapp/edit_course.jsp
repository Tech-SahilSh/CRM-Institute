<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("course_id"));
    String name = "", duration = "";
    int fees = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM course WHERE course_id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            name = rs.getString("course_name");
            duration = rs.getString("course_duration");
            fees = rs.getInt("course_fees");
        }
        con.close();
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">
<div class="container">
    <h3 class="mb-4">Edit Course</h3>
    <form action="update_course.jsp" method="post">
        <input type="hidden" name="course_id" value="<%= id %>"/>
        <div class="mb-3">
            <label>Course Name</label>
            <input type="text" name="course_name" class="form-control" value="<%= name %>" required>
        </div>
        <div class="mb-3">
            <label>Duration</label>
            <input type="text" name="course_duration" class="form-control" value="<%= duration %>" required>
        </div>
        <div class="mb-3">
            <label>Fees</label>
            <input type="number" name="course_fees" class="form-control" value="<%= fees %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="manage_course.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
