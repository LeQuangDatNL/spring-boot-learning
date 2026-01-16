package com.example.repository;

import com.example.entity.BoCauHoi_Loai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface BoCauHoi_LoaiRepository extends JpaRepository<BoCauHoi_Loai, Integer> {

    @Modifying
    @Transactional
    @Query("DELETE FROM BoCauHoi_Loai bl WHERE bl.maBoCauHoi = ?1 AND bl.maLoai = ?2")
    void deleteByMaBchAndMaLoai(Integer maBch, Integer maLoai);
    boolean existsByMaBoCauHoiAndMaLoai(Integer maBch, Integer maLoai);
}