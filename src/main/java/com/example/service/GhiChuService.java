package com.example.service;

import com.example.entity.GhiChuCauHoi;
import com.example.repository.GhiChuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GhiChuService {

	@Autowired
	private GhiChuRepository ghiChuRepo;
	List<GhiChuCauHoi> findByTenDangNhap(String tenDangNhap){
		return ghiChuRepo.findByTenDangNhap(tenDangNhap);
	}
	public List<GhiChuCauHoi> getNotesByUser(String username) {
        return ghiChuRepo.findByTenDangNhap(username);
    }
	public void saveOrUpdate(String username, Integer maCauHoi, String content) {
	    GhiChuCauHoi existingNote = ghiChuRepo.findByTenDangNhapAndMaCauHoi(username, maCauHoi);
	    
	    if (existingNote != null) {
	        existingNote.setGhiChu(content);
	        ghiChuRepo.save(existingNote); 
	    } else {
	        // 3. Nếu CHƯA CÓ: Tạo mới hoàn toàn
	        GhiChuCauHoi newNote = new GhiChuCauHoi();
	        newNote.setTenDangNhap(username);
	        newNote.setMaCauHoi(maCauHoi);
	        newNote.setGhiChu(content);
	        ghiChuRepo.save(newNote);
	    }
	}
}