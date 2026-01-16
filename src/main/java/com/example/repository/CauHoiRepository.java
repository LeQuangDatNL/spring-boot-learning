package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.entity.CauHoi;

@Repository
public interface CauHoiRepository extends JpaRepository<CauHoi, Integer> {

    List<CauHoi> findByMaMoDeOrderByThuTuAsc(Integer maMoDe);
    

    List<CauHoi> findByMaBoCauHoiOrderByThuTuAsc(Integer maBoCauHoi);
}