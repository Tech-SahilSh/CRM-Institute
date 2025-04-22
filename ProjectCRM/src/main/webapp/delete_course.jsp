<%@ page import="java.sql.*" %>
<%
    int id = Integer.parseInt(request.getParameter("course_id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
        PreparedStatement ps = con.prepareStatement("DELETE FROM course WHERE course_id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        con.close();
        response.sendRedirect("manage_course.jsp");
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>
