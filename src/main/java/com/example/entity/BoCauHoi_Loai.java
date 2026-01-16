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
@Table(name = "bo_cau_hoi_loai")
public class BoCauHoi_Loai {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "MaBoCauHoi")
    private Integer maBoCauHoi;

    @Column(name = "MaLoai")
    private Integer maLoai;

    
    public BoCauHoi_Loai(Integer maBoCauHoi, Integer maLoai) {
        this.maBoCauHoi = maBoCauHoi;
        this.maLoai = maLoai;
    }

}