package com.example.repository;

import com.example.entity.ChiTietCacCauHoi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ChiTietCacCauHoiRepository extends JpaRepository<ChiTietCacCauHoi, Integer> {
    
	List<ChiTietCacCauHoi> findByMaBoCauHoi(Integer maBoCauHoi);
}