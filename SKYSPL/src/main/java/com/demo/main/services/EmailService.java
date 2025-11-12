package com.demo.main.services;

import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public int sendOtpEmail(String toEmail) {
        int otp = generateOtp();

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("Your OTP Verification Code");
        message.setText("Your OTP code is: " + otp + "\n\nPlease use this to complete your registration.");

        mailSender.send(message);
        return otp;
    }

    private int generateOtp() {
        Random random = new Random();
        return 100000 + random.nextInt(900000);  // 6-digit OTP
    }
}

