<?php
include 'db_connector.php';

if (isset($_GET['subject'])) {
    $subject = $_GET['subject'];
    $query = "SELECT * FROM schedule WHERE subject = ?";
    $stmt = $connection->prepare($query);
    $stmt->bind_param("s", $subject);
    $stmt->execute();
    $result = $stmt->get_result();

    $schedules = array();

    while ($row = $result->fetch_assoc()) {
        $start_time = date('h:i A', strtotime($row['start_time']));
        $end_time = date('h:i A', strtotime($row['end_time']));
        $schedule = $row['subject'] . ' ' . $row['day'] . ' ' . $start_time . ' - ' . $end_time;
        $schedules[] = $schedule;
    }

    echo json_encode($schedules);

    $stmt->close();
} else {
    echo json_encode(array("error" => "No subject provided."));
}
$connection->close();
?>


