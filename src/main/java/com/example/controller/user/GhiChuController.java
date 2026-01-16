package com.example.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.service.GhiChuService;
import com.example.service.QuizService;

import jakarta.servlet.http.HttpSession;
@RestController
@RequestMapping("/User")
public class GhiChuController {
	@Autowired
	private GhiChuService ghiChuService;
	@Autowired
	private QuizService quizService;
	@PostMapping("/GhiChu/Save")
    public ResponseEntity<String> luuGhiChu(@RequestParam("maCauHoi") Integer maId, 
                                            @RequestParam("noiDung") String content, 
                                            HttpSession session) {
        
        String username = (String) session.getAttribute("userName");
        
        if (username != null) {
            ghiChuService.saveOrUpdate(username, maId, content);
            return ResponseEntity.ok("Lưu thành công"); 
        }
        
        return ResponseEntity.status(401).body("Chưa đăng nhập");
    }
	@PostMapping("/GhiChu/AskAI")
    public String askAI(@RequestParam("prompt") String prompt) {
        return quizService.askAIWithText(prompt);
    }
}
