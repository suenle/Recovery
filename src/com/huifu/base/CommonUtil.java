package com.huifu.base;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

public class CommonUtil {
	public static final Integer NORMAL = 1;
	public static final Integer ABNOMAL = 0;
	public static final Integer COMPANY_LINEID = -1;
	public enum OP{
		CREATE, UPDATE
	}
	/**
	 * 得到N个小时前的时间
	 * @param time
	 * @param num
	 * @return
	 */
	public static Date getBeforeHourDate(Date time,int num){
		Calendar cal = Calendar.getInstance();
		cal.setTime(time);
		cal.add(Calendar.HOUR_OF_DAY,-1);
        Date beginTime = cal.getTime();
        return beginTime;
	}
	
    /**
     * 得到前或后n天的时间
     * @param today
     * @param num
     * @return
     */
    public static Date getBeforeDate(Date date,int num){
		Calendar calendar = Calendar.getInstance(); //得到日历
		calendar.setTime(date);//把当前时间赋给日历
		calendar.add(Calendar.DAY_OF_MONTH, num);  //设置为后n天
		Date beforeDate = calendar.getTime();   //得到后n天的时间
		return beforeDate;
	}
	/**
	 * 求某年某月的第一天
	 * @param time
	 * @param num
	 * @return
	 */
	public static Date getMonthBeginDate(Integer year,Integer month){
	//	DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendarFirst = Calendar.getInstance();
        calendarFirst.clear();
        calendarFirst.set(Calendar.YEAR, year);
        calendarFirst.set(Calendar.MONTH, month);
        Date beginTime = calendarFirst.getTime();
      //  String beginDate = fmt.format(beginTime);
        return beginTime;
	}
	/**
	 * 求某年某月的最后一天
	 * @param time
	 * @param num
	 * @return
	 */
	public static Date getMonthEndDate(Integer year,Integer month){
	//	DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendarLast = Calendar.getInstance();
        calendarLast.clear();
        calendarLast.set(Calendar.YEAR, year);
        calendarLast.set(Calendar.MONTH, month);
        calendarLast.roll(Calendar.DAY_OF_MONTH, -1);
        calendarLast.roll(Calendar.HOUR, -1);
        calendarLast.roll(Calendar.MINUTE, -1);
        calendarLast.roll(Calendar.SECOND, -1);
		Date endTime = calendarLast.getTime();
	//	String endDate = fmt.format(endTime);
        return endTime;
	}
    
