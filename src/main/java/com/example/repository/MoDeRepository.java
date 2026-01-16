package com.example.repository;

import com.example.entity.MoDe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface MoDeRepository extends JpaRepository<MoDe, Integer> {
    List<MoDe> findByMaBoCauHoiOrderByThuTuAsc(Integer maBoCauHoi);
}