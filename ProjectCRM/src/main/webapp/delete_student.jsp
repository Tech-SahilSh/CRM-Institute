<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        ps = conn.prepareStatement("DELETE FROM student WHERE std_id = ?");
        ps.setString(1, id);
        ps.executeUpdate();

        response.sendRedirect("manage_student.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException ignore) {}
    }
%>
