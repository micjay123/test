package com.lcj.manage.config;

import com.lcj.manage.interceptor.HRInterceptor;
import com.lcj.manage.interceptor.RightInterceptor;
import com.lcj.manage.interceptor.UserInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public  class InterceptorConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addInterceptors(InterceptorRegistry registry){
        UserInterceptor userInterceptor=new UserInterceptor();
        RightInterceptor rightInterceptor = new RightInterceptor();
        HRInterceptor hrInterceptor =new HRInterceptor();
        registry.addInterceptor(userInterceptor).addPathPatterns("/userState/**");
        registry.addInterceptor(userInterceptor).addPathPatterns("/userLeave/**");
        registry.addInterceptor(userInterceptor).addPathPatterns("/user/sector/**");
        registry.addInterceptor(userInterceptor).addPathPatterns("/user/role/**");
        registry.addInterceptor(rightInterceptor).addPathPatterns("/userState/**");
        registry.addInterceptor(userInterceptor).addPathPatterns("/sector/**");
        registry.addInterceptor(userInterceptor).addPathPatterns("/chart/**");
        registry.addInterceptor(rightInterceptor).addPathPatterns("/sector/**");
        registry.addInterceptor(userInterceptor).addPathPatterns("/right/**");
        registry.addInterceptor(rightInterceptor).addPathPatterns("/right/**");
        registry.addInterceptor(userInterceptor).addPathPatterns("/role/**");
        registry.addInterceptor(rightInterceptor).addPathPatterns("/role/**");
        registry.addInterceptor(hrInterceptor).addPathPatterns("/user/sector/**");
        registry.addInterceptor(hrInterceptor).addPathPatterns("/user/role/**");
        super.addInterceptors(registry);
    }
}