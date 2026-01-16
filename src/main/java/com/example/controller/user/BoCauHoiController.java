package com.example.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; // Chuyển sang @Controller để trả về View
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.service.ChiTietBoCauHoiService;
import com.example.service.LoaiService;
import com.example.service.TaiKhoanService;
import com.example.entity.ChiTietBoCauHoi;
import java.util.List;

@Controller
public class BoCauHoiController {

    @Autowired
    private ChiTietBoCauHoiService chiTietService;
    @Autowired
    private LoaiService loaiService;
    @Autowired
    private TaiKhoanService taiKhoanService;
    @GetMapping("/BoCauHoi")
    public String DanhSachBoCauHoiTimKiem(
            @RequestParam(required = false) String key,
            @RequestParam(required = false) String MaLoai,
            @RequestParam(required = false) String tenGv,
            Model model) {
        
        List<ChiTietBoCauHoi> ds = chiTietService.getAllOrSearch(key, MaLoai, tenGv);
        
        model.addAttribute("listGV", taiKhoanService.getAllTenGV());
        model.addAttribute("dsBoCauHoi", ds);
        model.addAttribute("listLoai", loaiService.getAllLoai());
        return "DanhSachBoCauHoi"; 
    }
}