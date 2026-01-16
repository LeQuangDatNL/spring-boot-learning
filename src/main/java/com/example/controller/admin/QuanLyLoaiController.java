package com.example.controller.admin;

import com.example.entity.Loai;
import com.example.service.LoaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/Admin/QuanLyLoai")
public class QuanLyLoaiController {

    @Autowired
    private LoaiService loaiService;

    @GetMapping
    public String index(Model model) {
        model.addAttribute("dsLoai", loaiService.getAllLoai());
        model.addAttribute("loai", new Loai());
        return "admin/QuanLyLoai";
    }

    @PostMapping("/Them")
    public String themLoai(@RequestParam String tenLoai) {

        Loai loai = new Loai();
        loai.setTenLoai(tenLoai);

        loaiService.createLoai(loai);
        return "redirect:/Admin/QuanLyLoai";
    }

    @GetMapping("/Sua/{id}")
    public String suaLoai(@PathVariable Integer id, Model model) {
        Loai loai = loaiService.getLoaiById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy loại"));

        model.addAttribute("loai", loai);
        model.addAttribute("dsLoai", loaiService.getAllLoai());
        return "admin/QuanLyLoai";
    }

    @PostMapping("/CapNhat")
    public String capNhatLoai(@RequestParam int maLoai,@RequestParam String tenLoai) {

        Loai loai = new Loai();
        loai.setTenLoai(tenLoai);
        loai.setMaLoai(maLoai);
        loaiService.updateLoai(loai);
        return "redirect:/Admin/QuanLyLoai";
    }

    @GetMapping("/Xoa/{id}")
    public String xoaLoai(@PathVariable Integer id) {
        loaiService.deleteLoai(id);
        return "redirect:/Admin/QuanLyLoai";
    }
}
