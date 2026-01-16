package com.example.entity;

import org.hibernate.annotations.Immutable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor         
@AllArgsConstructor   
@Entity
@Table(name = "view_chi_tiet_bo_cau_hoi") 
@Immutable
public class ChiTietBoCauHoi{

	@Id
    @Column(name = "MaBoCauHoi")
    private Integer maBoCauHoi;

    @Column(name = "TenKhoa")
    private String tenKhoa;

    @Column(name = "Anh")
    private String anh;

    @Column(name = "MoTa")
    private String moTa;

    @Column(name = "DanhSachLoai")
    private String danhSachLoai; 

    @Column(name = "NguoiTao")
    private String nguoiTao; 

    @Column(name = "DanhSachPar")
    private String danhSachPar;

    
}