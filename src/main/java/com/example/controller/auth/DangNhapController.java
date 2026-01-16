package com.example.controller.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.entity.TaiKhoan;
import com.example.service.TaiKhoanService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DangNhapController {

    @Autowired
    private TaiKhoanService taiKhoanService;

    @GetMapping("/login")
    public String loginPage() {
        return "DangNhap"; 
    }

    @PostMapping("/login")
    public String login(
            @RequestParam("tenDangNhap") String tenDangNhap,
            @RequestParam("matKhau") String matKhau,
            Model model,
            HttpSession session) {

        TaiKhoan tk = taiKhoanService.login(tenDangNhap, matKhau);
        
        if (tk == null) {
            model.addAttribute("errorMessage", "Sai tên đăng nhập hoặc mật khẩu");
            return "DangNhap"; 
        }
        String VaiTro = tk.getLoai();
        session.setAttribute("user", tk);
        session.setAttribute("userRole", tk.getLoai());
        session.setAttribute("userName", tk.getTenDangNhap());
        if ("admin".equalsIgnoreCase(VaiTro)) {
            return "redirect:/Admin/TrangChu";
        } else if ("teacher".equalsIgnoreCase(VaiTro)) {
            return "redirect:/Teacher/TrangChu";
        } else {
            return "redirect:/TrangChu";
        }

    }
}
