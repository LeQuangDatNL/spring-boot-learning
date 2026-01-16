package com.example.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import org.hibernate.annotations.Immutable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor         
@AllArgsConstructor   
@Entity
@Immutable
@Table(name = "v_chi_tiet_bo_cau_hoi")
public class ChiTietCacCauHoi {

    @Id
    private Integer maDapAn;       
    private Integer maCauHoi;      
    private Integer maBoCauHoi;   
    private Integer maMoDe;        
    private Integer thuTuDe;       
    private Integer thuTuCau;      
    private String noiDungCauHoi;
    private String kyHieu;         
    private String noiDungDapAn;   // map từ da.NoiDung
    private String giaiThich;
    private Boolean dapAnDung;
    private String noiDungDe;
    private String nguonFile;// map từ da.IsDung

}
