

function openNav() {
  document.getElementById("myNav").style.width = "25%";
  document.getElementById("sidebar-open").style.display = "none";
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
  document.getElementById("sidebar-open").style.display = "block";
}

document.getElementById('pdf-input').addEventListener('change', function(e) {
  var file = e.target.files[0];
  var reader = new FileReader();
  reader.onload = function(event) {
    document.getElementById('pdf-viewer').src = event.target.result;
  };
  reader.readAsDataURL(file);
});

document.getElementById('view-subjects-btn').addEventListener('click', function() {
  document.getElementById('pdf-viewer').src = 'files/study-plan.pdf';
});

function openPDF(path) {
  document.getElementById('pdf-viewer').src = path;
}