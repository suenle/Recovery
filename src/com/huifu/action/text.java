package com.huifu.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class text {


	public static void main(String[] args) {
		Date d = new Date();//生成当前日期
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(format.format(d));
		
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -7); //得到前一天
		Date date = calendar.getTime();
		System.out.println(format.format(date));
		

		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("1", 1);
		map.put("2", 1);
		map.put("3", 1);
		map.put("4", 1);
		map.put("5", 1);
		map.put("133", 1);
		map.put("233", 1);
		map.put("13", 1);
		map.put("23", 1);
		map.put("166", 1);
		map.put("23", 1);
		
	    System.out.println(map.keySet());	
	    System.out.println(map.size());
		
		
		/*
		SimpleDateFormat sdf = new SimpleDateFormat("E");
		String week = sdf.format(d);
		System.out.println(getWeekOfDate(d));*/
	}

	
	public static String getWeekOfDate(Date date) {      
	    String[] weekOfDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};        
	    Calendar calendar = Calendar.getInstance();      
	    if(date != null){        
	         calendar.setTime(date);      
	    }        
	    int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;      
	    if (w < 0){        
	        w = 0;      
	    }      
	    return weekOfDays[w];    
	}
	
}
