<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String stdId = request.getParameter("std_id");
    String firstName = request.getParameter("std_first_name");
    String lastName = request.getParameter("std_last_name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        PreparedStatement ps = con.prepareStatement("UPDATE student SET std_first_name=?, std_last_name=?, email=?, phone=?, dob=?, gender=?, address=? WHERE std_id=?");
        ps.setString(1, firstName);
        ps.setString(2, lastName);
        ps.setString(3, email);
        ps.setString(4, phone);
        ps.setString(5, dob);
        ps.setString(6, gender);
        ps.setString(7, address);
        ps.setString(8, stdId);

        int i = ps.executeUpdate();
        if (i > 0) {
%>
            <script>
                alert("Profile updated successfully!");
                window.location = "manage_profile.jsp";
            </script>
<%
        } else {
%>
            <script>
                alert("Update failed!");
                window.location = "manage_profile.jsp";
            </script>
<%
        }

        ps.close();
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
