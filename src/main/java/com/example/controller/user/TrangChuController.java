package com.example.controller.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.entity.ChiTietBoCauHoi;
import com.example.service.ChiTietBoCauHoiService;

@Controller
public class TrangChuController {
	
    @Autowired
    private ChiTietBoCauHoiService chiTietService;

    @GetMapping("/")
    public String khoiDau() {
        return "redirect:/TrangChu"; // Chuyển hướng về trang chủ để lấy dữ liệu
    }

    @GetMapping("/TrangChu")
    public String trangChu (Model model){
    	List<ChiTietBoCauHoi> ds = chiTietService.findTop3By();
    	model.addAttribute("dsBoCauHoi", ds);
        return "TrangChu"; 
    }
}