<%@ page contentType="text/html; charset=UTF-8" %>
<style>
	.sidebar {
	    width: 250px;
	    height: 100vh;
	    background-color: #212529;
	    position: fixed;
	}
	
	.sidebar .nav-link {
	    color: #adb5bd;
	    margin-bottom: 6px;
	    border-radius: 6px;
	}
	
	.sidebar .nav-link:hover {
	    background-color: #495057;
	    color: #fff;
	}
	.content {
	    margin-left: 250px;
	    padding: 24px;
	    min-height: 100vh;
	    background-color: #f8f9fa;
	}
</style>
<div class="sidebar">
    <h4 class="text-center py-3 border-bottom text-white">ADMIN</h4>
    <ul class="nav flex-column px-2">
        <li class="nav-item">
            <a class="nav-link" href="/Admin/TrangChu">
                Trang Chủ
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/Admin/QuanLyLoai">
                Quản Lý loại
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/Admin/QuanLyTaiKhoan">
                Quản lý tài khoản
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/Admin/QuanLyBoCauHoi">
                Quản lý bộ câu hỏi
            </a>
        </li>
        
        <li class="nav-item mt-3">
            <a class="nav-link text-danger" href="/logout">
                Đăng Xuất
            </a>
        </li>
    </ul>
</div>