    /**
     * 获取浏览器类型
     * @param request
     * @return
     */
    public static String getBrowser(HttpServletRequest request){
        String agent = request.getHeader("user-agent").toLowerCase();
		String browser = "其他浏览器";
		if (agent.indexOf("msie") > -1){
			browser = "IE浏览器";//IE浏览器
		}
		if (agent.indexOf("firefox") > -1){
			browser = "火狐浏览器";//火狐浏览器
		}
		if (agent.indexOf("chrome") > -1){
			browser = "chrome浏览器";//谷歌
		}
		if (agent.indexOf("opera") > -1){
			browser = "opera浏览器";//Opera浏览器
		}
		return browser;
    }
    /**
     * 获取IP地址
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
		 String ip = request.getHeader("x-forwarded-for");
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getHeader("Proxy-Client-IP");
		 }
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getHeader("WL-Proxy-Client-IP");
		 }
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getRemoteAddr();
		 }
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getHeader("http_client_ip");
		 }
		 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
		  ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		 }
		 // 如果是多级代理，那么取第一个ip为客户ip
		 if (ip != null && ip.indexOf(",") != -1) {
		  ip = ip.substring(ip.lastIndexOf(",") + 1, ip.length()).trim();
		 }
		 return ip;
	}
    
    /**
     * 类方法调用
     */
	public static Object methodInvoke(Class clazz, String prefix, String propertyName, Object value) {
		if (clazz == null || StringUtils.isBlank(prefix) || StringUtils.isBlank(propertyName) || value == null) {
			return null;
		}
		Object o = null;
		try {
			Field field = clazz.getDeclaredField(propertyName);
			Class parameterType = field.getType();
			o = clazz.newInstance();
			String methodName = prefix + propertyName.substring(0, 1).toUpperCase() + propertyName.substring(1);
			Method m = clazz.getMethod(methodName, parameterType);
			m.invoke(o, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}

	public static void main(String[] args) {
		String[] sArr = {"(淡黄,XL,1000);","(蓝色,L,100);","(白色,XL,500);","(蓝色,XXL,200)"};
		Arrays.sort(sArr);
		for (String s : sArr)
			System.out.println(s);
	}
	 public static String[] getMonth(Date dateBegin, Date dateEnd) {
	    	if(dateBegin==null){
	    		dateBegin = new Date();
}
	    	if(dateEnd==null){
	    		dateEnd = new Date();
	    	}
	        Calendar calendarBegin = Calendar.getInstance();
	        Calendar calendarEnd = Calendar.getInstance();
	        calendarBegin.setTime(dateBegin);
	        calendarEnd.setTime(dateEnd);
	        int month = 0;
	        String[] months;
	        // 假如年份相等
	        if (calendarBegin.get(Calendar.YEAR) == calendarEnd.get(Calendar.YEAR)) {
	            month = calendarEnd.get(Calendar.MONTH) - calendarBegin.get(Calendar.MONTH);
	            months = new String[month + 1];
	            Integer month1 = calendarBegin.get(Calendar.MONTH) + 1;
	            if (month1 < 10) {
	                months[0] = calendarBegin.get(Calendar.YEAR) + "0" + month1;
	            } else {
	                months[0] = calendarBegin.get(Calendar.YEAR) + "" + month1;
	            }
	            for (int i = 1; i < months.length; i++) {
	                Integer month2 = calendarBegin.get(Calendar.MONTH) + 1 + i;
	                if (month2 < 10) {
	                    months[i] = calendarBegin.get(Calendar.YEAR) + "0" + month2;
	                } else {
	                    months[i] = calendarBegin.get(Calendar.YEAR) + "" + month2;
	                }
	            }
	            return months;
	        } else {
	            // 相差的年数乘以12是月数
	            month = (calendarEnd.get(Calendar.YEAR) - calendarBegin.get(Calendar.YEAR)) * 12
	                    + calendarEnd.get(Calendar.MONTH) - calendarBegin.get(Calendar.MONTH);
	            months = new String[month + 1];
	            Integer month1 = calendarBegin.get(Calendar.MONTH) + 1;
	            if (month1 < 10) {
	                months[0] = calendarBegin.get(Calendar.YEAR) + "0" + month1;
	            } else {
	                months[0] = calendarBegin.get(Calendar.YEAR) + "" + month1;
	            }
	            Integer year = calendarBegin.get(Calendar.YEAR);
	            for (int i = 1; i < months.length; i++) {
	                // 这里要进行取余操作,,,,,例如 13个月会变成 1月
	                if ((calendarBegin.get(Calendar.MONTH) + 1 + i) % 12 == 0) {
	                    months[i] = year + "12";
	                    year++;
	                    continue;
	                }
	                Integer month2 = (calendarBegin.get(Calendar.MONTH) + 1 + i) % 12;
	                if (month2 < 10) {
	                    months[i] = year + "0" + month2;
	                } else {
	                    months[i] = year + "" + month2;
	                }
	            }
	            return months;
	        }
	    }
	    public static String[] getYear(Date dateBegin, Date dateEnd){
	    	Calendar calendarBegin = Calendar.getInstance();
	        Calendar calendarEnd = Calendar.getInstance();
	        calendarBegin.setTime(dateBegin);
	        calendarEnd.setTime(dateEnd);
	        String[] years;
	        
	        //假如年份相同
	        if (calendarBegin.get(Calendar.YEAR) == calendarEnd.get(Calendar.YEAR)) {
	        	years = new String[1];
	        	years[0] = calendarBegin.get(Calendar.YEAR)+"";
	        }else{
	        	int yearDiffer = calendarEnd.get(Calendar.YEAR) - calendarBegin.get(Calendar.YEAR);
	        	years = new String[yearDiffer+1];
	        	for(int i = 0 ;i < years.length ; i++){
	        		years[i] = (calendarBegin.get(Calendar.YEAR)+i)+"";
	        	}
	        }
	        return years;
	    }
	 
	    public static String byte2String(byte[] serialValue) {
			if(serialValue==null){
				return new String("");
			}
	        try {
				return new String(serialValue,"UTF-8");
			} catch (UnsupportedEncodingException e) {
				return new String("");
			}
	    }
		
		public static byte[] string2byteArr(String serialString){
			try {
				return serialString.getBytes("UTF-8");
			} catch (UnsupportedEncodingException e) {
				return serialString.getBytes();
			}
		}
}
