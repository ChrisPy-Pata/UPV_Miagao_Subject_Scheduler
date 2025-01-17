function isConflict(currentSchedule, newTimeslot) {
    for (const timeslot of Object.values(currentSchedule)) {
        if (
            timeslot.day === newTimeslot.day && // same day
            (
                // Check if new time slot starts during existing or ends during existing
                (new Date('1970-01-01T' + newTimeslot.start_time) >= new Date('1970-01-01T' + timeslot.start_time) && new Date('1970-01-01T' + newTimeslot.start_time) < addMinutes(new Date('1970-01-01T' + timeslot.end_time), 30)) ||
                (new Date('1970-01-01T' + newTimeslot.end_time) > new Date('1970-01-01T' + timeslot.start_time) && new Date('1970-01-01T' + newTimeslot.end_time) <= addMinutes(new Date('1970-01-01T' + timeslot.end_time), 30))
            )
        ) {
            return true;
        }
    }
    return false;
}

function addMinutes(date, minutes) {
    return new Date(date.getTime() + minutes*60000);
}

function scheduleSubjects(subjects, timeslots, currentSchedule, subjectIndex, allSchedules) {
    if (subjectIndex === subjects.length) {
        allSchedules.push({ ...currentSchedule });
        return;
    }

    const subject = subjects[subjectIndex];
    if (!timeslots[subject]) {
        console.error(`No timeslots provided for subject: ${subject}`);
        return;
    }

    for (const timeslot of timeslots[subject]) {
        if (!isConflict(currentSchedule, timeslot)) {
            currentSchedule[subject] = timeslot;
            scheduleSubjects(subjects, timeslots, currentSchedule, subjectIndex + 1, allSchedules);
            delete currentSchedule[subject];
        }
    }
}

function findAllSchedules(subjects, timeslots) {
    const allSchedules = [];
    const currentSchedule = {};
    scheduleSubjects(subjects, timeslots, currentSchedule, 0, allSchedules);
    return allSchedules;
}



// ...

document.getElementById('generate').addEventListener('click', () => {
    fetch('generateSchedule.php')
        .then(response => response.json())
        .then(data => {

            const subjects = data.subjects;
            let timeslots = data.timeslots;

            for (let subject in timeslots) {
                timeslots[subject] = timeslots[subject].map(timeslot => {
                    return {
                        ...timeslot,
                        start_time: timeslot.start_time.slice(0, 5),
                        end_time: timeslot.end_time.slice(0, 5)
                    };
                });
            }

            const allSchedules = findAllSchedules(subjects, timeslots);

            window.generatedSchedules = allSchedules;

            const output = document.getElementById('output');
            output.innerHTML = ''; 

            for (let schedule of window.generatedSchedules) {
                // Convert the format of the schedule
                var convertedSchedule = Object.keys(schedule).map(key => {
                    var subject = schedule[key];
                    return {
                        name: key,
                        day: subject.day,
                        start_time: subject.start_time.replace(/:/g, '-'),
                        end_time: subject.end_time.replace(/:/g, '-')
                    };
                });

                // Create a new table for this schedule
                var table = document.createElement('table');
                output.appendChild(table);

                            // Create the header row
                var headerRow = document.createElement('tr');
                var titles = ["Time", "Monday/Thursday", "Tuesday/Friday", "Wednesday"];
                var headers = ["Time", "Monday", "Tuesday", "Wednesday"];
                titles.forEach(function(headerText) {
                    var th = document.createElement('th');
                    th.appendChild(document.createTextNode(headerText));
                    headerRow.appendChild(th);
                });
                table.appendChild(headerRow);

                // Create the time slots
                var times = [
                    "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30",
                    "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30",
                    "16:00", "16:30", "17:00", "17:30", "18:00"
                ];

                times.forEach(function(time) {
                    var row = document.createElement('tr');

                    var timeCell = document.createElement('td');
                    timeCell.className = 'time-' + time.replace(':', '-');
                    timeCell.appendChild(document.createTextNode(time));
                    row.appendChild(timeCell);

                    headers.slice(1).forEach(function(day) {
                        var cell = document.createElement('td');
                        cell.className = day;
                        row.appendChild(cell);
                    });

                    table.appendChild(row);
                });

                for (let subject of convertedSchedule) {
                    var day = subject.day;
                    var start_time = subject.start_time;

                    // Parse end_time into a Date object
                    var end_time_parts = subject.end_time.split("-");
                    var end_time_date = new Date();
                    end_time_date.setHours(end_time_parts[0]);
                    end_time_date.setMinutes(end_time_parts[1]);

                    // Subtract 30 minutes
                    end_time_date.setMinutes(end_time_date.getMinutes() - 30);

                    // Format back into HH-MM
                    var end_time = ("0" + end_time_date.getHours()).slice(-2) + "-" + ("0" + end_time_date.getMinutes()).slice(-2);

                    var startTimeClass = "time-" + start_time;
                    var endTimeClass = "time-" + end_time;

                    var rows = table.querySelectorAll(`tr`);
                    var colorCells = false;

                    for (let i = 0; i < rows.length; i++) {
                        if (rows[i].querySelector(`.${startTimeClass}`)) {
                            colorCells = true;
                        }
                        if (colorCells) {
                            var cell = rows[i].querySelector(`.${day}`);
                            if (cell) {
                            cell.style.backgroundColor = "#e5e5e570";
                                cell.innerText = subject.name;
                            }
                        }
                        if (rows[i].querySelector(`.${endTimeClass}`)) {
                            colorCells = false;
                        }
                    }
                }
            }
        })
        .catch(error => console.error('Error:', error));
});



