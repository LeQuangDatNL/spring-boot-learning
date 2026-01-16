<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../components/head-libs.jsp" />
</head>
<body>
	<jsp:include page="../../components/gv-sidebar.jsp" />
	<div class="content">

		<!-- Header -->
		<div class="mb-4">
			<h3 class="fw-bold">📋 Trang chủ quản trị hệ thống trắc nghiệm</h3>
			<p class="text-muted">Tổng quan hệ thống ra đề & quản lý câu hỏi
			</p>
		</div>

		<div class="row g-4 mb-4">

			<div class="col-md-3">
				<div class="card stat-card shadow-sm">
					<div class="card-body text-center">
						<div class="text-muted">Loại câu hỏi</div>
						<div class="stat-number text-primary" th:text="${soLoaiCauHoi}">${soLoaiCauHoi}</div>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card stat-card shadow-sm">
					<div class="card-body text-center">
						<div class="text-muted">Bộ câu hỏi</div>
						<div class="stat-number text-success" th:text="${soBoCauHoi}">${soBoCauHoi}</div>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card stat-card shadow-sm">
					<div class="card-body text-center">
						<div class="text-muted">Giảng viên</div>
						<div class="stat-number text-warning" th:text="${soGiangVien}">${soGiangVien}</div>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card stat-card shadow-sm">
					<div class="card-body text-center">
						<div class="text-muted">Sinh viên</div>
						<div class="stat-number text-danger" th:text="${soSinhVien}">${soSinhVien}</div>
					</div>
				</div>
			</div>

		</div>
		<!-- Nội dung chính -->
		<div class="row g-4">
			<!-- Hướng dẫn nhanh -->
			<div class="col-md-7">
				<div class="card shadow-sm border-0">
					<div class="card-header fw-bold">🚀 Chức năng chính</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">📝 Tạo, chỉnh sửa và quản lý bộ câu hỏi trắc nghiệm</li>
							<li class="list-group-item">📂 Quản lý loại câu hỏi và mức độ</li>
							<li class="list-group-item">📄 Tạo và quản lý đề thi trắc nghiệm</li>
							<li class="list-group-item">📊 Theo dõi kết quả làm bài và thống kê điểm số</li>
							<li class="list-group-item">👨‍🎓 Xem danh sách sinh viên tham gia và trạng thái làm bài</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- Thông tin hệ thống -->
			<div class="col-md-5">
				<div class="card shadow-sm border-0">
					<div class="card-header fw-bold">⚙️ Thông tin hệ thống</div>
					<div class="card-body">
						<p>
							👤 Quyền truy cập: <b>Teacher</b>
						</p>
						<p>
							🟢 Trạng thái: <span class="text-success">Hoạt động</span>
						</p>
						<p>
							📅 Ngày:
							<%= new java.util.Date() %></p>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>