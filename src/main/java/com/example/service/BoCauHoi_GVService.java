package com.example.service;

import com.example.entity.BoCauHoi_GV;
import com.example.repository.BoCauHoi_GVRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class BoCauHoi_GVService {

    @Autowired
    private BoCauHoi_GVRepository boCauHoiGvRepository;

    public void saveRelation(String tenDangNhap, Integer maBch, String vaiTro) {
        boolean isExisted = boCauHoiGvRepository.existsByTenDangNhapAndMaBoCauHoi(tenDangNhap, maBch);
        
        if (!isExisted) {
            BoCauHoi_GV relation = new BoCauHoi_GV();
            relation.setTenDangNhap(tenDangNhap);
            relation.setMaBoCauHoi(maBch);
            relation.setVaiTro(vaiTro);
            
            boCauHoiGvRepository.save(relation);
        } else {
            System.out.println("Bỏ qua: Giảng viên " + tenDangNhap + " đã có quyền trong bộ đề " + maBch);
        }
    }

    public void updateRole(Integer id, String newRole) {
        Optional<BoCauHoi_GV> opt = boCauHoiGvRepository.findById(id);
        if (opt.isPresent()) {
            BoCauHoi_GV gv = opt.get();
            gv.setVaiTro(newRole);
            boCauHoiGvRepository.save(gv);
        }
    }
    public void deleteByUserAndBch(String tenDangNhap, Integer maBch) {
        boCauHoiGvRepository.deleteByUserAndBch(tenDangNhap, maBch);
    }

    public void deleteById(Integer id) {
        boCauHoiGvRepository.deleteById(id);
    }

    public void deleteByMaBoCauHoi(Integer maBch) {
        // boCauHoiGvRepository.deleteByMaBoCauHoi(maBch);
    }
}