package com.example.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.entity.BoCauHoi;
import com.example.entity.MoDe;
import com.example.service.BoCauHoiService;
import com.example.service.MoDeService;



@Controller
@RequestMapping("/User")
public class UserBoCauHoiController {

    @Autowired
    private BoCauHoiService boCauHoiService;

    @Autowired
    private MoDeService moDeService;

    @GetMapping("/ChiTietBoCauHoi/{maBch}")
    public String chiTiet(@PathVariable Integer maBch, Model model) {
        BoCauHoi bch = boCauHoiService.getById(maBch);
        
        List<MoDe> dsMoDe = moDeService.getAllByBoCauHoi(maBch);
        
        model.addAttribute("boCauHoi", bch);
        model.addAttribute("dsMoDe", dsMoDe);
        
        return "user/ChiTietBoCauHoi";
    }
}