<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername="localhost";
$username="root";
$password="";
$dbname="upsDB";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Retrieve selected subjects
$query = "SELECT DISTINCT subject FROM enlisted";
$result = $conn->query($query);

$selectedSubjects = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $selectedSubjects[] = $row['subject'];
    }
}

// Retrieve timeslots for each subject
$timeslots = array();

foreach ($selectedSubjects as $subject) {
    $query = "SELECT day, start_time, end_time FROM schedule WHERE subject = '$subject'";
    $result = $conn->query($query);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $timeslots[$subject][] = array(
                'day' => $row['day'],
                'start_time' => $row['start_time'],
                'end_time' => $row['end_time']
            );
        }
    }
}

// Output the data as JSON
header('Content-Type: application/json');
echo json_encode(array('subjects' => $selectedSubjects, 'timeslots' => $timeslots));
?>
