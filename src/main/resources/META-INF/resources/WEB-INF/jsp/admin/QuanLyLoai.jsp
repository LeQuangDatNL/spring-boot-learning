<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../../components/head-libs.jsp" />
</head>
<body>
	<jsp:include page="../../components/sidebar.jsp" />
	<div class="content">
	    <h3 class="mb-4">📂 Quản Lý Loại Câu Hỏi</h3>
	
	    <!-- FORM THÊM / SỬA -->
	    <div class="card mb-4">
	        <div class="card-header bg-primary text-white">
	            ${loai.maLoai != null ? 'Cập nhật loại' : 'Thêm loại mới'}
	        </div>
	
	        <div class="card-body">
	            <form method="post"
	                  action="${loai.maLoai != null ? '/Admin/QuanLyLoai/CapNhat' : '/Admin/QuanLyLoai/Them'}">
	
					<c:if test="${loai.maLoai != null}">
					    <input type="hidden" name="maLoai" value="${loai.maLoai}" />
					</c:if>
	
	                <div class="mb-3">
	                    <label class="form-label">Tên loại</label>
	                    <input type="text"
	                           name="tenLoai"
	                           class="form-control"
	                           required
	                           value="${loai.tenLoai}" />
	                </div>
	
	                <button type="submit" class="btn btn-success">
					    ${loai.maLoai != null ? 'Cập nhật loại' : 'Thêm loại mới'}
					</button>
	                <c:if test="${loai != null}">
	                    <a href="/Admin/QuanLyLoai" class="btn btn-secondary ms-2">Hủy</a>
	                </c:if>
	            </form>
	        </div>
	    </div>
	
	    <!-- DANH SÁCH -->
	    <div class="card">
	        <div class="card-header bg-dark text-white">
	            Danh sách loại
	        </div>
	
	        <div class="card-body p-0">
	            <table class="table table-bordered table-hover mb-0">
	                <thead class="table-light">
	                <tr>
	                    <th style="width: 80px">Mã</th>
	                    <th>Tên loại</th>
	                    <th style="width: 150px">Thao tác</th>
	                </tr>
	                </thead>
	                <tbody>
	                <c:forEach items="${dsLoai}" var="l">
	                    <tr>
	                        <td>${l.maLoai}</td>
	                        <td>${l.tenLoai}</td>
	                        <td>
	                            <a href="/Admin/QuanLyLoai/Sua/${l.maLoai}"
	                               class="btn btn-sm btn-warning">Sửa</a>
	                            <a href="/Admin/QuanLyLoai/Xoa/${l.maLoai}"
	                               onclick="return confirm('Xóa loại này?')"
	                               class="btn btn-sm btn-danger">Xóa</a>
	                        </td>
	                    </tr>
	                </c:forEach>
	
	                <c:if test="${empty dsLoai}">
	                    <tr>
	                        <td colspan="3" class="text-center text-muted py-3">
	                            Chưa có loại nào
	                        </td>
	                    </tr>
	                </c:if>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>

</body>
</html>