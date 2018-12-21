/**
 * Copyright (c) 2018-2020, CMGPlex Inc. All Rights Reserved.
 * <p>
 * Project Name: baseapi
 * @version: 1.0
 * @date:  2018-04-23 12:30:36
 */
package com.menglei.account.admin.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;

import java.lang.reflect.Method;

/**
 * @author York Liu (york.liu@cmgplex.com)
 */
@Configuration
@EnableCaching
public class RedisConfig extends CachingConfigurerSupport {

	/*@Bean
	@SuppressWarnings("rawtypes")
	public CacheManager cacheManager(RedisTemplate<?, ?> redisTemplate) {
		RedisCacheManager rcm = new RedisCacheManager(redisTemplate);
		return rcm;
	}*/

	@Bean
	@Override
	public KeyGenerator keyGenerator() {
		return new KeyGenerator() {
			@Override
			public Object generate(Object target, Method method, Object... params) {
				StringBuilder sb = new StringBuilder();
				sb.append(target.getClass().getName());
				sb.append(method.getName());
				for (Object o : params) {
					if (o != null) {
						sb.append(o.toString());
					}
				}
				return sb.toString();
			}
		};
	}

	@Bean
	public RedisTemplate<String, String> redisTemplate(RedisConnectionFactory factory) {
		StringRedisTemplate srt = new StringRedisTemplate(factory);
		Jackson2JsonRedisSerializer j2j = new Jackson2JsonRedisSerializer(Object.class);
		ObjectMapper om = new ObjectMapper();
		om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
		j2j.setObjectMapper(om);
		srt.setValueSerializer(j2j);
		srt.afterPropertiesSet();
		return srt;
	}

}
