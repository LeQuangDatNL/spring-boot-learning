<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="../components/head-libs.jsp" />
    <style>
        .card { border-radius: 15px; border: none; }
        .btn-primary { border-radius: 8px; background: linear-gradient(45deg, #0d6efd, #0048b3); }
        .form-control { border-radius: 8px; }
    </style>
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <jsp:include page="../components/header.jsp" />

    <div class="container flex-grow-1 d-flex align-items-center justify-content-center py-5">
        <div class="col-md-7 col-lg-5">
            <div class="card shadow-lg p-3">
                <div class="card-body">
                    <div class="text-center mb-4">
                        <h3 class="fw-bold text-dark">Tham gia Anh Ngữ Pro</h3>
                        <p class="text-muted small">Tạo tài khoản để bắt đầu lộ trình chinh phục tiếng Anh</p>
                    </div>

                    <c:if test="${not empty error}">
                        <div class="alert alert-danger d-flex align-items-center shadow-sm" role="alert">
                            <i class="fas fa-circle-exclamation me-2"></i>
                            <div class="small">${error}</div>
                        </div>
                    </c:if>

                    <form action="${pageContext.request.contextPath}/DangKy" method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-semibold small">Tên đăng nhập</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0"><i class="fas fa-user text-muted"></i></span>
                                <input type="text" name="tenDangNhap" class="form-control bg-light border-start-0" placeholder="Username" required value="${user.tenDangNhap}">
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold small">Mật khẩu</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="fas fa-lock text-muted"></i></span>
                                    <input type="password" name="matKhau" class="form-control bg-light border-start-0" placeholder="••••••••" required>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold small">Xác nhận</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0"><i class="fas fa-check-double text-muted"></i></span>
                                    <input type="password" name="confirmPassword" class="form-control bg-light border-start-0" placeholder="••••••••" required>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold small">Họ và Tên</label>
                            <input type="text" name="hoTen" class="form-control bg-light" placeholder="Nguyễn Văn A" required value="${user.hoTen}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold small">Email</label>
                            <input type="email" name="email" class="form-control bg-light" placeholder="example@gmail.com" required value="${user.email}">
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold small">Số điện thoại</label>
                            <input type="text" name="soDienThoai" class="form-control bg-light" placeholder="09xxxxxxx" required value="${user.soDienThoai}">
                        </div>

                        <button type="submit" class="btn btn-primary w-100 fw-bold py-2 mt-2 mb-3 shadow-sm">
                            ĐĂNG KÝ NGAY
                        </button>

                        <div class="text-center">
                            <p class="small text-muted">Đã có tài khoản? 
                                <a href="${pageContext.request.contextPath}/DangNhap" class="text-primary fw-bold text-decoration-none">Đăng nhập tại đây</a>
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