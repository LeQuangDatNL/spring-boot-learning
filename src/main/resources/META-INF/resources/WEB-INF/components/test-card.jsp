<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.edu-card {
	height: 100%;
	min-height: 420px;
	border-radius: 16px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	transition: all 0.3s ease;
}

.edu-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 12px 24px rgba(0, 0, 0, 0.12);
}

.test-img-wrapper {
	position: relative;
	height: 180px;
	flex-shrink: 0;
	overflow: hidden;
}

.test-img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.4s ease;
}

.edu-card:hover .test-img {
	transform: scale(1.08);
}

.badge-code {
	position: absolute;
	bottom: 10px;
	left: 10px;
	background: rgba(13, 110, 253, 0.9);
	color: #fff;
	padding: 4px 12px;
	border-radius: 20px;
	font-size: 0.75rem;
	font-weight: 600;
}

.card-body {
	flex: 1;
	display: flex;
	flex-direction: column;
}

.info-line {
	font-size: 0.9rem;
	margin-bottom: 6px;
}

.info-label {
	font-weight: 600;
	color: #555;
}

.text-truncate-3 {
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	overflow: hidden;
}
</style>

<div class="card edu-card h-100">
	<div class="test-img-wrapper">
		<img src="${item.anh}" class="test-img" alt="${item.tenKhoa}">
	</div>

	<div class="card-body p-4">
		<h5 class="fw-bold text-dark mb-2">
			${item.tenKhoa}
		</h5>

		<div class="flex-grow-1">
			<div class="info-line text-primary fw-semibold">
				<span class="info-label">Thể Loại: </span>${item.danhSachLoai}
			</div>

			<div class="info-line text-muted text-truncate-3">
				<span class="info-label">Mô tả:</span> ${item.moTa}
			</div>

			<div class="info-line">
				<span class="info-label">Người tạo:</span> ${item.nguoiTao}
			</div>

			<div class="info-line">
				<span class="info-label">Người tham gia:</span> ${item.danhSachPar}
			</div>
		</div>

		<div class="pt-3 mt-3 border-top">
			<a href="User/ChiTietBoCauHoi/${item.maBoCauHoi}"
			   class="btn btn-primary w-100 fw-bold rounded-pill py-2">
				Học ngay
				<i class="fa-solid fa-arrow-right ms-2"></i>
			</a>
		</div>
	</div>
</div>
