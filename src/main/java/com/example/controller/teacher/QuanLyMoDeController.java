package com.example.controller.teacher;

import com.example.entity.MoDe;
import com.example.service.MoDeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/Teacher/MoDe")
public class QuanLyMoDeController {

    @Autowired
    private MoDeService moDeService;

    @PostMapping("/SaveOrUpdate")
    public String saveOrUpdate(
            @ModelAttribute MoDe moDe,
            @RequestParam(value = "fileMp3", required = false) MultipartFile file) {

        moDeService.saveOrUpdate(moDe, file);

        return "redirect:/Teacher/ChiTietBoCauHoi/" + moDe.getMaBoCauHoi();
    }

    @GetMapping("/Delete/{id}")
    public String deleteMoDe(@PathVariable Integer id) {
        MoDe moDe = moDeService.getById(id);
        if (moDe != null) {
            Integer maBch = moDe.getMaBoCauHoi();
            moDeService.delete(id);
            return "redirect:/Teacher/ChiTietBoCauHoi/" + maBch;
        }
        return "redirect:/Teacher/TrangChu";
    }
}
