// Wait for DOM to load
document.addEventListener("DOMContentLoaded", function() {
    
    // Sidebar Toggle
    const sidebarCollapse = document.getElementById('sidebarCollapse');
    const sidebar = document.getElementById('sidebar');
    const content = document.getElementById('content');
    
    if (sidebarCollapse) {
        sidebarCollapse.addEventListener('click', function() {
            sidebar.classList.toggle('active');
            content.classList.toggle('active');
        });
    }

    // Auto-dismiss alerts after 5 seconds
    const alerts = document.querySelectorAll('.alert:not(.alert-permanent)');
    alerts.forEach(function(alert) {
        setTimeout(function() {
            const bsAlert = new bootstrap.Alert(alert);
            bsAlert.close();
        }, 5000);
    });

    // Certificate Live Preview
    const studentNameInput = document.getElementById('studentName');
    const courseInput = document.getElementById('course');
    const gradeInput = document.getElementById('grade');
    
    const previewName = document.getElementById('preview-name');
    const previewCourse = document.getElementById('preview-course');
    const previewGrade = document.getElementById('preview-grade');
    
    if (studentNameInput && previewName) {
        studentNameInput.addEventListener('input', function() {
            previewName.textContent = this.value || '[Student Name]';
        });
    }
    
    if (courseInput && previewCourse) {
        courseInput.addEventListener('input', function() {
            previewCourse.textContent = this.value || '[Course Name]';
        });
    }
    
    if (gradeInput && previewGrade) {
        gradeInput.addEventListener('change', function() {
            previewGrade.textContent = this.value || '[Grade]';
        });
    }

    // Table Search/Filter
    const searchInput = document.getElementById('tableSearch');
    if (searchInput) {
        searchInput.addEventListener('keyup', function() {
            const value = this.value.toLowerCase();
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.indexOf(value) > -1 ? '' : 'none';
            });
        });
    }

    // Confirm Delete
    const deleteButtons = document.querySelectorAll('.btn-delete');
    deleteButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            if (!confirm('Are you sure you want to delete this record? This action cannot be undone.')) {
                e.preventDefault();
            }
        });
    });
    
    // Client-side Form Validation
    const forms = document.querySelectorAll('.needs-validation');
    Array.prototype.slice.call(forms).forEach(function(form) {
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            
            // Password match validation
            const password = form.querySelector('#password');
            const confirmPassword = form.querySelector('#confirmPassword');
            
            if (password && confirmPassword) {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity("Passwords do not match");
                    event.preventDefault();
                    event.stopPropagation();
                } else {
                    confirmPassword.setCustomValidity("");
                }
            }
            
            form.classList.add('was-validated');
        }, false);
    });
});
