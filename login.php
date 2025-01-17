<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="login-style.css">
</head>
<body>
    <div class="login-div">
        <form action="validate.php" method="post">
            <label for="student_id">Student ID:</label><br>
            <input type="text" id="student_id" name="student_id" required><br>
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>