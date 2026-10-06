<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    </div> <!-- End Content -->
</div> <!-- End Wrapper -->

<footer>
    <div class="container">
        <p class="mb-0">&copy; <%= java.time.Year.now().getValue() %> DocuVerify. All rights reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
