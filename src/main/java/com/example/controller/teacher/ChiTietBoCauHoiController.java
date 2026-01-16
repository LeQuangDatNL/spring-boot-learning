package com.example.controller.teacher;

import com.example.entity.BoCauHoi;
import com.example.entity.Loai;
import com.example.entity.TaiKhoan;
import com.example.service.BoCauHoiService;
import com.example.service.BoCauHoi_GVService;
import com.example.service.BoCauHoi_LoaiService;
import com.example.service.TaiKhoanService;
import com.example.service.LoaiService;
import com.example.service.MoDeService;
import com.example.repository.BoCauHoi_LoaiRepository; // Giả sử bạn có Repo này cho bảng trung gian N-N của Loại
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/Teacher/ChiTietBoCauHoi")
public class ChiTietBoCauHoiController {

    @Autowired private BoCauHoiService boCauHoiService;
    @Autowired private BoCauHoi_GVService boCauHoiGvService;
    @Autowired private TaiKhoanService taiKhoanService;
    @Autowired private LoaiService loaiService;
    @Autowired private BoCauHoi_LoaiService boCauHoiLoaiService; 
    @Autowired private MoDeService moDeService;
    @GetMapping("/{id}")
    public String viewDetail(@PathVariable("id") Integer id, Model model) {
        BoCauHoi bch = boCauHoiService.getById(id);
        if (bch == null) return "redirect:/Teacher/TrangChu";

        model.addAttribute("boCauHoi", bch);
        model.addAttribute("dsGiangVien", taiKhoanService.getGiangVienByBoCauHoi(id));
        model.addAttribute("dsLoaiTrongBo", loaiService.getLoaiByBoCauHoi(id));
        model.addAttribute("allLoaiHeThong", loaiService.getAllLoai());
        model.addAttribute("tatCaGiangVien", taiKhoanService.getAllGiangVien());
        model.addAttribute("dsMoDe", moDeService.getAllByBoCauHoi(id));
        return "teacher/ChiTietBoCauHoi";
    }

    @PostMapping("/ThemGiangVien")
    public String themGiangVien(@RequestParam("maBch") Integer maBch,
                                @RequestParam("tenDangNhap") String tenDangNhap) {
    	
        boCauHoiGvService.saveRelation(tenDangNhap, maBch, "COLLABORATOR");
        return "redirect:/Teacher/ChiTietBoCauHoi/" + maBch;
    }

    @GetMapping("/XoaGiangVien")
    public String xoaGiangVien(@RequestParam("tenDangNhap") String tenDangNhap,
                               @RequestParam("maBch") Integer maBch) {
        boCauHoiGvService.deleteByUserAndBch(tenDangNhap, maBch);
        return "redirect:/Teacher/ChiTietBoCauHoi/" + maBch;
    }

    @PostMapping("/ThemLoai")
    public String themLoai(@RequestParam("maBch") Integer maBch,
                           @RequestParam("maLoai") Integer maLoai) {
        boCauHoiLoaiService.saveRelation(maBch, maLoai);
        return "redirect:/Teacher/ChiTietBoCauHoi/" + maBch;
    }

    @GetMapping("/XoaLoai")
    public String xoaLoai(@RequestParam("maLoai") Integer maLoai,
                          @RequestParam("maBch") Integer maBch) {
        boCauHoiLoaiService.deleteRelation(maBch, maLoai); 
        return "redirect:/Teacher/ChiTietBoCauHoi/" + maBch;
    }
}