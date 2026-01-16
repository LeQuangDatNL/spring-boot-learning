<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa Bộ Câu Hỏi</title>
    <jsp:include page="../../components/head-libs.jsp" />
    <style>
        .content { margin-left: 260px; padding: 30px; }
    </style>
</head>
<body>
<jsp:include page="../../components/gv-sidebar.jsp" />

<div class="content">
    <div class="card shadow border-0">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Chỉnh sửa Bộ câu hỏi</h4>
        </div>
        <div class="card-body">
		    <form action="${pageContext.request.contextPath}/Teacher/CapNhatBoCauHoi" 
		          method="post" 
		          enctype="multipart/form-data">
		        
		        <input type="hidden" name="maBoCauHoi" value="${boCauHoi.maBoCauHoi}">
		
		        <div class="mb-3">
		            <label class="form-label fw-bold">Tên bộ câu hỏi</label>
		            <input type="text" name="ten" class="form-control" value="${boCauHoi.ten}" required>
		        </div>
		
		        <div class="mb-3">
		            <label class="form-label fw-bold">Ảnh hiện tại</label>
		            <div class="mb-2">
		                <img src="${boCauHoi.anh}" 
		                     alt="Ảnh cũ" style="max-width: 200px; border-radius: 8px;">
		            </div>
		            <label class="form-label fw-bold">Thay đổi ảnh mới</label>
		            <input type="file" name="fileAnh" class="form-control" accept="image/*">
		            <small class="text-muted">Để trống nếu không muốn đổi ảnh.</small>
		        </div>
		
		        <div class="mb-3">
		            <label class="form-label fw-bold">Mô tả</label>
		            <textarea name="moTa" class="form-control" rows="4">${boCauHoi.moTa}</textarea>
		        </div>
		
		        <div class="mt-4">
		            <button type="submit" class="btn btn-success px-4">Lưu thay đổi</button>
		            <a href="${pageContext.request.contextPath}/Teacher/DanhSachBoCauHoi" class="btn btn-secondary px-4">Hủy</a>
		        </div>
		    </form>
		</div>
    </div>
</div>
</body>
</html>