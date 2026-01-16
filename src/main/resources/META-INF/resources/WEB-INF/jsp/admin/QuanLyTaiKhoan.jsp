<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý tài khoản</title>
    <jsp:include page="../../components/head-libs.jsp"/>
</head>
<body>

<jsp:include page="../../components/sidebar.jsp"/>

<div class="content p-4">

    <h3 class="mb-4">📋 Quản lý tài khoản</h3>

    <!-- 🔍 TÌM KIẾM -->
    <form method="get" action="/Admin/QuanLyTaiKhoan" class="mb-4">
        <div class="input-group w-50">
            <input type="text" name="keyword" class="form-control"
                   placeholder="Nhập họ tên cần tìm..."
                   value="${keyword}">
            <button class="btn btn-primary">Tìm kiếm</button>
        </div>
    </form>

    <!-- ================= GIẢNG VIÊN ================= -->
    <h4 class="text-success mb-3">🧑‍🏫 Danh sách giảng viên</h4>

    <table class="table table-bordered table-hover">
        <thead class="table-success">
            <tr>
                <th>Tên đăng nhập</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>SĐT</th>
                <th>Quyền</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tk" items="${dsTeacher}">
                <tr>
                    <td>${tk.tenDangNhap}</td>
                    <td>${tk.hoTen}</td>
                    <td>${tk.email}</td>
                    <td>${tk.soDienThoai}</td>
                    <td>
                        <span class="badge bg-success">TEACHER</span>
                    </td>
                    <td>
                        <a href="/Admin/QuanLyTaiKhoan/DoiQuyen?tenDangNhap=${tk.tenDangNhap}"
                           class="btn btn-sm btn-warning"
                           onclick="return confirm('Hạ quyền giảng viên này?')">
                           Hạ quyền
                        </a>
                         <a href="/Admin/QuanLyTaiKhoan/Xoa?tenDangNhap=${tk.tenDangNhap}"
					       class="btn btn-sm btn-danger"
					       onclick="return confirm('XÓA tài khoản này?')">
					       Xóa
					    </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- ================= SINH VIÊN ================= -->
    <h4 class="text-primary mt-5 mb-3">🎓 Danh sách sinh viên</h4>

    <table class="table table-bordered table-hover">
        <thead class="table-primary">
            <tr>
                <th>Tên đăng nhập</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>SĐT</th>
                <th>Quyền</th>
                <th>Thao tác</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tk" items="${dsUser}">
                <tr>
                    <td>${tk.tenDangNhap}</td>
                    <td>${tk.hoTen}</td>
                    <td>${tk.email}</td>
                    <td>${tk.soDienThoai}</td>
                    <td>
                        <span class="badge bg-secondary">USER</span>
                    </td>
                    <td>
                        <a href="/Admin/QuanLyTaiKhoan/DoiQuyen?tenDangNhap=${tk.tenDangNhap}"
                           class="btn btn-sm btn-success"
                           onclick="return confirm('Nâng quyền sinh viên này?')">
                           Nâng quyền
                        </a>
                         <a href="/Admin/QuanLyTaiKhoan/Xoa?tenDangNhap=${tk.tenDangNhap}"
					       class="btn btn-sm btn-danger"
					       onclick="return confirm('XÓA tài khoản này?')">
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
