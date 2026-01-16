<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../components/head-libs.jsp" />
</head>
<body>
	<div>
		<jsp:include page="../../components/gv-sidebar.jsp" />
		<div class="content card shadow">
			<div
				class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
				<h5 class="mb-0">Danh sách câu hỏi của Mã đề: ${moDe.maMoDe}</h5>
				<button class="btn btn-light btn-sm" data-bs-toggle="modal"
					data-bs-target="#modalCauHoi" onclick="clearCauHoiForm()">
					<i class="fas fa-plus"></i> Thêm câu hỏi mới
				</button>
				<button class="btn btn-outline-secondary btn-sm"
					onclick="history.back()">
					<i class="fas fa-arrow-left me-1"></i> Quay lại
				</button>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead class="table-light">
							<tr class="text-center">
								<th>STT</th>
								<th>Nội dung câu hỏi</th>
								<th>Đáp án A</th>
								<th>Đáp án B</th>
								<th>Đáp án C</th>
								<th>Đáp án D</th>
								<th>Đáp án Đúng</th>
								<th>Thao tác</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="ch" items="${dsCauHoi}">
								<tr>
									<td class="text-center fw-bold">${ch.thuTu}</td>
									<td>
										<div class="text-wrap" style="min-width: 200px;">
											${ch.noiDung}
											<c:if test="${not empty ch.giaiThich}">
												<br>
												<small class="text-muted"><i>Giải thích:
														${ch.giaiThich}</i></small>
											</c:if>
										</div>
									</td>
									<td>${ch.dapAnA}</td>
									<td>${ch.dapAnB}</td>
									<td>${ch.dapAnC}</td>
									<td>${ch.dapAnD}</td>
									<td class="text-center"><span class="badge bg-success">${ch.dapAnDung}</span>
									</td>
									<td class="text-center">
										<div class="btn-group">
											<button class="btn btn-sm btn-outline-warning"
												data-bs-toggle="modal" data-bs-target="#modalCauHoi"
												data-id="${ch.maCauHoi}" data-noidung="${ch.noiDung}"
												data-thutu="${ch.thuTu}" data-a="${ch.dapAnA}"
												data-b="${ch.dapAnB}" data-c="${ch.dapAnC}"
												data-d="${ch.dapAnD}" data-dung="${ch.dapAnDung}"
												data-giaithich="${ch.giaiThich}"
												onclick="fillCauHoiForm(this)">
												<i class="fas fa-edit"></i>
											</button>

											<a
												href="${pageContext.request.contextPath}/Teacher/CauHoi/Delete/${ch.maCauHoi}"
												class="btn btn-sm btn-outline-danger"
												onclick="return confirm('Xóa câu hỏi này?')"> <i
												class="fas fa-trash"></i>
											</a>
										</div>
									</td>
								</tr>
							</c:forEach>
							<c:if test="${empty dsCauHoi}">
								<tr>
									<td colspan="8" class="text-center text-muted">Chưa có câu
										hỏi nào cho mã đề này.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="modal fade" id="modalCauHoi" tabindex="-1"
			aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<form
					action="${pageContext.request.contextPath}/Teacher/CauHoi/SaveOrUpdate"
					method="post" class="modal-content shadow-lg">
					<div class="modal-header bg-primary text-white">
						<h5 class="modal-title" id="modalCauHoiTitle">Cấu hình câu
							hỏi chi tiết</h5>
						<button type="button" class="btn-close btn-close-white"
							data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body p-4">
						<input type="hidden" name="maCauHoi" id="ch_maCauHoi"> <input
							type="hidden" name="maMoDe" value="${moDe.maMoDe}"> <input
							type="hidden" name="maBoCauHoi" value="${moDe.maBoCauHoi}">

						<div class="row mb-4">
							<div class="col-md-10">
								<label class="form-label fw-bold text-primary"><i
									class="fas fa-question-circle"></i> Nội dung câu hỏi (Có thể
									nhập đoạn văn dài):</label>
								<textarea name="noiDung" id="ch_noiDung" class="form-control"
									rows="6" required
									placeholder="Nhập nội dung câu hỏi tại đây..."></textarea>
							</div>
							<div class="col-md-2">
								<label class="form-label fw-bold"><i
									class="fas fa-sort-numeric-down"></i> Thứ tự:</label> <input
									type="number" name="thuTu" id="ch_thuTu" class="form-control"
									required>
							</div>
						</div>

						<hr>

						<div class="row mb-3">
							<div class="col-md-6 mb-3">
								<div class="input-group">
									<span class="input-group-text bg-success text-white fw-bold">A</span>
									<textarea name="dapAnA" id="ch_A" class="form-control" rows="2"
										required placeholder="Nội dung đáp án A..."></textarea>
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<div class="input-group">
									<span class="input-group-text bg-success text-white fw-bold">B</span>
									<textarea name="dapAnB" id="ch_B" class="form-control" rows="2"
										required placeholder="Nội dung đáp án B..."></textarea>
								</div>
							</div>

							<div class="col-md-6 mb-3">
								<div class="input-group">
									<span class="input-group-text bg-success text-white fw-bold">C</span>
									<textarea name="dapAnC" id="ch_C" class="form-control" rows="2"
										required placeholder="Nội dung đáp án C..."></textarea>
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<div class="input-group">
									<span class="input-group-text bg-success text-white fw-bold">D</span>
									<textarea name="dapAnD" id="ch_D" class="form-control" rows="2"
										required placeholder="Nội dung đáp án D..."></textarea>
								</div>
							</div>
						</div>

						<div class="row mb-4">
							<div class="col-md-4">
								<label class="form-label fw-bold text-danger"><i
									class="fas fa-check-double"></i> Đáp án đúng:</label> <select
									name="dapAnDung" id="ch_Dung"
									class="form-select border-danger fw-bold">
									<option value="A">ĐÁP ÁN A</option>
									<option value="B">ĐÁP ÁN B</option>
									<option value="C">ĐÁP ÁN C</option>
									<option value="D">ĐÁP ÁN D</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-12">
								<label class="form-label fw-bold text-info"><i
									class="fas fa-lightbulb"></i> Giải thích chi tiết:</label>
								<textarea name="giaiThich" id="ch_giaiThich"
									class="form-control" rows="5"
									placeholder="Nhập hướng dẫn giải hoặc dịch nghĩa..."></textarea>
							</div>
						</div>
					</div>

					<div class="modal-footer bg-light">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Đóng</button>
						<button type="submit" class="btn btn-primary px-5 fw-bold">LƯU
							CÂU HỎI</button>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
