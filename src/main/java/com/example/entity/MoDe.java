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
@Table(name = "mo_de")
public class MoDe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaMoDe")
    private Integer maMoDe;

    @Column(name = "NoiDungText", columnDefinition = "TEXT")
    private String noiDungText;

    @Column(name = "NguonFile")
    private String nguonFile;

    @Column(name = "thu_tu")
    private Integer thuTu;

    @Column(name = "MaBoCauHoi")
    private Integer maBoCauHoi;

}