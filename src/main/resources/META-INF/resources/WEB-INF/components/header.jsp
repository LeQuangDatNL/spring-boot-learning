<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="bg-white shadow-sm sticky-top">
    <nav class="navbar navbar-expand-lg py-3">
        <div class="container">
            <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/" style="color: var(--primary-blue);">
                <i class="fa-solid fa-graduation-cap me-2 fs-3"></i>
                <span class="tracking-tight">ANH NGỮ PRO</span>
            </a>
            
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                	<li class="nav-item"><a class="nav-link fw-medium text-dark px-3" href="/BoCauHoi">Bộ câu hỏi</a></li>
                    <li class="nav-item"><a class="nav-link fw-medium text-dark px-3" href="#">Xếp hạng</a></li>
                </ul>
                
				<div class="d-flex align-items-center gap-2">
				    <c:choose>
				        <c:when test="${not empty sessionScope.userName}">
				            <span class="fw-semibold">Xin chào, ${sessionScope.userName}</span>
				            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger fw-semibold px-4 rounded-pill">Đăng xuất</a>
				        </c:when>
				        <c:otherwise>
				            <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary fw-semibold px-4 rounded-pill">Đăng nhập</a>
				            <a href="${pageContext.request.contextPath}/DangKy" class="btn btn-primary fw-semibold px-4 rounded-pill">Đăng ký</a>
				        </c:otherwise>
				    </c:choose>
				</div>
            </div>
        </div>
    </nav>
</header>