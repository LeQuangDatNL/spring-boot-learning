package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.entity.TaiKhoan;

@Repository
public interface TaiKhoanRepository extends JpaRepository<TaiKhoan, String> {
    TaiKhoan findByTenDangNhapAndMatKhau(String tenDangNhap, String matKhau);

    @Query("SELECT t.hoTen FROM TaiKhoan t WHERE t.loai = 'TEACHER'")
    List<String> findAllTeacherNames();
    
    @Query("SELECT t FROM TaiKhoan t WHERE t.loai = 'USER'")
    List<TaiKhoan> findAllSinhVien();
    List<TaiKhoan> findByLoai(String loai);
    @Query("""
            SELECT t FROM TaiKhoan t
            WHERE LOWER(t.hoTen) LIKE LOWER(CONCAT('%', :keyword, '%'))
        """)
    List<TaiKhoan> searchByHoTen(String keyword);
	@Query("""
            SELECT t FROM TaiKhoan t 
            JOIN BoCauHoi_GV bg ON t.tenDangNhap = bg.tenDangNhap 
            WHERE bg.maBoCauHoi = :maBch
        """)
    List<TaiKhoan> findTaiKhoanByMaBoCauHoi(Integer maBch);
	long countByLoai(String loai);

}