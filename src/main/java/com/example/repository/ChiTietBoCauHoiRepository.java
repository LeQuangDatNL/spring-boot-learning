package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.example.entity.ChiTietBoCauHoi;

@Repository
public interface ChiTietBoCauHoiRepository extends JpaRepository<ChiTietBoCauHoi, Integer> {
	List<ChiTietBoCauHoi> findTop3By();
	@Query("SELECT v FROM ChiTietBoCauHoi v " +
	           "WHERE (:ten IS NULL OR v.tenKhoa LIKE %:ten%) " +
	           "AND (:loai IS NULL OR v.danhSachLoai LIKE %:loai%) " +
	           "AND (:tenGv IS NULL OR (v.danhSachPar LIKE %:tenGv% OR v.nguoiTao LIKE %:tenGv%))")
	    List<ChiTietBoCauHoi> searchByThreeKeys(
	        @Param("ten") String ten, 
	        @Param("loai") String loai, 
	        @Param("tenGv") String tenGv
	    );
}
