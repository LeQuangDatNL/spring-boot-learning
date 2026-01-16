package com.example.controller.admin;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.entity.TaiKhoan;
import com.example.service.TaiKhoanService;

@Controller
@RequestMapping("/Admin/QuanLyTaiKhoan")
public class QuanLyTaiKhoan {

    @Autowired
    private TaiKhoanService taiKhoanService;

    // ===== HIỂN THỊ + TÌM KIẾM =====
    @GetMapping
    public String index(@RequestParam(required = false) String keyword,
                        Model model) {

        List<TaiKhoan> ds = taiKhoanService.searchByHoTen(keyword);

        List<TaiKhoan> dsTeacher = ds.stream()
                .filter(tk -> "TEACHER".equals(tk.getLoai()))
                .collect(Collectors.toList());

        List<TaiKhoan> dsUser = ds.stream()
                .filter(tk -> "USER".equals(tk.getLoai()))
                .collect(Collectors.toList());

        model.addAttribute("dsTeacher", dsTeacher);
        model.addAttribute("dsUser", dsUser);
        model.addAttribute("keyword", keyword);

        return "admin/QuanLyTaiKhoan";
    }

    // ===== ĐỔI QUYỀN =====
    @GetMapping("/DoiQuyen")
    public String doiQuyen(@RequestParam String tenDangNhap) {

        TaiKhoan tk = taiKhoanService.findById(tenDangNhap);

        if (tk != null) {
            if ("TEACHER".equals(tk.getLoai())) {
                tk.setLoai("USER");
            } else if ("USER".equals(tk.getLoai())) {
                tk.setLoai("TEACHER");
            }
            taiKhoanService.save(tk);
        }

        return "redirect:/Admin/QuanLyTaiKhoan";
    }

    // ===== XÓA =====
    @GetMapping("/Xoa")
    public String xoa(@RequestParam String tenDangNhap) {
        taiKhoanService.delete(tenDangNhap);
        return "redirect:/Admin/QuanLyTaiKhoan";
    }
}
