package com.example.service;

import com.example.entity.BoCauHoi_Loai;
import com.example.repository.BoCauHoi_LoaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoCauHoi_LoaiService {
    @Autowired
    private BoCauHoi_LoaiRepository repo;

    public void saveRelation(Integer maBch, Integer maLoai) {
    	boolean exists = repo.existsByMaBoCauHoiAndMaLoai(maBch, maLoai);
        
        if (!exists) {
            BoCauHoi_Loai relation = new BoCauHoi_Loai(maBch, maLoai);
            repo.save(relation);
        }
    }


    public void deleteRelation(Integer maBch, Integer maLoai) {
    	repo.deleteByMaBchAndMaLoai(maBch, maLoai);
    }
}