<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Course</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="p-4">
<div class="container">
    <h3 class="mb-4">Add New Course</h3>
    <form action="save_course.jsp" method="post">
        <div class="mb-3">
            <label>Course ID</label>
            <input type="text" name="course_id" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Course Name</label>
            <input type="text" name="course_name" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Duration</label>
            <input type="text" name="course_duration" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Fees</label>
            <input type="number" name="course_fees" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Save Course</button>
        <a href="manage_course.jsp" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>
