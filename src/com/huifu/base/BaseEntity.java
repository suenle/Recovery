package com.huifu.base;

// 静态导入日期转换方法
import org.apache.commons.beanutils.BeanUtils;

import cn.org.rapid_framework.util.DateConvertUtils;

@SuppressWarnings("serial")
public abstract class BaseEntity implements java.io.Serializable {
    public static final int Flag_Delete = 0;	//删除状态
    public static final int Flag_Nomal = 1;		//正常状态
    
    protected static final String DATE_FORMAT      = "yyyy-MM-dd";
    protected static final String TIME_FORMAT      = "HH:mm:ss";
    protected static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
    protected static final String TIMESTAMP_FORMAT = "yyyy-MM-dd HH:mm:ss.S";
    
    public static String date2String(java.util.Date date, String dateFormat) {
        return DateConvertUtils.format(date, dateFormat);
    }
    
    public static <T extends java.util.Date> T string2Date(String dateString, String dateFormat, Class<T> targetResultType) {
        return DateConvertUtils.parse(dateString, dateFormat, targetResultType);
    }
    
    /**
     * 用于记录操作历史，无需记录操作历史的无需编写方法体
     * 获得操作模块名和要记录日志的对象属性名（中文名称：属性名），多个属性以“,”隔开（不区分中英文）
     * 
     * example：记录用户管理模块中的操作，只需记录唯一属性userName即可
     * public String getModuleAndKeyAttr(){
    		return "用户管理模块,用户名：userName，联系电话：tel";
       }
     */
    public abstract String getModuleAndKeyAttr();
    
    public void copyPropertiesFromOther(Object other) {
    	try {
			BeanUtils.copyProperties(this, other);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
}
