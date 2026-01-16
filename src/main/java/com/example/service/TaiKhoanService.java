package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entity.TaiKhoan;
import com.example.repository.TaiKhoanRepository;


@Service
public class TaiKhoanService {

    @Autowired
    private TaiKhoanRepository taiKhoanRepo;

    // ===== LOGIN =====
    public TaiKhoan login(String tenDangNhap, String matKhau) {
        return taiKhoanRepo.findByTenDangNhapAndMatKhau(tenDangNhap, matKhau);
    }
    public Long thongKeAdmin() {
        return taiKhoanRepo.countByLoai("ADMIN");
    }

    public Long thongKeGiangVien() {
        return taiKhoanRepo.countByLoai("TEACHER");
    }

    public Long thongKeHocVien() {
        return taiKhoanRepo.countByLoai("USER");
    }
    public TaiKhoan findById(String tenDangNhap) {
        return taiKhoanRepo.findById(tenDangNhap).orElse(null);
    }
    // ===== LẤY TÊN GIẢNG VIÊN =====
    public List<String> getAllTenGV() {
        return taiKhoanRepo.findAllTeacherNames();
    }
    public List<TaiKhoan> searchByHoTen(String key) {
        if (key == null || key.trim().isEmpty()) {
            return taiKhoanRepo.findAll();
        }
        return taiKhoanRepo.searchByHoTen(key);
    }
    
    public List<TaiKhoan> getAllGiangVien() {
        return taiKhoanRepo.findByLoai("Teacher");
    }
    public TaiKhoan findByTenDangNhap(String tenDangNhap) {
        return taiKhoanRepo.findById(tenDangNhap).orElse(null);
    }
    public List<TaiKhoan> getGiangVienByBoCauHoi(Integer maBch) {
        return taiKhoanRepo.findTaiKhoanByMaBoCauHoi(maBch);
    }
    // ===== SỬA / THÊM =====
    public TaiKhoan save(TaiKhoan taiKhoan) {
        return taiKhoanRepo.save(taiKhoan);
    }

    // ===== XÓA =====
    public void delete(String tenDangNhap) {
        taiKhoanRepo.deleteById(tenDangNhap);
    }
}