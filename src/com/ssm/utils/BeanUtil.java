package com.ssm.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class BeanUtil implements ApplicationContextAware{  
    private static ApplicationContext context;  
      
    @Override  
    public void setApplicationContext(ApplicationContext arg0) throws BeansException {  
        // TODO Auto-generated method stub  
        context = arg0;  
    }  
    public static Object getBean(String beanName){  
        return context.getBean(beanName);  
    }  
    public static <T> Object getBeanByClass(Class<T> c){  
        return context.getBean(c);  
    }  
} 
