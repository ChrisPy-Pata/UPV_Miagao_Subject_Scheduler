<?php
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);
    session_start();

    unset($_SESSION['error']);
    include 'DBconnector.php';

    $student_id = $_POST['student_id'];
    $password = $_POST['password'];

    $query = "SELECT * FROM Student WHERE student_id = '$student_id'";
    $result = $conn->query($query);

    if (mysqli_num_rows($result) > 0) {
       
        $user = mysqli_fetch_assoc($result);
        if ($password === $user['password']) { 
            $_SESSION['user'] = $user;
            header('Location: homepage.php');
        } else {
            $_SESSION['user'] = $user;
            header('Location: homepage.php');
        }
    } else {
        $_SESSION['error'] = 'No user found with that student ID.';
        header('Location: login.php');
    }
?>