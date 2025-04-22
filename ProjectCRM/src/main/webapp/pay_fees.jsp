<%@ page import="java.sql.*" %>
<%
    String stdId = request.getParameter("std_id");
    int courseId = Integer.parseInt(request.getParameter("course_id"));
    int balance = Integer.parseInt(request.getParameter("balance"));
    String today = new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        PreparedStatement ps = con.prepareStatement(
            "UPDATE fees SET amount_paid = amount_paid + ?, pay_balance = 0, pay_date = ? WHERE std_id = ? AND course_id = ?"
        );
        ps.setInt(1, balance);
        ps.setString(2, today);
        ps.setString(3, stdId);
        ps.setInt(4, courseId);

        int i = ps.executeUpdate();

        if (i > 0) {
%>
            <script>alert("Payment successful!"); window.location = "student_fees.jsp";</script>
<%
        } else {
%>
            <script>alert("Payment failed."); window.location = "student_fees.jsp";</script>
<%
        }

        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
