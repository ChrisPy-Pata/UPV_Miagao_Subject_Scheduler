<?php
// Database connection
$conn = new mysqli("localhost", "root", "", "upsDB");

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$subjects = array();

// Query to get distinct subjects
$query = "SELECT DISTINCT subject FROM enlisted";
$result = $conn->query($query);

if ($result->num_rows > 0) {
    // Fetch subjects and add them to the subjects array
    while ($row = $result->fetch_assoc()) {
        $subjects[] = $row['subject'];
    }
}

// Return subjects array as JSON
echo json_encode($subjects);

$conn->close();
?>
