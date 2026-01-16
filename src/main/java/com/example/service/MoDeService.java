package com.example.service;

import com.example.entity.MoDe;
import com.example.repository.MoDeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Service
public class MoDeService {

    @Autowired
    private MoDeRepository moDeRepository;

    public List<MoDe> getAllByBoCauHoi(Integer maBch) {
        return moDeRepository.findByMaBoCauHoiOrderByThuTuAsc(maBch);
    }

    private final String UPLOAD_DIR = "uploads/mp3/";

    public MoDe saveOrUpdate(MoDe moDe, MultipartFile file) {
        try {
            if (file != null && !file.isEmpty()) {

                // XÓA FILE CŨ NẾU UPDATE
                if (moDe.getMaMoDe() != null) {
                    MoDe old = getById(moDe.getMaMoDe());
                    if (old != null && old.getNguonFile() != null) {
                        Path oldPath = Paths.get(UPLOAD_DIR + old.getNguonFile());
                        Files.deleteIfExists(oldPath);
                    }
                }

                // LƯU FILE MỚI
                String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
                Path path = Paths.get(UPLOAD_DIR + fileName);

                Files.createDirectories(path.getParent());
                Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);

                // CHỈ LƯU TÊN FILE (HOẶC /mp3/xxx.mp3 đều được)
                moDe.setNguonFile(fileName);
            } else if (moDe.getMaMoDe() != null) {
                // GIỮ FILE CŨ
                MoDe old = getById(moDe.getMaMoDe());
                moDe.setNguonFile(old.getNguonFile());
            }

            return moDeRepository.save(moDe);

        } catch (Exception e) {
            throw new RuntimeException("Lỗi lưu file MP3", e);
        }
    }

    public void delete(Integer id) {
        MoDe moDe = getById(id);
        if (moDe != null && moDe.getNguonFile() != null) {
            try {
                Path path = Paths.get(UPLOAD_DIR + moDe.getNguonFile());
                Files.deleteIfExists(path);
            } catch (Exception e) {
                throw new RuntimeException("Lỗi xóa file MP3", e);
            }
        }
        moDeRepository.deleteById(id);
    }

    public MoDe getById(Integer id) {
        return moDeRepository.findById(id).orElse(null);
    }
}