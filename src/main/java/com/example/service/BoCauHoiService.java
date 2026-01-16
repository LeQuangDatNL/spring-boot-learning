package com.example.service;

import com.example.entity.BoCauHoi;
import com.example.repository.BoCauHoiRepository;

import org.jspecify.annotations.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

@Service
public class BoCauHoiService {

    @Autowired
    private BoCauHoiRepository boCauHoiRepository;
   

    public List<BoCauHoi> getAllKhoaHoc() {
        return boCauHoiRepository.findAll();
    }


    public BoCauHoi getById(Integer id) {
        return boCauHoiRepository.findById(id).orElse(null);
    }
    
    public List<BoCauHoi> getBoCauHoiByTenDangNhap(String tenDangNhap) {
        return boCauHoiRepository.findBoCauHoiByCreator(tenDangNhap);
    }
    public List<BoCauHoi> getBoCauHoiByTenDangNhapNguoiThamGia(String tenDangNhap) {
        return boCauHoiRepository.findBoCauHoiByCOLLABORATOR(tenDangNhap);
    }
    
    public BoCauHoi create(BoCauHoi boCauHoi, MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            try {
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

                // ĐƯỜNG DẪN VẬT LÝ (uploads ngoài project)
                Path path = Paths.get("uploads/test/" + fileName);

                Files.createDirectories(path.getParent());
                Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

                // LƯU ĐƯỜNG DẪN ẢO
                boCauHoi.setAnh("/test/" + fileName);

            } catch (IOException e) {
                throw new RuntimeException("Upload file lỗi", e);
            }
        }
        return boCauHoiRepository.save(boCauHoi);
    }
    public BoCauHoi updateWithFile(Integer id, BoCauHoi data, MultipartFile file) {
        Optional<BoCauHoi> opt = boCauHoiRepository.findById(id);

        if (opt.isPresent()) {
            BoCauHoi bch = opt.get();
            bch.setTen(data.getTen());
            bch.setMoTa(data.getMoTa());

            if (file != null && !file.isEmpty()) {
                try {
                    if (bch.getAnh() != null) {
                        Path oldPath = Paths.get("uploads" + bch.getAnh());
                        Files.deleteIfExists(oldPath);
                    }

                    String newFileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                    Path newPath = Paths.get("uploads/test/" + newFileName);

                    Files.createDirectories(newPath.getParent());
                    Files.copy(file.getInputStream(), newPath, StandardCopyOption.REPLACE_EXISTING);

                    bch.setAnh("/test/" + newFileName);

                } catch (IOException e) {
                    throw new RuntimeException("Update file lỗi", e);
                }
            }
            return boCauHoiRepository.save(bch);
        }
        return null;
    }
    public Long thongKe() {
    	return boCauHoiRepository.count();
    }
    public void delete(Integer id) {
        Optional<BoCauHoi> opt = boCauHoiRepository.findById(id);

        if (opt.isPresent()) {
            BoCauHoi bch = opt.get();

            if (bch.getAnh() != null) {
                try {
                    Path path = Paths.get("uploads" + bch.getAnh());
                    Files.deleteIfExists(path);
                } catch (IOException e) {
                    throw new RuntimeException("Xóa file lỗi", e);
                }
            }
            boCauHoiRepository.deleteById(id);
        }
    }




}
