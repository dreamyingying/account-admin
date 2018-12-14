/**
 * Copyright (c) 2018-2020, CMGPlex Inc. All Rights Reserved.
 * <p>
 * Project Name:
 * @version: 1.0
 * @date:  2018-04-11 16:38:40
 */
package com.menglei.account.admin.config;

import feign.Feign;
import feign.hystrix.HystrixFeign;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcRegistrations;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.core.annotation.AnnotatedElementUtils;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

/**
 * @author York Liu (york.liu@cmgplex.com)
 */

@Configuration
@ConditionalOnClass({Feign.class})
public class FeignConfig {
    /**
    * 配置类不是必须的，如果你要单独配置，比如默认关闭hystrix （这里返回 Feign.Builder()）才需要
    * */
    @Bean
    @Scope("prototype")
    public Feign.Builder feignBuilder() {
        return HystrixFeign.builder();
    }

    @Bean
    public WebMvcRegistrations feignWebRegistrations() {
        return new WebMvcRegistrations() {
            @Override
            public RequestMappingHandlerMapping getRequestMappingHandlerMapping() {
                return new FeignRequestMappingHandlerMapping();
            }
        };
    }

    private static class FeignRequestMappingHandlerMapping extends RequestMappingHandlerMapping {
        @Override
        protected boolean isHandler(Class<?> beanType) {
            return super.isHandler(beanType) &&
                    !AnnotatedElementUtils.hasAnnotation(beanType, FeignClient.class);
        }
    }
}