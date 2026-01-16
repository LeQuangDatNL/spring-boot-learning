package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.entity.CauHoi;
import com.example.repository.CauHoiRepository;

@Service
public class CauHoiService {
    @Autowired
    private CauHoiRepository repo;

    public List<CauHoi> getByMaMoDe(Integer maMoDe) {
        return repo.findByMaMoDeOrderByThuTuAsc(maMoDe);
    }

    public CauHoi getById(Integer id) {
        return repo.findById(id).orElse(null);
    }

    public void save(CauHoi cauHoi) {
        repo.save(cauHoi);
    }
    public void delete(Integer id) {
        repo.deleteById(id);
    }
}