<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../../components/head-libs.jsp" />
    <style>
        .exam-header { background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%); color: white; padding: 40px 0; border-radius: 15px; margin-bottom: 30px; }
        .stat-card { background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2); border-radius: 10px; padding: 15px; text-align: center; }
        .mode-item { transition: transform 0.2s; border-left: 5px solid #0d6efd; }
        .mode-item:hover { transform: translateX(10px); background-color: #f8f9fa; }
    </style>
</head>
<body class="bg-light">
    <jsp:include page="../../components/header.jsp" />

    <div class="container my-5">
        <div class="exam-header shadow-lg px-4">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/TrangChu" class="text-white-50">Trang chủ</a></li>
                            <li class="breadcrumb-item active text-white" aria-current="page">Chi tiết bộ đề</li>
                        </ol>
                    </nav>
                    <h1 class="display-5 fw-bold">${boCauHoi.ten}</h1>
                    <p class="lead">${boCauHoi.moTa}</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-white py-3">
                        <h5 class="mb-0 fw-bold"><i class="fas fa-list-ol me-2 text-primary"></i>Danh sách các phần luyện tập</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="list-group list-group-flush">
                            <c:forEach var="md" items="${dsMoDe}" varStatus="status">
                                <div class="list-group-item p-4 mode-item">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="fw-bold mb-1">Phần ${status.count}: Nội dung luyện tập #${md.maMoDe}</h6>
                                            <p class="text-muted small mb-0">
                                                <i class="fas fa-file-alt me-1"></i> Nội dung: 
                                                ${md.nguonFile != null ? 'Nghe (Audio)' : 'Đọc hiểu (Text)'}
                                            </p>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/User/MoDe/LuyenTap/${md.maMoDe}" 
                                           class="btn btn-outline-primary rounded-pill px-4">
                                            Luyện tập <i class="fas fa-chevron-right ms-1"></i>
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${empty dsMoDe}">
                                <div class="p-5 text-center text-muted">
                                    <i class="fas fa-box-open fa-3x mb-3"></i>
                                    <p>Bộ đề này hiện chưa có nội dung chi tiết.</p>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../../components/footer.jsp" />
</body>
</html>