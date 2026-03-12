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

}
