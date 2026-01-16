<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Bộ Câu Hỏi</title>
    <jsp:include page="../../components/head-libs.jsp" />
</head>
<body>
<jsp:include page="../../components/gv-sidebar.jsp" />

<div class="content p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="bi bi-collection-play me-2"></i>Danh Sách Bộ Câu Hỏi</h2>
        <a href="${pageContext.request.contextPath}/Teacher/ThemBoCauHoi" class="btn btn-success">
            <i class="bi bi-plus-circle me-2"></i>Tạo bộ câu hỏi mới
        </a>
    </div>

    <div class="row">
        <c:if test="${empty danhSachBoCauHoi}">
            <div class="col-12 text-center py-5">
                <img src="https://cdn-icons-png.flaticon.com/512/7486/7486744.png" width="150" class="opacity-50 mb-3">
                <p class="text-muted fs-5">Bạn chưa có bộ câu hỏi nào. Hãy bắt đầu tạo mới!</p>
            </div>
        </c:if>

        <c:forEach var="bch" items="${danhSachBoCauHoi}">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card h-100 shadow-sm border-0">
                    <img src="${not empty bch.anh ? bch.anh : 'https://via.placeholder.com/350x180?text=No+Image'}" 
                         class="card-img-top" alt="${bch.ten}">
                    
                    <div class="card-body">
                        <h5 class="card-title text-primary fw-bold">${bch.ten}</h5>
                        <p class="card-text text-truncate-2" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;">
                            ${bch.moTa}
                        </p>
                        <small class="text-muted"><i class="bi bi-clock me-1"></i> Cập nhật: 10/10/2025</small>
                    </div>

                    <div class="card-footer bg-white border-top-0 d-flex justify-content-between pb-3">
                        <a href="${pageContext.request.contextPath}/Teacher/ChiTietBoCauHoi/${bch.maBoCauHoi}" 
                           class="btn btn-outline-primary btn-sm px-3">
                           <i class="bi bi-eye"></i> Xem chi tiết
                        </a>
                        <div>
                            <a href="${pageContext.request.contextPath}/Teacher/SuaBoCauHoi/${bch.maBoCauHoi}" 
                               class="btn btn-outline-warning btn-sm me-1">
                               <i class="bi bi-pencil">
                               		Sửa
                               </i>
                            </a>
                            <a href="${pageContext.request.contextPath}/Teacher/XoaBoCauHoi/${bch.maBoCauHoi}" 
                               class="btn btn-outline-danger btn-sm" 
                               onclick="return confirm('Bạn có chắc chắn muốn xóa bộ câu hỏi này?')">
                               <i class="bi bi-trash">
                               		Xóa
                               </i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>