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
@Table(name = "loai") 
public class Loai {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaLoai")
    private Integer maLoai;

    @Column(name = "TenLoai")
    private String tenLoai;
}