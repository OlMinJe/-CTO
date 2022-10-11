package com.project.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {

    @Bean
    public static JavaMailSender mailSender(){

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("juliepark4253@gmail.com");
        mailSender.setPassword("iofevbntxguohmdb");

        Properties props=mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol","smtp");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.socketFactory.port", "587"); //465
        props.put("mail.debug","true");
        props.put("mail.smtp.ssl.trust","smtp.gmail.com");
        props.put("mail.smtps.ssl.checkserveridentity","true");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        //props.put("mail.smtp.ssl.enable","true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.smtp.ssl.protocols","TLSv1.2");


        return mailSender;

///202031011@g.baewha.ac.kr
    }

}
