package com.huifu.base;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 获取Spring上下文工具类
 */
public class SpringContext 
{
	protected static ApplicationContext context;
	
	public void setApplicationContext(ApplicationContext applicationContext)
	{
		context = applicationContext;
	}

    public static ApplicationContext getContext()
    {
        return context;
    }
}
