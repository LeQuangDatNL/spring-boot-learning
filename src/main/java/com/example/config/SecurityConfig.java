package com.example.config;

import com.example.service.TaiKhoanService;
import com.example.entity.TaiKhoan;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private TaiKhoanService taiKhoanService;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/login").permitAll()
                .requestMatchers("/Admin/**").hasRole("admin")
                .requestMatchers("/Teacher/**").hasRole("TEACHER")
                .anyRequest().permitAll()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .successHandler((request, response, authentication) -> {

                    HttpSession session = request.getSession();

                    String username = authentication.getName();
                    TaiKhoan tk = taiKhoanService.findByTenDangNhap(username);

                    session.setAttribute("user", tk);
                    session.setAttribute("userRole", tk.getLoai());
                    session.setAttribute("userName", tk.getTenDangNhap());

                    String vaiTro = tk.getLoai();

                    if ("admin".equalsIgnoreCase(vaiTro)) {
                        response.sendRedirect("/Admin/TrangChu");
                    } else if ("TEACHER".equalsIgnoreCase(vaiTro)) {
                        response.sendRedirect("/Teacher/TrangChu");
                    } else {
                        response.sendRedirect("/TrangChu");
                    }
                })
                .failureUrl("/login?error=true")
                .permitAll()
            )
            .logout(logout -> logout
                .logoutSuccessUrl("/login?logout")
                .permitAll()
            );

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance(); // không mã hóa
    }
}