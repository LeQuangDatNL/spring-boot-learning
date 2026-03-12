package com.example.controller.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.entity.TaiKhoan;
import com.example.repository.LoaiRepository;
import com.example.service.BoCauHoiService;
import com.example.service.TaiKhoanService;


@Controller
public class TrangChuAdminController {
	@Autowired
	private LoaiRepository loaiCauHoiService;
	@Autowired
	private BoCauHoiService boCauHoiService;
	@Autowired
	private TaiKhoanService taiKhoanService;
	
    @GetMapping("/Admin/TrangChu")
    public String dashboard(Model model) {

        model.addAttribute("soLoaiCauHoi", loaiCauHoiService.count());
        model.addAttribute("soBoCauHoi", boCauHoiService.thongKe());
        model.addAttribute("soAdmin", taiKhoanService.thongKeAdmin());
        model.addAttribute("soSinhVien", taiKhoanService.thongKeHocVien());
        model.addAttribute("soGiangVien", taiKhoanService.thongKeGiangVien());

        return "admin/TrangChu";
    }
}
