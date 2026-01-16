package com.example.controller.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.entity.CauHoi;
import com.example.entity.GhiChuCauHoi;
import com.example.entity.MoDe;
import com.example.service.CauHoiService;
import com.example.service.GhiChuService;
import com.example.service.MoDeService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/User/MoDe")
public class UserLuyenTapController {

    @Autowired
    private MoDeService moDeService;

    @Autowired
    private CauHoiService cauHoiService;
    @Autowired
    private GhiChuService GhiChuService;

    @GetMapping("/LuyenTap/{maMoDe}")
    public String luyenTap(@PathVariable Integer maMoDe, Model model, HttpSession session) {
        MoDe moDe = moDeService.getById(maMoDe);
        List<CauHoi> dsCauHoi = cauHoiService.getByMaMoDe(maMoDe);
        
        String username = (String) session.getAttribute("userName");
        if (username != null) {
            List<GhiChuCauHoi> dsGhiChu = GhiChuService.getNotesByUser(username);
            model.addAttribute("dsGhiChu", dsGhiChu);
        }
        
        model.addAttribute("moDe", moDe);
        model.addAttribute("dsCauHoi", dsCauHoi);
        return "user/LuyenTap";
    }
}