<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Result</title>
     <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e8f0fe;
            padding: 30px;
        }
       
    </style>
</head>
<body>
<jsp:include page="navigation.jsp"/>
<div class="log_s_container">
    <%
        String email = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

            String sql = "SELECT * FROM student WHERE std_email = ? AND std_passward = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            if (rs.next()) {
    %>
    <%
    session.setAttribute("std_id",String.valueOf( rs.getInt("std_id")));%>
                <div class="container mt-5 log_s_success">Login successful! Welcome, <%= rs.getString("std_first_name") %>!</div>
                <a href="student_dashboard.jsp" class="log_s_btn">Go to Dashboard</a>
    <%
            } else {
    %>
                <div class="container mt-5 log_s_error">Invalid email or password.</div>
                <a href="login.jsp" class="log_s_btn">Try Again</a>
    <%
            }
        } catch (Exception e) {
    %>
            <div class="log_s_error">Error: <%= e.getMessage() %></div>
            <a href="login.jsp" class="log_s_btn">Back to Login</a>
    <%
        } finally {
            try {
                if (rs != null) rs.close();
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
