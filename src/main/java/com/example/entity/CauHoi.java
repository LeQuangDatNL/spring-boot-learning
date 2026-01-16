package com.example.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
@Table(name = "cau_hoi")

public class CauHoi {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer maCauHoi;
    
    private Integer maBoCauHoi;
    private Integer maMoDe; 
    private Integer thuTu;
    
    @Column(columnDefinition = "TEXT")
    private String noiDung;
    
    private String dapAnA;
    private String dapAnB;
    private String dapAnC;
    private String dapAnD;
    private String dapAnDung;
    
    @Column(columnDefinition = "TEXT")
    private String giaiThich;

}