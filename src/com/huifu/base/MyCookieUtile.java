package com.huifu.base;

import javax.servlet.http.Cookie;

public class MyCookieUtile {

	 /** 
     * 通过传入的cookie名称从传入的cookie数组中查找cookie 
     * 如果数组为空，则没有找到返回为null 
     * 如果不为空，找到返回cookie 
     * @param cookies 
     * @param cookiename 
     * @return 
     */   
    public static Cookie findCookieByName(Cookie []cookies,String cookiename){  
          
        if (cookies==null) {  
            return null;              
        }else{    
              
            for (Cookie cookie : cookies) {  
                //获取cookie的名称和传入的名称对比  
                if (cookiename.equals(cookie.getName()) ) {  
                    //相同则返回  
                    return cookie;                    
                }  
            }  
            return null;  
        }                 
    }  
}
