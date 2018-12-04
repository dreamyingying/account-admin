package com.menglei.account.admin.config;

import com.menglei.account.admin.common.CommonInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
  * @className MvcConfig
  * @Description TODO
  * @date 2018/12/4 16:20
  * @author Menglei（lei.meng@cmgplex.com)
  * @version 1.0
  **/
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Autowired
    private CommonInterceptor commonInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(commonInterceptor).addPathPatterns("/**");
    }

}
