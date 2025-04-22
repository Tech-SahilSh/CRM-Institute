<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Fees</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">

        <!-- Left Sidebar -->
        <div class="col-md-2 bg-dark text-white p-3" style="min-height: 100vh;">
            <h5>Admin Panel</h5>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link text-white" href="manage_student.jsp">Manage Students</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="manage_course.jsp">Manage Courses</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="manage_fees.jsp">Manage Fees</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="login.jsp">Logout</a></li>
            </ul>
        </div>

        <!-- Right Content -->
        <div class="col-md-10 p-4">
            <h3 class="mb-4">Add New Fees</h3>
            <form action="save_fees.jsp" method="post">

                <!-- Student Dropdown -->
                <div class="form-group">
                    <label for="std_id">Select Student</label>
                    <select name="std_id" class="form-control" required>
                        <option value="">-- Select Student --</option>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("SELECT std_id, CONCAT(std_first_name, ' ', std_last_name) AS full_name FROM student");
                                while(rs.next()) {
                        %>
                            <option value="<%= rs.getString("std_id") %>"><%= rs.getString("full_name") %></option>
                        <%
                                }
                                rs.close();
                                st.close();
                                con.close();
                            } catch(Exception e) {
                                out.println("Student Load Error: " + e.getMessage());
                            }
                        %>
                    </select>
                </div>

                <!-- Course Dropdown -->
                <div class="form-group">
                    <label for="course_id">Select Course</label>
                    <select name="course_id" class="form-control" required>
                        <option value="">-- Select Course --</option>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmdb", "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("SELECT course_id, course_name FROM course");
                                while(rs.next()) {
                        %>
                            <option value="<%= rs.getString("course_id") %>"><%= rs.getString("course_name") %></option>
                        <%
                                }
                                rs.close();
                                st.close();
                                con.close();
                            } catch(Exception e) {
                                out.println("Course Load Error: " + e.getMessage());
                            }
                        %>
                    </select>
                </div>

                <!-- Amount Paid -->
                <div class="form-group">
                    <label for="amount_paid">Amount Paid</label>
                    <input type="text" name="amount_paid" class="form-control" required>
                </div>

                <!-- Pay Date -->
                <div class="form-group">
                    <label for="pay_date">Payment Date</label>
                    <input type="date" name="pay_date" class="form-control" required>
                </div>

                <!-- Pay Balance -->
                <div class="form-group">
                    <label for="pay_balance">Balance Amount</label>
                    <input type="text" name="pay_balance" class="form-control" required>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-success">Save Fees</button>
                <a href="manage_fees.jsp" class="btn btn-secondary ml-2">Cancel</a>
            </form>
        </div>

    </div>
</div>
</body>
</html>
