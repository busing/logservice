package com.junrui.logservice.util;

import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.context.ApplicationContext;

public class SpringBeanFactory {
 
  private static ApplicationContext context;

   /**
    * 在应用程序启动时配置spring框架
    * @param filePath
    */
   public static void init(String filePath) {
	   if (context == null) {
       context = new FileSystemXmlApplicationContext(filePath);
    }
  }
   public static ApplicationContext getContext(){
    return context;
   }

   /**
    * 方法用于获取业务对象。
    * @param beanName
    * @return
    */
   public static Object getBusinessOjbect(String beanName) {
    return context.getBean(beanName);
   }
   
   /**
    * 方法用于获取业务对象。
    * @param beanName
    * @return
    */
   public static Object getBusinessOjbect(Class	clazz) {
    return context.getBean(clazz);
   }
   /**
    * 在应用程序关闭时，清空spring框架配置信息。
    */
   public static void clear() {
    if (context != null) {
     context = null;
    }
  }
}
