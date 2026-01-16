package com.example.repository;

import com.example.entity.GhiChuCauHoi;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface GhiChuRepository extends JpaRepository<GhiChuCauHoi, Integer> {
    
    List<GhiChuCauHoi> findByTenDangNhap(String tenDangNhap);
    GhiChuCauHoi findByTenDangNhapAndMaCauHoi(String tenDangNhap, Integer maCauHoi);
}