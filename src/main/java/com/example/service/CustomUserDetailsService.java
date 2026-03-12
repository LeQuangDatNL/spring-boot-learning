package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.security.core.userdetails.User;
import com.example.entity.TaiKhoan;
import com.example.repository.TaiKhoanRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private TaiKhoanRepository repo;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {

        TaiKhoan tk = repo.findById(username)
                .orElseThrow(() ->
                        new UsernameNotFoundException("Không tìm thấy tài khoản"));

        return User.builder()
                .username(tk.getTenDangNhap())
                .password(tk.getMatKhau())
                .roles(tk.getLoai()) 
                .build();
    }
}