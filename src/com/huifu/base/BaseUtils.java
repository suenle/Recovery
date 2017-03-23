package com.huifu.base;

import java.math.BigDecimal;

public class BaseUtils {
	/**
	 * 进位法取整数（注：整除不进位）
	 * 参数1：被除数； 参数2：除数； 返回整型商
	 */
	public static Integer getFloorDev(Integer iDevidend, Integer iDevisor)
	{
		if(0 == iDevisor)
		{
			return 0;
		}
		Integer retInt = 0;
		Integer modInt = 0;
		retInt = iDevidend / iDevisor;
		modInt = iDevidend % iDevisor;
		if(0 != modInt)
		{
			retInt ++;
		}
		
		return retInt;
	}
	
	/*****************【double类型加减乘除四则运算-精度丢失问题解决方案】******************/
	/** 
     * double 相加 
     * @param d1 
     * @param d2 
     * @return 
     */ 
    public static double add(double d1,double d2){ 
        BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(Double.toString(d2)); 
        return bd1.add(bd2).doubleValue(); 
    }

    /** 
     * double 相减 
     * @param d1 
     * @param d2 
     * @return 
     */ 
    public static double sub(double d1,double d2){ 

    	BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(Double.toString(d2)); 
        return bd1.subtract(bd2).doubleValue(); 
  
    }

    /** 
     * double 乘法 
     * @param d1 
     * @param d2 
     * @return 
     */ 
    public static double mul(double d1,double d2){ 
        BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(Double.toString(d2)); 
        return bd1.multiply(bd2).doubleValue(); 
    }

    /** 
     * double 除法 
     * @param d1 
     * @param d2 
     * @param scale 四舍五入 小数点位数 
     * @return 
     */ 
    public static double div(double d1,double d2,int scale){ 
        //  当然在此之前，你要判断分母是否为0，    
        //  为0你可以根据实际需求做相应的处理 

        BigDecimal bd1 = new BigDecimal(Double.toString(d1)); 
        BigDecimal bd2 = new BigDecimal(Double.toString(d2)); 
        return bd1.divide  
               (bd2,scale,BigDecimal.ROUND_HALF_UP).doubleValue(); 
    }
    
    
  //以下是防止精度丢失的方法  bysu----------------------------------------------------------------------------------------------------------------
  	/**
  	 * 加
  	 */
  	 public static double doubleadd(double v1,double v2)         
  	   {         
  	        BigDecimal b1 = new BigDecimal(Double.toString(v1));         
  	        BigDecimal b2 = new BigDecimal(Double.toString(v2));         
  	        return b1.add(b2).doubleValue();         
  	        }   
  	   /**
  	    * 减
  	    */
  	   public static double doublesub(double v1,double v2)         
  	   {         
  	        BigDecimal b1 = new BigDecimal(Double.toString(v1));         
  	        BigDecimal b2 = new BigDecimal(Double.toString(v2));         
  	        return b1.subtract(b2).doubleValue();         
  	  
  	     }  
  /**
   * 除	   
   */
        public static double doublediv(double v1,double v2,int scale)         
  	   {         
  	    if(scale<0)         
  	     {         
  	     throw new IllegalArgumentException("The scale must be a positive integer or zero");         
  	       }         
  	         BigDecimal b1 = new BigDecimal(Double.toString(v1));         
  	         BigDecimal b2 = new BigDecimal(Double.toString(v2));         
  	         return b1.divide(b2,scale,BigDecimal.ROUND_HALF_UP).doubleValue();         
  	      }
  /**
   * 比较大小
   */
  	   public static int doublecompare(double v1,double v2){
  		    BigDecimal b1 = new BigDecimal(v1); 
  		    BigDecimal b2 = new BigDecimal(v2); 
  		    return b1.compareTo(b2); 
  		   }
  	 //以上是防止精度丢失的方法----------------------------------------------------------------------------------------------------------------
}
