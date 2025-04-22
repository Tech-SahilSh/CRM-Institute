<%@ page import="java.sql.*" %>
<%
    String std_id = request.getParameter("std_id");
    String course_id = request.getParameter("course_id");
    String amount_paid = request.getParameter("amount_paid");
    String pay_date = request.getParameter("pay_date");
    String pay_balance = request.getParameter("pay_balance");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Or use com.mysql.cj.jdbc.Driver for newer versions
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        PreparedStatement ps = con.prepareStatement("INSERT INTO fees (std_id, course_id, amount_paid, pay_date, pay_balance) VALUES (?, ?, ?, ?, ?)");
        ps.setString(1, std_id);
        ps.setString(2, course_id);
        ps.setString(3, amount_paid);
        ps.setString(4, pay_date);
        ps.setString(5, pay_balance);

        int i = ps.executeUpdate();
        if (i > 0) {
%>
            <script>
                alert("Fees saved successfully!");
                window.location.href = "manage_fees.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Failed to save fees!");
                window.location.href = "add_fees.jsp";
            </script>
<%
        }
        con.close();
    } catch(Exception e) {
        out.println("Database error: " + e.getMessage());
    }
%>
