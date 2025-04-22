<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%
    request.setCharacterEncoding("UTF-8");

    String stdId = request.getParameter("std_id");
    String courseId = request.getParameter("course_id");
    String enrollDate = request.getParameter("enroll_date");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");

        // Check if already enrolled
        PreparedStatement check = con.prepareStatement("SELECT * FROM enrollment WHERE std_id=? AND course_id=?");
        check.setString(1, stdId);
        check.setString(2, courseId);
        ResultSet rs = check.executeQuery();

        if(rs.next()) {
%>
            <script>
                alert("You are already enrolled in this course!");
                window.location = "student_dashboard.jsp";
            </script>
<%
        } else {
            PreparedStatement ps = con.prepareStatement("INSERT INTO enrollment (std_id, course_id, enroll_date, status) VALUES (?, ?, ?, ?)");
            ps.setString(1, stdId);
            ps.setString(2, courseId);
            ps.setString(3, enrollDate);
            ps.setString(4, "active");

            int i = ps.executeUpdate();

            if(i > 0) {
%>
                <script>
                    alert("Enrolled successfully!");
                    window.location = "student_dashboard.jsp";
                </script>
<%
            } else {
%>
                <script>
                    alert("Enrollment failed!");
                    window.location = "student_dashboard.jsp";
                </script>
<%
            }

            ps.close();
        }

        rs.close();
        check.close();
        con.close();

    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
