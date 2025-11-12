package com.demo.main.services;

import com.demo.main.model.PendingNgo;
import com.demo.main.repository.PendingNgoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PendingNgoServiceImpl implements PendingNgoService {

    @Autowired
    private PendingNgoRepository repository;

    @Override
    public void save(PendingNgo ngo) {
        repository.save(ngo);
    }

    @Override
    public PendingNgo findById(Long id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void delete(Long id) {
        repository.deleteById(id);
    }

    @Override
    public List<PendingNgo> findAll() {
        return repository.findAll();
    }
}
