package com.example.controller.teacher;

import com.example.entity.BoCauHoi;
import com.example.entity.TaiKhoan;
import com.example.repository.BoCauHoi_GVRepository;
import com.example.service.BoCauHoiService;
import com.example.service.BoCauHoi_GVService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/Teacher")
public class QuanLyBoCauHoiCaNhan {

    private final BoCauHoi_GVRepository boCauHoi_GVRepository;
    
    @Autowired
    private BoCauHoiService boCauHoiService;
    @Autowired
    private BoCauHoi_GVService boCauHoi_GVService;

    QuanLyBoCauHoiCaNhan(BoCauHoi_GVRepository boCauHoi_GVRepository) {
        this.boCauHoi_GVRepository = boCauHoi_GVRepository;
    }
    
    @GetMapping("/QuanLyBoCauHoiCaNhan")
    public String index(HttpSession session, Model model) {
        TaiKhoan tk = (TaiKhoan) session.getAttribute("user");
        if (tk == null) return "redirect:/login";

        List<BoCauHoi> danhSachBoCauHoi = boCauHoiService.getBoCauHoiByTenDangNhap(tk.getTenDangNhap());
        model.addAttribute("danhSachBoCauHoi", danhSachBoCauHoi);

        return "teacher/QuanLyBoCauHoi";
    }
    @PostMapping("/LuuBoCauHoi")
    public String luuMoiBoCauHoi(
            @ModelAttribute("boCauHoi") BoCauHoi boCauHoi,
            @RequestParam("fileAnh") MultipartFile file,
            HttpSession session) {
        
        TaiKhoan tk = (TaiKhoan) session.getAttribute("user");
        if (tk == null) return "redirect:/login";
        BoCauHoi bchMoi = boCauHoiService.create(boCauHoi, file);
        if (bchMoi != null && bchMoi.getMaBoCauHoi() != null) {
        	boCauHoi_GVService.saveRelation(
                tk.getTenDangNhap(), 
                bchMoi.getMaBoCauHoi(), 
                "CREATOR"
            );
        }
        
        return "redirect:/Teacher/QuanLyBoCauHoiCaNhan";
    }
    @GetMapping("/XoaBoCauHoi/{id}")
    public String xoaBoCauHoi(@PathVariable("id") Integer id) {
        boCauHoiService.delete(id); 
        return "redirect:/Teacher/QuanLyBoCauHoiCaNhan";
    }

    @GetMapping("/SuaBoCauHoi/{id}")
    public String hienThiTrangSua(@PathVariable("id") Integer id, Model model) {
        BoCauHoi bch = boCauHoiService.getById(id); 
        if (bch == null) return "redirect:/Teacher/QuanLyBoCauHoiCaNhan";
        
        model.addAttribute("boCauHoi", bch);
        return "teacher/SuaBoCauHoi";
    }

    @PostMapping("/CapNhatBoCauHoi")
    public String capNhatBoCauHoi(
            @ModelAttribute("boCauHoi") BoCauHoi boCauHoi,
            @RequestParam("fileAnh") MultipartFile file) {
        
        boCauHoiService.updateWithFile(boCauHoi.getMaBoCauHoi(), boCauHoi, file);
        
        return "redirect:/Teacher/QuanLyBoCauHoiCaNhan";
    }
    @GetMapping("/ThemBoCauHoi")
    public String hienThiTrangThem(Model model) {
        model.addAttribute("boCauHoi", new BoCauHoi());
        return "teacher/ThemBoCauHoi";
    }


}