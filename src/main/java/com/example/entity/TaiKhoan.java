package com.example.entity;

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
@Table(name = "tai_khoan", schema = "quanlyweb")
public class TaiKhoan {

    @Id
    @Column(name = "TenDangNhap", length = 50)
    private String tenDangNhap;

    @Column(name = "MatKhau", nullable = false)
    private String matKhau;

    @Column(name = "HoTen")
    private String hoTen;

    @Column(name = "Email")
    private String email;

    @Column(name = "SoDienThoai")
    private String soDienThoai;

    @Column(name = "Loai")
    private String loai;

    // Constructors
}