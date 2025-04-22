<%@ page import="java.sql.*" %>
<%
    String course_id = request.getParameter("course_id");
    String course_name = request.getParameter("course_name");
    String course_duration = request.getParameter("course_duration");
    String course_fees = request.getParameter("course_fees");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
        PreparedStatement ps = con.prepareStatement("UPDATE course SET course_name=?, course_duration=?, course_fees=? WHERE course_id=?");
        ps.setString(1, course_name);
        ps.setString(2, course_duration);
        ps.setInt(3, Integer.parseInt(course_fees));
        ps.setInt(4, Integer.parseInt(course_id));

        int i = ps.executeUpdate();
        con.close();
        if (i > 0) {
%>
            <script>
                alert("Course updated successfully!");
                window.location.href = "manage_course.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to update course!");
                window.location.href = "edit_course.jsp?course_id=<%= course_id %>";
            </script>
<%
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>
