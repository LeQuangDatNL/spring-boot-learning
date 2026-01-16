package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entity.ChiTietBoCauHoi;
import com.example.repository.ChiTietBoCauHoiRepository;

@Service
public class ChiTietBoCauHoiService {
	@Autowired
    private ChiTietBoCauHoiRepository viewRepo;
	public List<ChiTietBoCauHoi> getAllOrSearch(String ten, String loai, String tenGv) {
	    if ((ten == null || ten.trim().isEmpty()) && 
	        (loai == null || loai.trim().isEmpty()) && 
	        (tenGv == null || tenGv.trim().isEmpty())) {
	        return viewRepo.findAll();
	    }

	    String searchTen = (ten != null && !ten.trim().isEmpty()) ? ten : null;
	    String searchLoai = (loai != null && !loai.trim().isEmpty()) ? loai : null;
	    String searchTenGv = (tenGv != null && !tenGv.trim().isEmpty()) ? tenGv : null;

	    return viewRepo.searchByThreeKeys(searchTen, searchLoai, searchTenGv);
	}
	public List<ChiTietBoCauHoi> getAll(){
		return viewRepo.findAll();
	}
	public List<ChiTietBoCauHoi> findTop3By()  {
		return viewRepo.findTop3By();
	}
}