<script>
function fillCauHoiForm(btn) {
    // 1. Lấy dữ liệu từ thuộc tính data-* của nút được nhấn
    const id = btn.getAttribute('data-id');
    const noiDung = btn.getAttribute('data-noidung');
    const thuTu = btn.getAttribute('data-thutu');
    const a = btn.getAttribute('data-a');
    const b = btn.getAttribute('data-b');
    const c = btn.getAttribute('data-c');
    const d = btn.getAttribute('data-d');
    const dung = btn.getAttribute('data-dung');
    const giaiThich = btn.getAttribute('data-giaithich');

    // 2. Điền vào Form Modal (Đảm bảo ID các ô input trong Modal khớp với ở dưới)
    document.getElementById('ch_maCauHoi').value = id;
    document.getElementById('ch_noiDung').value = noiDung;
    document.getElementById('ch_thuTu').value = thuTu;
    document.getElementById('ch_A').value = a;
    document.getElementById('ch_B').value = b;
    document.getElementById('ch_C').value = c;
    document.getElementById('ch_D').value = d;
    document.getElementById('ch_Dung').value = dung;
    document.getElementById('ch_giaiThich').value = giaiThich;

    document.getElementById('modalCauHoiTitle').innerText = "Chỉnh sửa câu hỏi #" + id;
}

function clearCauHoiForm() {
    document.getElementById('ch_maCauHoi').value = "";
    document.getElementById('ch_noiDung').value = "";
    document.getElementById('ch_A').value = "";
    document.getElementById('ch_B').value = "";
    document.getElementById('ch_C').value = "";
    document.getElementById('ch_D').value = "";
    document.getElementById('ch_giaiThich').value = "";
    document.getElementById('modalCauHoiTitle').innerText = "Thêm câu hỏi mới";
}
</script>
</html>