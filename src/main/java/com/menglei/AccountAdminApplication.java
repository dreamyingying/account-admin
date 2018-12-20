package com.menglei;

import com.menglei.account.admin.common.Md5Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class AccountAdminApplication {

    private static final Logger log = LoggerFactory.getLogger(AccountAdminApplication.class);
    public static void main(String[] args) {
        SpringApplication.run(AccountAdminApplication.class, args);
        log.info("menglei:"+Md5Utils.md5("menglei"));
    }
}
