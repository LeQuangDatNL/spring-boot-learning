<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../components/head-libs.jsp" />
</head>
<body>
<jsp:include page="../components/header.jsp" />

    <div class="container flex-grow-1 d-flex align-items-center justify-content-center py-5">
        <div class="col-md-5 col-lg-4">
            <div class="card shadow-lg p-4">
                <div class="card-body">
                    <div class="text-center mb-4">
                        <h3 class="fw-bold text-dark">Mừng bạn quay lại!</h3>
                        <p class="text-muted small">Đăng nhập để tiếp tục lộ trình học tập</p>
                    </div>
                    
                    <c:if test="${not empty param.success or not empty successMessage}">
                        <div class="alert alert-success d-flex align-items-center shadow-sm" role="alert">
                            <i class="fas fa-circle-check me-2"></i>
                            <div class="small">Đăng ký thành công! Vui lòng đăng nhập.</div>
                        </div>
                    </c:if>

                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger error-box d-flex align-items-center shadow-sm" role="alert">
                            <i class="fas fa-circle-exclamation me-2"></i>
                            <div class="small">${errorMessage}</div>
                        </div>
                    </c:if>
                    
                    <form action="${pageContext.request.contextPath}/login" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-semibold small">Tên đăng nhập</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="fas fa-user text-muted"></i></span>
                                <input type="text" name="tenDangNhap" class="form-control bg-light border-start-0" placeholder="Username" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="d-flex justify-content-between">
                                <label class="form-label fw-semibold small">Mật khẩu</label>
                                <a href="#" class="small text-decoration-none">Quên mật khẩu?</a>
                            </div>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="fas fa-lock text-muted"></i></span>
                                <input type="password" name="matKhau" class="form-control bg-light border-start-0" placeholder="••••••••" required>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 fw-bold py-2 mt-2 mb-3 shadow-sm">
                            ĐĂNG NHẬP
                        </button>

                        <div class="text-center mt-3">
                            <p class="small text-muted">Bạn mới biết đến Anh Ngữ Pro? 
                                <a href="${pageContext.request.contextPath}/DangKy" class="text-primary fw-bold text-decoration-none">Tạo tài khoản</a>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../components/footer.jsp" />
</body>
</html>