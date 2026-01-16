package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.example.entity.BoCauHoi;

@Repository
public interface BoCauHoiRepository extends JpaRepository<BoCauHoi, Integer> {
	@Query(value = "SELECT bch.* " +
	        "FROM tai_khoan b " +
	        "JOIN bo_cau_hoi_gv bchgv ON bchgv.TenDangNhap = b.TenDangNhap " +
	        "JOIN bo_cau_hoi bch ON bch.MaBoCauHoi = bchgv.MaBoCauHoi " +
	        "WHERE b.TenDangNhap = :tenDangNhap " +
	        "AND bchgv.vai_tro = 'CREATOR'", nativeQuery = true)
	List<BoCauHoi> findBoCauHoiByCreator(@Param("tenDangNhap") String tenDangNhap);
	@Query(value = "SELECT bch.* " +
	        "FROM tai_khoan b " +
	        "JOIN bo_cau_hoi_gv bchgv ON bchgv.TenDangNhap = b.TenDangNhap " +
	        "JOIN bo_cau_hoi bch ON bch.MaBoCauHoi = bchgv.MaBoCauHoi " +
	        "WHERE b.TenDangNhap = :tenDangNhap " +
	        "AND bchgv.vai_tro = 'COLLABORATOR'", nativeQuery = true)
	List<BoCauHoi> findBoCauHoiByCOLLABORATOR(@Param("tenDangNhap") String tenDangNhap);
	@Query(value = "INSERT INTO bo_cau_hoi_gv (TenDangNhap, MaBoCauHoi, vai_tro) "
			+ "VALUES (:user, :maBCH, :role)", nativeQuery = true)
	void insertRelation(@Param("user") String user, @Param("maBCH") Integer maBCH, @Param("role") String role);
	
	
}