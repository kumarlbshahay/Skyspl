package com.demo.main.services;

import com.demo.main.model.Ngo;
import com.demo.main.repository.NgoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class NgoService {

    @Autowired
    private NgoRepository ngoRepository;

    public Ngo registerNgo(Ngo ngo) {
        ngo.setStatus("PENDING");
        ngo.setRegisteredAt(LocalDateTime.now());
        return ngoRepository.save(ngo);
    }

    public List<Ngo> getPendingVerificationList() {
        return ngoRepository.findByStatus("PENDING");
    }

    public Ngo verifyNgo(Long ngoId) {
        Optional<Ngo> optionalNgo = ngoRepository.findById(ngoId);
        if (optionalNgo.isPresent()) {
            Ngo ngo = optionalNgo.get();
            ngo.setStatus("VERIFIED");
            ngo.setVerifiedAt(LocalDateTime.now());
            ngo.setTrustedBadge(true);
            return ngoRepository.save(ngo);
        }
        return null;
    }

    public Ngo getNgoById(Long id) {
        return ngoRepository.findById(id).orElse(null);
    }

    public List<Ngo> getVerifiedNgosByCity(String city) {
        return ngoRepository.findByCityAndStatus(city, "VERIFIED");
    }

    public Ngo updateNgoProfile(Ngo updatedNgo) {
        updatedNgo.setLastUpdated(LocalDateTime.now());
        return ngoRepository.save(updatedNgo);
    }
    
    public List<Ngo> getByStatus(String status) {
        return ngoRepository.findByStatus(status);
    }

	public void deleteNgo(Long id) {
		ngoRepository.deleteById(id);
	}

	public List<Ngo> getAllNgos() {
		return ngoRepository.findAll();
	}

	public Ngo loginByDarpanId(String darpanId) {
		return ngoRepository.findByDarpanId(darpanId);
	}

	public Ngo loginByEmail(String email) {
		return ngoRepository.findByEmail(email);
	}

}
