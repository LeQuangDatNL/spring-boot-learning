<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi Tiết - ${boCauHoi.ten}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<jsp:include page="../../components/gv-sidebar.jsp" />
	<div class="content p-4">
		<button class="btn btn-outline-secondary btn-sm m-3"
			onclick="history.back()">
			<i class="fas fa-arrow-left me-1"></i> Quay lại
		</button>
		<div class="card mb-4 shadow-sm border-0">
			<div class="row g-0">
				<div class="col-md-3">
					<img src="${boCauHoi.anh}" class="img-fluid rounded-start h-100"
						style="object-fit: cover;">
				</div>
				<div class="col-md-9">
					<div class="card-body">
						<h2 class="card-title text-primary">${boCauHoi.ten}</h2>
						<p class="card-text text-muted">${boCauHoi.moTa}</p>
						<hr>
						<h6>Loại câu hỏi:</h6>
						<div class="d-flex flex-wrap gap-2">
							<c:forEach var="loai" items="${dsLoaiTrongBo}">
								<span class="badge bg-info text-dark p-2">
									${loai.tenLoai} <a
									href="${pageContext.request.contextPath}/Teacher/ChiTietBoCauHoi/XoaLoai?maLoai=${loai.maLoai}&maBch=${boCauHoi.maBoCauHoi}"
									class="text-danger ms-1"
									onclick="return confirm('Gỡ loại này?')"><i
										class="fas fa-times"></i></a>
								</span>
							</c:forEach>
							<button class="btn btn-sm btn-outline-success rounded-pill"
								data-bs-toggle="modal" data-bs-target="#modalLoai">+</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="card shadow-sm border-0">
			<div
				class="card-header bg-white d-flex justify-content-between align-items-center">
				<h5 class="mb-0">Giảng viên cộng tác</h5>
				<button class="btn btn-primary btn-sm" data-bs-toggle="modal"
					data-bs-target="#modalGV">Thêm GV</button>
			</div>
			<div class="card-body p-0">
				<table class="table table-hover mb-0">
					<thead class="table-light">
						<tr>
							<th>Họ tên</th>
							<th>Tên đăng nhập</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="gv" items="${dsGiangVien}">
							<tr>
								<td>${gv.hoTen}</td>
								<td><code>${gv.tenDangNhap}</code></td>
								<td><a
									href="${pageContext.request.contextPath}/Teacher/ChiTietBoCauHoi/XoaGiangVien?tenDangNhap=${gv.tenDangNhap}&maBch=${boCauHoi.maBoCauHoi}"
									class="text-danger"
									onclick="return confirm('Xóa quyền giảng viên này?')"><i
										class="fas fa-trash"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card shadow-sm border-0 mt-4">
			<div
				class="card-header bg-white d-flex justify-content-between align-items-center">
				<h5 class="mb-0">Quản lý nội dung Mở đề (Text/Audio)</h5>
				<button class="btn btn-dark btn-sm" data-bs-toggle="modal"
					data-bs-target="#modalMoDe" onclick='clearMoDeForm()'>Thêm
					Mở Đề</button>
			</div>
			<div class="card-body p-0">
				<table class="table table-hover mb-0">
					<thead class="table-light">
						<tr>
							<th style="width: 80px;">Thứ tự</th>
							<th>Nội dung văn bản (Nối với câu hỏi)</th>
							<th>File đính kèm</th>
							<th style="width: 100px;">Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="md" items="${dsMoDe}">
							<tr>
								<td class="text-center fw-bold">${md.thuTu}</td>
								<td>${md.noiDungText}</td>
								<td><c:if test="${not empty md.nguonFile}">
										<audio controls style="height: 30px; width: 200px;">
											<source
												src="${pageContext.request.contextPath}/mp3/${md.nguonFile}"
												type="audio/mpeg">
											<p>Trình duyệt của bạn không hỗ trợ nghe nhạc.</p>
										</audio>
									</c:if> <c:if test="${empty md.nguonFile}">
										<span class="text-muted">Không có âm thanh</span>
									</c:if></td>
								<td><a
									href="${pageContext.request.contextPath}/Teacher/CauHoi/ChiTietMaDe/${md.maMoDe}"
									class="text-info me-2" title="Xem chi tiết"> <i
										class="fas fa-eye"></i>
								</a> <a href="#" class="text-warning me-2" data-bs-toggle="modal"
									data-bs-target="#modalMoDe" data-id="${md.maMoDe}"
									data-noidung="${md.noiDungText}" data-thutu="${md.thuTu}"
									onclick="fillMoDeForm(this)"> <i class="fas fa-edit"></i>
								</a> <a
									href="${pageContext.request.contextPath}/Teacher/MoDe/Delete/${md.maMoDe}"
									class="text-danger" onclick="return confirm('Xóa mở đề này?')">
										<i class="fas fa-trash"></i>
								</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty dsMoDe}">
							<tr>
								<td colspan="4" class="text-center py-3 text-muted">Chưa có
									nội dung mở đề nào.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="modalMoDe" tabindex="-1">
		<div class="modal-dialog">
			<form
				action="${pageContext.request.contextPath}/Teacher/MoDe/SaveOrUpdate"
				method="post" enctype="multipart/form-data" class="modal-content">

				<div class="modal-header">
					<h5 id="modalTitle">Thêm/Sửa nội dung mở đề</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">

					<input type="hidden" name="maMoDe" id="maMoDe"> <input
						type="hidden" name="maBoCauHoi" value="${boCauHoi.maBoCauHoi}">

					<div class="mb-3">
						<label class="form-label fw-bold">Nội dung văn bản</label>
						<textarea name="noiDungText" id="noiDungText" class="form-control"
							rows="3"></textarea>
					</div>

					<div class="mb-3">
						<label class="form-label fw-bold">File MP3</label> <input
							type="file" name="fileMp3" class="form-control"> <small
							class="text-muted">Bỏ trống nếu không đổi file</small>
					</div>

					<div class="mb-3">
						<label class="form-label fw-bold">Thứ tự</label> <input
							type="number" name="thuTu" id="thuTu" class="form-control"
							required>
					</div>

				</div>

				<div class="modal-footer">
					<button type="submit" class="btn btn-dark">Lưu</button>
				</div>

			</form>
		</div>
	</div>

	<div class="modal fade" id="modalLoai" tabindex="-1">
		<div class="modal-dialog">
			<form
				action="${pageContext.request.contextPath}/Teacher/ChiTietBoCauHoi/ThemLoai"
				method="post" class="modal-content">
				<div class="modal-header">
					<h5>Chọn loại câu hỏi</h5>
				</div>
				<div class="modal-body">
					<input type="hidden" name="maBch" value="${boCauHoi.maBoCauHoi}">
					<select name="maLoai" class="form-select">
						<c:forEach var="l" items="${allLoaiHeThong}">
							<option value="${l.maLoai}">${l.tenLoai}</option>
						</c:forEach>
					</select>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success">Lưu</button>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="modalGV" tabindex="-1">
		<div class="modal-dialog">
			<form
				action="${pageContext.request.contextPath}/Teacher/ChiTietBoCauHoi/ThemGiangVien"
				method="post" class="modal-content">
				<div class="modal-header">
					<h5>Thêm giảng viên</h5>
				</div>
				<div class="modal-body">
					<input type="hidden" name="maBch" value="${boCauHoi.maBoCauHoi}">

					<div class="mb-3">
						<label class="form-label fw-bold">Chọn giảng viên cộng
							tác:</label> <select name="tenDangNhap" class="form-select" required>
							<option value="">-- Chọn giảng viên --</option>
							<c:forEach var="gv" items="${tatCaGiangVien}">
								<option value="${gv.tenDangNhap}">${gv.hoTen}
									(${gv.tenDangNhap})</option>
							</c:forEach>
						</select> <small class="text-muted">Lưu ý: Giảng viên sẽ được thêm
							với quyền Cộng tác viên.</small>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Thêm</button>
				</div>
			</form>
		</div>
	</div>
	<script>
function clearMoDeForm() {
    document.getElementById('maMoDe').value = ""; 
    document.getElementById('noiDungText').value = "";
    document.getElementById('thuTu').value = "";
    document.getElementById('modalTitle').innerText = "Thêm nội dung mở đề mới";
}
function fillMoDeForm(element) {
    const id = element.getAttribute('data-id');
    const noiDung = element.getAttribute('data-noidung');
    const thuTu = element.getAttribute('data-thutu');
    document.getElementById('maMoDe').value = id;
    document.getElementById('noiDungText').value = noiDung;
    document.getElementById('thuTu').value = thuTu;
    document.getElementById('modalTitle').innerText = "Cập nhật nội dung mở đề (ID: " + id + ")";
}
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>