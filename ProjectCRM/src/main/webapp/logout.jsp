<%
    session.invalidate(); // End user session
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <meta http-equiv="refresh" content="2;URL=login.jsp">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
    <div class="text-center">
        <div class="spinner-border text-primary mb-3" role="status"></div>
        <h4>You have been logged out.</h4>
        <p>Redirecting to login page...</p>
    </div>
</body>
</html>
