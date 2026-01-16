<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="../components/head-libs.jsp" />
</head>
<body class="d-flex flex-column min-vh-100">
	<jsp:include page="../components/header.jsp" />
    <section class="search-section mt-4 mb-4">
	    <div class="container">
	        <form action="${pageContext.request.contextPath}/BoCauHoi" method="get" class="row g-3">
	            <div class="col-md-4">
	                <input type="text" name="key" class="form-control" 
	                       placeholder="Tên bộ câu hỏi..." value="${param.key}">
	            </div>
	
	            <div class="col-md-3">
	                <select name="MaLoai" class="form-select">
					    <option value="">-- Tất cả loại --</option>
					    <c:forEach var="loaiObj" items="${listLoai}">
					        <option value="${loaiObj.tenLoai}" ${param.MaLoai == loaiObj.tenLoai ? 'selected' : ''}>
					            ${loaiObj.tenLoai}
					        </option>
					    </c:forEach>
					</select>
	            </div>
	
	            <div class="col-md-3">
	                <select name="tenGv" class="form-select">
	                    <option value="">-- Tất cả giáo viên --</option>
	                    <c:forEach var="gvName" items="${listGV}">
	                        <option value="${gvName}" ${param.tenGv == gvName ? 'selected' : ''}>
	                            ${gvName}
	                        </option>
	                    </c:forEach>
	                </select>
	            </div>
	
	            <div class="col-md-2">
	                <button type="submit" class="btn btn-primary w-100 shadow-sm">
	                    <i class="fas fa-search me-1"></i> Tìm kiếm
	                </button>
	            </div>
	        </form>
	    </div>
	</section>

    <main class="container mb-5 flex-grow-1">

        <div class="row g-4 card-container">
            <c:choose>
                <c:when test="${not empty dsBoCauHoi}">
                    <c:forEach var="ch" items="${dsBoCauHoi}">
                        <div class="col-md-4 col-sm-6">
                            <c:set var="item" value="${ch}" scope="request" />
                            <jsp:include page="../components/test-card.jsp" />
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-12 text-center py-5">
                        <img src="https://cdn-icons-png.flaticon.com/512/7486/7486744.png" width="100" class="mb-3 opacity-50">
                        <p class="text-muted">Không tìm thấy bộ câu hỏi nào phù hợp.</p>
                        <a href="/BoCauHoi" class="btn btn-outline-secondary btn-sm">Xóa bộ lọc</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>

    <jsp:include page="../components/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>