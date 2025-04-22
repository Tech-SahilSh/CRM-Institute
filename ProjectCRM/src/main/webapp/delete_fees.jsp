<%@ page import="java.sql.*" %>
<%
    int std_id = Integer.parseInt(request.getParameter("std_id"));
    int course_id = Integer.parseInt(request.getParameter("course_id"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
        PreparedStatement ps = con.prepareStatement("DELETE FROM fees WHERE std_id=? AND course_id=?");
        ps.setInt(1, std_id);
        ps.setInt(2, course_id);
        int i = ps.executeUpdate();
        con.close();
        if (i > 0) {
%>
            <script>
                alert("Fees record deleted successfully!");
                window.location.href = "manage_fees.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to delete record!");
                window.location.href = "manage_fees.jsp";
            </script>
<%
        }
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
