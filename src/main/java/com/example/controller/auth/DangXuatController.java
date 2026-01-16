package com.example.controller.auth;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DangXuatController {

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        
        return "redirect:/login";
    }
}