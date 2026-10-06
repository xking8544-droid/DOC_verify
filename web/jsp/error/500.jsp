<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>500 Server Error - DocuVerify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-light d-flex align-items-center justify-content-center" style="min-height: 100vh;">

    <div class="text-center px-4">
        <i class="bi bi-exclamation-triangle-fill text-danger mb-3" style="font-size: 5rem;"></i>
        <h1 class="display-1 fw-bold text-danger mb-0">500</h1>
        <h3 class="fw-bold mb-3">Internal Server Error</h3>
        <p class="text-muted mb-4 lead">Oops! Something went wrong on our end. Please try again later.</p>
        
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-secondary px-4 py-2 fw-bold">
            <i class="bi bi-arrow-left me-2"></i>Back to Home
        </a>
    </div>

</body>
</html>
