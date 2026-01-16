package com.example.controller.auth;

import com.example.entity.TaiKhoan;
import com.example.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DangKyController {

	@Autowired
	private TaiKhoanService nguoiDungSer;

	@GetMapping("/DangKy")
	public String showRegisterForm(Model model) {
		// Đảm bảo "user" khớp với modelAttribute trong form JSP
		model.addAttribute("user", new TaiKhoan());
		return "DangKy";
	}

	@PostMapping("/DangKy")
	public String handleRegister(@ModelAttribute("user") TaiKhoan user,
			@RequestParam("confirmPassword") String confirmPassword, @RequestParam("hoTen") String hoTen,
			@RequestParam("email") String email, @RequestParam("soDienThoai") String soDienThoai, Model model) {


		if (nguoiDungSer.findByTenDangNhap(user.getTenDangNhap()) != null) {
			model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
			return "DangKy";
		}


		if (!user.getMatKhau().equals(confirmPassword)) {
			model.addAttribute("error", "Mật khẩu xác nhận không khớp!");
			return "DangKy";
		}

		try {
			user.setHoTen(hoTen);
			user.setEmail(email);
			user.setSoDienThoai(soDienThoai);
			user.setLoai("USER"); 

			nguoiDungSer.save(user);

			return "redirect:/login?success=true";
		} catch (Exception e) {
			model.addAttribute("error", "Lỗi: " + e.getMessage());
			return "DangKy";
		}
	}
}