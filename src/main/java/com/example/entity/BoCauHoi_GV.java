package com.example.entity;

import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor         
@AllArgsConstructor   
@Entity
@Table(name = "bo_cau_hoi_gv")
public class BoCauHoi_GV {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "TenDangNhap")
    private String tenDangNhap;

    @Column(name = "MaBoCauHoi")
    private Integer maBoCauHoi;

    @Column(name = "vai_tro")
    private String vaiTro;
}