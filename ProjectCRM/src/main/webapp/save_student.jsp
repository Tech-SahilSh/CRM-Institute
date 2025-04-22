<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Registration</title>
     <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   <link href="style.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div class="container">
    <%
        // Get parameters
        String id = request.getParameter("std_id");
        String firstName = request.getParameter("std_first_name");
        String lastName = request.getParameter("std_last_name");
        String email = request.getParameter("std_email");
        String phone = request.getParameter("std_phone");
        String dob = request.getParameter("std_dob");
        String gender = request.getParameter("std_gender");
        String address = request.getParameter("std_address");
        String regDate = request.getParameter("std_Registration_date");
        String password = request.getParameter("std_passward");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

            String sql = "INSERT INTO student (std_id, std_first_name, std_last_name, std_email, std_phone, std_dob, std_gender, std_address, std_Registration_date, std_passward) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, firstName);
            pstmt.setString(3, lastName);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setString(6, dob);
            pstmt.setString(7, gender);
            pstmt.setString(8, address);
            pstmt.setString(9, regDate);
            pstmt.setString(10, password);

            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
    %>
                <div class="container mt-5 text-center message">Student data saved successfully!</div>
                <a href="index.jsp" class="btn">Go to Home</a>
    <% } else { %>
                <div class="message" style="color: red;">Failed to save student data.</div>
                <a href="index.jsp" class="btn">Go to Home</a>
    <%
            }
        } catch (Exception e) {
    %>
            <div class="message" style="color: red;">Error: <%= e.getMessage() %></div>
            <a href="index.jsp" class="btn">Go to Home</a>
    <%
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ignore) {}
        }
    %>
</div>

 <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
