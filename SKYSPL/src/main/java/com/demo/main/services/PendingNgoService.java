package com.demo.main.services;

import com.demo.main.model.PendingNgo;
import java.util.List;

public interface PendingNgoService {
    void save(PendingNgo ngo);
    PendingNgo findById(Long id);
    void delete(Long id);
    List<PendingNgo> findAll();
}
