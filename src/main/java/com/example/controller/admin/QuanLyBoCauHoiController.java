package com.example.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.service.BoCauHoiService;
import com.example.service.ChiTietBoCauHoiService;

@Controller
@RequestMapping("/Admin/QuanLyBoCauHoi")
public class QuanLyBoCauHoiController {

    @Autowired
    private BoCauHoiService boCauHoiService;
    @Autowired
    private ChiTietBoCauHoiService chiTietBoCauHoiService;
    
    @GetMapping
    public String index(Model model) {
        model.addAttribute("dsChiTietBoCauHoi", chiTietBoCauHoiService.getAll());
        return "admin/QuanLyBoCauHoi";
    }

    @GetMapping("/Xoa/{id}")
    public String xoa(@PathVariable Integer id) {
        boCauHoiService.delete(id);
        return "redirect:/Admin/QuanLyBoCauHoi";
    }
}