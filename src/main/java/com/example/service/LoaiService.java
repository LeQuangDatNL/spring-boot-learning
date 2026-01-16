package com.example.service;

import com.example.entity.Loai;
import com.example.repository.LoaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LoaiService {

    @Autowired
    private LoaiRepository loaiRepository;

    // Lấy tất cả loại
    public List<Loai> getAllLoai() {
        return loaiRepository.findAll();
    }

    // Lấy loại theo id
    public Optional<Loai> getLoaiById(Integer id) {
        return loaiRepository.findById(id);
    }

    // Tạo mới
    public Loai createLoai(Loai loai) {
        return loaiRepository.save(loai);
    }
    public List<Loai> getLoaiByBoCauHoi(Integer maBch) {

        return loaiRepository.findLoaiByMaBoCauHoi(maBch);
    }
    // Cập nhật
    public Loai updateLoai(Loai loai) {
    	return loaiRepository.save(loai);
    }
    public Long thongKe() {
    	return loaiRepository.count();
    }
    public void deleteLoai(Integer id) {
        if (!loaiRepository.existsById(id)) {
            throw new RuntimeException("Loai not found with id " + id);
        }
        loaiRepository.deleteById(id);
    }
}
