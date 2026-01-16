<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Bộ Câu Hỏi Mới</title>
    <jsp:include page="../../components/head-libs.jsp" />
    <style>
        .content { margin-left: 260px; padding: 30px; transition: 0.3s; }
        .card { border-radius: 15px; overflow: hidden; }
        .form-label { font-weight: 600; color: #444; }
    </style>
</head>
<body>
<jsp:include page="../../components/gv-sidebar.jsp" />

<div class="content">
    <div class="container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Teacher/QuanLyBoCauHoiCaNhan">Danh sách</a></li>
                <li class="breadcrumb-item active">Thêm mới</li>
            </ol>
        </nav>

        <div class="card shadow-sm border-0">
            <div class="card-header bg-primary text-white py-3">
                <h5 class="mb-0"><i class="bi bi-plus-square-dotted me-2"></i>Tạo Bộ Câu Hỏi Mới</h5>
            </div>
            <div class="card-body p-4">
                <form action="${pageContext.request.contextPath}/Teacher/LuuBoCauHoi" method="post" enctype="multipart/form-data">
                    
                    <div class="row">
                        <div class="col-md-8">
                            <div class="mb-3">
                                <label class="form-label">Tên bộ câu hỏi</label>
                                <input type="text" name="ten" class="form-control" placeholder="Ví dụ: Đề thi giữa kỳ môn Java" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mô tả</label>
                                <textarea name="moTa" class="form-control" rows="5" placeholder="Nhập mô tả ngắn gọn về nội dung..."></textarea>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="mb-3">
                                <label class="form-label">Ảnh minh họa</label>
                                <div class="border rounded p-3 text-center bg-light mb-2">
                                    <i class="bi bi-image text-muted" style="font-size: 3rem;"></i>
                                    <p class="small text-muted mb-0">Xem trước ảnh sẽ hiển thị tại đây</p>
                                </div>
                                <input type="file" name="fileAnh" class="form-control" accept="image/*" required>
                                <div class="form-text">Lưu ý: Ảnh sẽ được lưu vào thư mục /test</div>
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <div class="d-flex justify-content-end gap-2">
                        <a href="${pageContext.request.contextPath}/Teacher/QuanLyBoCauHoiCaNhan" class="btn btn-light border">Hủy bỏ</a>
                        <button type="submit" class="btn btn-primary px-4">
                            <i class="bi bi-save me-1"></i> Lưu bộ câu hỏi
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Script đơn giản để xem trước ảnh (tùy chọn)
    document.querySelector('input[name="fileAnh"]').onchange = evt => {
        const [file] = evt.target.files
        if (file) {  
            const preview = document.querySelector('.bi-image');
            if(preview) preview.parentElement.innerHTML = `<img src="${URL.createObjectURL(file)}" style="max-width:100%; max-height:150px;">`;
        }
    }
</script>
</body>
</html>