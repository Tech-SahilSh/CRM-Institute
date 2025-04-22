<%@ page import="java.sql.*" %>
<%
    String std_id = request.getParameter("std_id");
    String course_id = request.getParameter("course_id");
    String amount_paid = request.getParameter("amount_paid");
    String pay_date = request.getParameter("pay_date");
    String pay_balance = request.getParameter("pay_balance");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Or use com.mysql.cj.jdbc.Driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        PreparedStatement ps = con.prepareStatement("UPDATE fees SET amount_paid=?, pay_date=?, pay_balance=? WHERE std_id=? AND course_id=?");
        ps.setString(1, amount_paid);
        ps.setString(2, pay_date);
        ps.setString(3, pay_balance);
        ps.setString(4, std_id);
        ps.setString(5, course_id);

        int i = ps.executeUpdate();
        if (i > 0) {
%>
            <script>
                alert("Fees updated successfully!");
                window.location.href = "manage_fees.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to update fees!");
                window.location.href = "edit_fees.jsp?std_id=<%=std_id%>&course_id=<%=course_id%>";
            </script>
<%
        }
        con.close();
    } catch(Exception e) {
        out.println("Database error: " + e.getMessage());
    }
%>
