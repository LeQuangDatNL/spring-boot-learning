package com.example.service;

import com.example.entity.ChiTietCacCauHoi;
import com.example.repository.ChiTietCacCauHoiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service 
public class ChiTietCacCauHoiService {

    @Autowired
    private ChiTietCacCauHoiRepository repository;

    public List<ChiTietCacCauHoi> layChiTietTheoBo(Integer maBo) {
        return repository.findByMaBoCauHoi(maBo);
    }
    
}