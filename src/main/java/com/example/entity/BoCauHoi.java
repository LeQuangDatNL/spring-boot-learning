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
@Table(name = "bo_cau_hoi")
public class BoCauHoi {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaBoCauHoi")
    private Integer maBoCauHoi;

    @Column(name = "Ten")
    private String ten;

    @Column(name = "Anh")
    private String anh;

    @Column(name = "MoTa")
    private String moTa;


}