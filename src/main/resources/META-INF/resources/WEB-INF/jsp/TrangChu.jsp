<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="../components/head-libs.jsp" />
    <style>
        .hero-section {
            background: linear-gradient(135deg, #0066ff 0%, #00d2ff 100%);
            color: white;
            padding: 60px 0;
            border-radius: 0 0 50px 50px;
        }
        .exam-card {
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }
        .exam-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        .badge-level {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgba(255, 255, 255, 0.9);
            color: #0066ff;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <jsp:include page="../components/header.jsp" />

    <section class="hero-section text-center mb-5">
        <div class="container">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <h1 class="fw-bold">Chào mừng trở lại, ${sessionScope.user.hoTen}!</h1>
                    <p class="lead">Hôm nay là một ngày tuyệt vời để nâng cao trình độ Tiếng Anh.</p>
                </c:when>
                <c:otherwise>
                    <h1 class="fw-bold">Chinh phục Tiếng Anh cùng ANH NGỮ PRO</h1>
                    <p class="lead">Hàng ngàn bài trắc nghiệm IELTS, TOEIC đang chờ đón bạn.</p>
                    <a href="login.jsp" class="btn btn-light btn-lg fw-bold rounded-pill px-5 mt-3 text-primary">Bắt đầu ngay</a>
                </c:otherwise>
            </c:choose>
        </div>
    </section>

    <div class="container my-5">
	    <div class="d-flex justify-content-between align-items-end mb-4">
        	<h3 class="fw-bold mb-0">Bộ câu hỏi dành cho bạn</h3>
        
	        <div class="pt-3 mt-3">
				<a href="/BoCauHoi"
				   class="btn btn-primary w-100 fw-bold rounded-pill py-2">
					Xem Thêm
					<i class="fa-solid fa-arrow-right ms-2"></i>
				</a>
			</div>
	    </div>
	    <div class="row g-4">
	        <c:forEach var="ch" items="${dsBoCauHoi}">
	            <div class="col-md-4">
	                <c:set var="item" value="${ch}" scope="request" />
	                <jsp:include page="../components/test-card.jsp" />
	            </div>
	        </c:forEach>
	    </div>
	</div>
    <jsp:include page="../components/footer.jsp" />

</body>
</html>