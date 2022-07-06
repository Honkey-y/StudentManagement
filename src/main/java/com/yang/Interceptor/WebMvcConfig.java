package com.yang.Interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //注册TestInterceptor拦截器
        InterceptorRegistration interceptorRegistration = registry.addInterceptor(new LoginInterceptor());
        //所有路径都被拦截
        interceptorRegistration.addPathPatterns("http://localhost:8081/Student/login/logins");

    }
}
