<%@ page import="java.sql.*" %>
<%
    String course_id = request.getParameter("course_id");
    String course_name = request.getParameter("course_name");
    String course_duration = request.getParameter("course_duration");
    String course_fees = request.getParameter("course_fees");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
        PreparedStatement ps = con.prepareStatement("INSERT INTO course (course_id, course_name, course_duration, course_fees) VALUES (?, ?, ?, ?)");
        ps.setInt(1, Integer.parseInt(course_id));
        ps.setString(2, course_name);
        ps.setString(3, course_duration);
        ps.setInt(4, Integer.parseInt(course_fees));

        int i = ps.executeUpdate();
        con.close();
        if (i > 0) {
%>
            <script>
                alert("Course added successfully!");
                window.location.href = "manage_course.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to add course!");
                window.location.href = "add_course.jsp";
            </script>
<%
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>
