<?php
    session_start();    
    include 'DBconnector.php';
    $student_ID = $_SESSION['user']['student_ID'];
    $query = "SELECT * FROM Student WHERE student_ID = '$student_ID'";
    $result = $conn->query($query);
    $data = $result->fetch_assoc();

?>

<!DOCTYPE html>
<html> 
<head>
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="homepage-style.css"> 
<body>
    <div id="header">
        <img src="crs-header.png" alt="CRS Header" id="crs-header">
    </div>  
    <div onclick="openNav()"><img src="icons/sidebar.png" class="sidebar-open" id="sidebar-open"></div>
    <div class="overlay" id="myNav">
        <div class="overlay-content">
            <span class="sidebar-close" onclick="closeNav()">&times;</span>
                <div><h1 class="sidebar-category">Student's Guide</h1>
                    <div>
                        <button class="button-2" onclick="openPDF('files/UPVScholarships.pdf')">Scholarships</button>
                    </div>
                    <div>
                        <button class="button-2" onclick="openPDF('files/upv-student-organizations.pdf')">Student Organizations</button>
                    </div>
                    <div>
                        <button class="button-2" onclick="openPDF('files/campus_map.jpg')">Campus Map</button>
                    </div>
                    <div>
                        <button class="button-2" onclick="openPDF('files/upv-student-handbook-2023-2024.pdf')">Student Handbook</button>
                    </div>
                    <div>
                        <button class="button-2" onclick="openPDF('files/ACADEMIC_CALENDAR_23_24-UNDERGRADUATE-SEMESTRAL.pdf')">Academic Calendar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content-1">
        <img src="<?php echo $data['student_id_pic']; ?>" id="student-id">
            <p class="identifier">Student ID</p>
            <p class="student-info"><?php echo $data['student_ID']; ?></p>

            <p class="identifier">Degree Program</p>
            <p class="student-info"><?php echo $data['degree_program'];?></p>

            <p class="identifier">Year Level</p>
            <p class="student-info"><?php echo $data['year_level']; ?></p>

            <p class="identifier">Degree Level</p>
            <p class="student-info"><?php echo $data['degree_level']; ?></p>

            <p class="identifier">Scholarship</p>
            <p class="student-info"><?php echo $data['scholarship']; ?></p>
    </div>
    <div class="content-2">
        <div class="identifier">REGISTRATION</div>
        <div class="dropdown">
            <button class="button-1" id="view-subjects-btn">View Subjects</button>
        </div>
        <div>
        <button class="button-1" onclick="location.href='register.php'" >Enlist Subjects</button>
        </div>
    </div>
    <div class="content-3">
        <input type="file" id="pdf-input" hidden>
        <div id="pdf-container">
          <iframe id="pdf-viewer" width="100%" height="100%" frameborder="0"></iframe>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>