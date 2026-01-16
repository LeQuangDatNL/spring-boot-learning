package com.example.repository;

import com.example.entity.Loai;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LoaiRepository extends JpaRepository<Loai, Integer> {
	@Query("""
            SELECT l FROM Loai l 
            JOIN BoCauHoi_Loai bl ON l.maLoai = bl.maLoai 
            WHERE bl.maBoCauHoi = :maBch
        """)
    List<Loai> findLoaiByMaBoCauHoi(@Param("maBch") Integer maBch);
	
}
