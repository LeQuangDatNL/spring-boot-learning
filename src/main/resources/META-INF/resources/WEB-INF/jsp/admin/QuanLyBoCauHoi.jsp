<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý bộ câu hỏi</title>
    <jsp:include page="../../components/head-libs.jsp"/>
</head>
<body>

<jsp:include page="../../components/sidebar.jsp"/>

<div class="content p-4">

    <h3 class="mb-4">📚 Quản lý bộ câu hỏi</h3>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Mã</th>
                <th>Tên khóa</th>
                <th>Ảnh</th>
                <th>Mô tả</th>
                <th>Loại</th>
                <th>Người tạo</th>
                <th>Những người tham gia</th>
                <th width="120">Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bch" items="${dsChiTietBoCauHoi}">
                <tr>
                    <td>${bch.maBoCauHoi}</td>
                    <td>${bch.tenKhoa}</td>
                    <td>
                        <img src="${bch.anh}" width="80">
                    </td>
                    <td>${bch.moTa}</td>
                    <td>${bch.danhSachLoai}</td>
                    <td>${bch.nguoiTao}</td>
                    <td>${bch.danhSachPar}</td>
                    <td>
                        <a href="/Admin/QuanLyBoCauHoi/Xoa/${bch.maBoCauHoi}"
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Xóa bộ câu hỏi này?')">
                           Xóa
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>
