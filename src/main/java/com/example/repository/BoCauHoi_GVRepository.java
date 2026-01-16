package com.example.repository;

import com.example.entity.BoCauHoi_GV;

import jakarta.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BoCauHoi_GVRepository extends JpaRepository<BoCauHoi_GV, Integer> {
	@Modifying
	@Transactional
	@Query("DELETE FROM BoCauHoi_GV b WHERE b.tenDangNhap = :user AND b.maBoCauHoi = :maBch")
	void deleteByUserAndBch(@Param("user") String user, @Param("maBch") Integer maBch);
	boolean existsByTenDangNhapAndMaBoCauHoi(String tenDangNhap, Integer maBoCauHoi);
}