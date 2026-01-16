package com.example.controller.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.entity.CauHoi;
import com.example.service.CauHoiService;
import com.example.service.MoDeService;

@Controller
@RequestMapping("/Teacher/CauHoi")
public class QuanLyCauHoiController {

    @Autowired
    private CauHoiService cauHoiService;
    
    @Autowired
    private MoDeService moDeService;

    @GetMapping("/ChiTietMaDe/{maMoDe}")
    public String chiTietMaDe(@PathVariable Integer maMoDe, Model model) {
        model.addAttribute("moDe", moDeService.getById(maMoDe));
        model.addAttribute("dsCauHoi", cauHoiService.getByMaMoDe(maMoDe));
        return "teacher/ChiTietMaDe";
    }

    @PostMapping("/SaveOrUpdate")
    public String saveOrUpdate(@ModelAttribute CauHoi cauHoi) {
        cauHoiService.save(cauHoi);
        return "redirect:/Teacher/CauHoi/ChiTietMaDe/" + cauHoi.getMaMoDe();
    }

    @GetMapping("/Delete/{id}")
    public String delete(@PathVariable Integer id) {
        CauHoi ch = cauHoiService.getById(id);
        Integer maMoDe = ch.getMaMoDe();
        cauHoiService.delete(id);
        return "redirect:/Teacher/CauHoi/ChiTietMaDe/" + maMoDe;
    }
}