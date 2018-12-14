package com.menglei.account;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class AccountAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(AccountAdminApplication.class, args);
    }
}
