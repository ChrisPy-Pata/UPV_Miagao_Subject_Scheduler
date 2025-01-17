<?php
include 'db_connector.php';

if(isset($_GET['subject'])) {
    $subject = $connection->real_escape_string($_GET['subject']); // Using real_escape_string to prevent SQL injection

    $deleteQuery = "DELETE FROM enlisted WHERE subject = '$subject'";

    if ($connection->query($deleteQuery) === TRUE) {
        echo "Enlisted subject '$subject' deleted successfully";
    } else {
        echo "Error deleting enlisted subject: " . $connection->error;
    }
} else {
    echo "Subject not provided";
}

$connection->close();
?>
