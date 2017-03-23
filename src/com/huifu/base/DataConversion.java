package com.huifu.base;

import java.util.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 * 数据转换工具类
 */
public class DataConversion {
	  /**
	   * <p>字符串转换为整数</p>
	   * @param str String 字符串
	   * @param iDef int 如果转换失败，缺省的整数返回值
	   * @return int 转换后的整数
	   */
	  public static int str2Int(String str, int iDef)
	  {
	    int iRet = iDef;
	    try
	    {
	      iRet = Integer.valueOf(str, 10).intValue();
	    }
	    catch (Exception e)
	    {
	    }
	    return iRet;
	  }

	  /**
	   * <p>字符型转换为浮点型</p>
	   * @param str 字符串
	   * @param fDefault 缺省值
	   * @return float 转换后的浮点型值，如果转换失败返回缺省值
	   */
	  public static float str2Float(String str, float fDefault)
	  {
	    float fRet = fDefault;
	    try
	    {
	      if (str != null)
	        fRet = new Float(str).floatValue();
	    }
	    catch (Exception e)
	    {
	    }
	    return fRet;
	  }

	  /**
	   * <p>字符型转换为双精度型</p>
	   * @param str 字符串
	   * @param dDefault 缺省值
	   * @return Double 转换后的浮点型值，如果转换失败返回缺省值
	   */
	  public static Double str2AmountDouble(String str, double dDefault)
	  {
	    DecimalFormat format = new DecimalFormat("0.00");
	    Double dRet = null;
	    try
	    {
	      if (str != null)
	      {
	          dRet = Double.valueOf(str);
	          dRet = Double.valueOf(format.format(dRet.doubleValue()));
	      }
	    }
	    catch (Exception e)
	    {
	        dRet = null;
	    }
	    
	    if (null == dRet)
	    {
	        dRet = Double.valueOf(format.format(dDefault));
	    }
	    
	    return dRet;
	  }
	  
	  /**
	   * <p>分割字符串</p>
	   * @param  strWhole String 待分割的字符串
	   * @param  chSep char   分割字符
	   * @return Object[] 分割后的Object对象数组（实际是字符串数组）
	   */
	  public static Object[] separate(String strWhole, char chSep)
	  {
	    // 初始数组列表容量为16，以免每次add时重新分配空间，浪费时间
	    ArrayList arrList = new ArrayList(16);

	    int nlen = strWhole.length();
	    int i = 0, iprev = 0;
	    for (; i < nlen; i++)
	    {
	      if (strWhole.charAt(i) == chSep)
	      {
	        // 此处去掉首尾的空格
	        arrList.add(strWhole.substring(iprev, i).trim());
	        iprev = i + 1;
	      }
	    }
	    // 取末尾的字符串
	    arrList.add(strWhole.substring(iprev, i).trim());

	    return arrList.toArray();
	  }


	  /**
	   * <p>无符号BYTE转换为整形数</p>
	   * @param btVal BYTE值
	   * @return int 整形数
	   */
	  public static int unsignedByte2Int(byte btVal)
	  {
	    int iRet;
	    if (btVal >= 0)
	      iRet = btVal;
	    else
	      iRet = 256 + btVal;
	    return iRet;
	  }

	  /**
	   * <p>整形转换为BYTE数组</p>
	   * @param iVal 整形数
	   * @param byteArr BYTE数组
	   * @param startPos 数组起始位置
	   */
	  public static void int2ByteArr(int iVal, byte[] byteArr, int startPos)
	  {
	    byteArr[startPos] = (byte) (iVal / (256 * 256 * 256));
	    byteArr[startPos + 1] = (byte) (iVal % (256 * 256 * 256) / (256 * 256));
	    byteArr[startPos + 2] = (byte) (iVal % (256 * 256) / 256);
	    byteArr[startPos + 3] = (byte) (iVal % 256);
	  }

	  /**
	   * <p>得到短整形的数的byte数组表示<p>
	   * @param sValue 短整形数
	   * @return byte[] 长度为2的byte数组
	   */
	  public static byte[] short2ByteArr(short sValue)
	  {
	    byte[] byteArr = new byte[2];
	    byteArr[0] = (byte) (sValue / 256);
	    byteArr[1] = (byte) (sValue % 256);

	    return byteArr;
	  }

	  /**
	   * <p>短整形转换为BYTE数组</p>
	   * @param sVal 短整形数
	   * @param byteArr BYTE数组
	   * @param startPos 数组起始位置
	   */
	  public static void short2ByteArr(short sVal, byte[] byteArr, int startPos)
	  {
	    byteArr[startPos] = (byte) (sVal / 256);
	    byteArr[startPos + 1] = (byte) (sVal % 256);
	  }


	  /**
	   * <p>BYTE数组转换为整形</p>
	   * @param byteArr BYTE数组
	   * @param startPos 数组起始位置
	   * @return int 整形数
	   */
	  public static int byteArr2Int(byte[] byteArr, int startPos)
	  {
	    short shortHi = byteArr2Short(byteArr, startPos);
	    short shortLo = byteArr2Short(byteArr, startPos + 2);
	    int iRet = shortHi * 256 * 256 + shortLo;
	    return iRet;
	  }

	  /**
	   * <p>BYTE数组转换为整形</p>
	   * @param byteArr BYTE数组
	   * @return int 整形数
	   */
	  public static int byteArr2Int(byte[] byteArr)
	  {
	    return byteArr2Int(byteArr, 0);
	  }

	  /**
	   * <p>BYTE数组转换为短整形</p>
	   * @param byteArr BYTE数组
	   * @return short 短整形数
	   */
	  public static short byteArr2Short(byte[] byteArr)
	  {
	    short sRet = (short) (byteArr[0] * 256 + byteArr[1]);
	    return sRet;
	  }

	  /**
	   * <p>BYTE数组转换为短整形</p>
	   * @param byteArr BYTE数组
	   * @param startPos 数组起始位置
	   * @return short 短整形数
	   */
	  public static short byteArr2Short(byte[] byteArr, int startPos)
	  {
	    short sRet = (short) (unsignedByte2Int(byteArr[startPos]) * 256 + unsignedByte2Int(byteArr[startPos + 1]));
	    return sRet;
	  }


	  /**
	   * <p>十六进制字符串转二进制数据</p>
	   * @param strHex 待转换的字符串
	   * @return byte[] 返回转换后的byte数组，如果失败返回null
	   */
	  public static byte[] hex2Byte(String strHex)
	  {
	    return CryptoUtils.toBytesBlock(strHex);
	  }

	  /**
	   * <p>十六进制字符串转二进制数据</p>
	   * @param strHex 待转换的字符串
	   * @param byteArrDest 目标数组
	   * @param iDestPos 目标数组起始位置
	   * @return int 转换的字节数，失败返回-1
	   */
	  public static int hex2Byte(String strHex, byte[] byteArrDest, int iDestPos)
	  {
	    int iRet = -1;

	    byte[] byteArr = hex2Byte(strHex);
	    if (byteArr != null && byteArr.length > 0 && byteArr.length <= byteArrDest.length - iDestPos)
	    {
	      System.arraycopy(byteArr, 0, byteArrDest, iDestPos, byteArr.length);
	      iRet = byteArr.length;
	    }

	    return iRet;
	  }

	  /**
	   * <p>得到以字符ch后缀的字符串</p>
	   * @param str 原始字符串
	   * @param ch 后缀字符
	   * @param nWantLength 希望的字符串长度
	   * @return String 长度为nWantLength的字符串，不足长度的后补字符ch
	   */
	  public static String getSuffixStr(String str, char ch, int nWantLength)
	  {
	    if (str == null)
	      str = "";

	    if (str.length() >= nWantLength)
	      return str;

	    StringBuffer strbuf = new StringBuffer(nWantLength);
	    strbuf.append(str);
	    while (strbuf.length() < nWantLength)
	      strbuf.append(ch);
	    return strbuf.toString();
	  }

	  /**
	   * <p>字符串转换为BYTE数组</p>
	   * @param byteArrDest 目标BYTE数组
	   * @param iDestPos 数组起始位置
	   * @param str 字符串
	   * @param iWantedLen 希望的长度
	   * <pre>不足iWantedLen长度时：
	   *  strFormat = "-A"    前补A
	   *  strFormat = "A"     后补A
	   *  strFormat = null    后补空格
	   * </pre>
	   */
	  public static void str2ByteArr(byte[] byteArrDest, int iDestPos, String str, int iWantedLen, String strFormat)
	  {
	    String strFixedLen = str;

	    if (strFormat != null && strFormat.length() > 0)
	    {
	      if (strFormat.length() == 2 && strFormat.charAt(0) == '-')
	        strFixedLen = DataConversion.getPrefixStr(str, strFormat.charAt(1), iWantedLen);
	      else
	        strFixedLen = DataConversion.getSuffixStr(str, strFormat.charAt(0), iWantedLen);
	    }
	    else
	    {
	      strFixedLen = DataConversion.getSuffixStr(str, ' ', iWantedLen);
	    }

	    System.arraycopy(strFixedLen.getBytes(), 0, byteArrDest, iDestPos, iWantedLen);
	  }


	  /**
	   * <p>得到以字符ch前缀的字符串</p>
	   * @param str 原始字符串
	   * @param ch 前缀字符
	   * @param nWantLength 希望的字符串长度
	   * @return String 长度为nWantLength的字符串，不足长度的前补字符ch
	   */
	  public static String getPrefixStr(String str, char ch, int nWantLength)
	  {
	    if (str == null)
	      str = "";

	    int strlen = str.length();
	    if (strlen >= nWantLength)
	      return str;

	    StringBuffer strbuf = new StringBuffer(nWantLength);
	    while (strbuf.length() < nWantLength-strlen)
	      strbuf.append(ch);
	    strbuf.append(str);
	    return strbuf.toString();
	  }

	  /**
	   * <p>格式化二进制数据为十六进制和ASCII字符串表现形式</p>
	   * @param byteArr 二进制数据的BYTE数组
	   * @return String 格式化后的字符串
	   */
	  public static String formatBinaryData(byte[] byteArr, int len)
	  {
	    int COLPERROW = 16;
	    StringBuffer strRet = new StringBuffer(len*6);
	    int iLen = len <= 0 ? byteArr.length : len;

	    for (int iRow = 0; iRow * COLPERROW < iLen; iRow++)
	    {
	      strRet.append(DataConversion.getPrefixStr(new Integer(iRow * COLPERROW).toString(), '0', 4) + "  ");

	      int iCol;
	      for (iCol = 0; iCol < COLPERROW && iRow * COLPERROW + iCol < iLen; iCol++)
	      {
	        byte bytetmp = byteArr[iRow * COLPERROW + iCol];
	        strRet.append(" ");
	        strRet.append(CryptoUtils.hex_asc_tab[ ( bytetmp >>> 4) & 0x0f ]);
	        strRet.append(CryptoUtils.hex_asc_tab[ ( bytetmp      ) & 0x0f ]);
	      }
	      for (; iCol < COLPERROW; iCol++)
	        strRet.append("   ");

	      strRet.append("\t");
	      for (iCol = 0; iCol < COLPERROW && iRow * COLPERROW + iCol < iLen; iCol++)
	      {
	        if (!Character.isISOControl((char) byteArr[iRow * COLPERROW + iCol]))
	          strRet.append((char)byteArr[iRow * COLPERROW + iCol]);
	        else
	          strRet.append("*");
	      }

	      strRet.append("\r\n");
	    }

	    return strRet.toString();
	  }


	  /**
	   * <p>二进制数据转十六进制字符串</p>
	   * @param byteArr 待转换的byte数组
	   * @return String 返回转换后的大写字符串
	   */
	  public static String byte2Hex(byte[] byteArr)
	  {
	    return CryptoUtils.toStringBlock(byteArr);
	  }


	  /**
	   * <p>格式化货币值字符串为 Px.2 格式</p>
	   * @param strVal
	   * @return String 格式化后的字符串
	   */
	  public static String FormatMoneyVal(String strVal)
	  {
	    String strRet = strVal;
	    try
	    {
	      double dbVal = new Double(strVal).doubleValue();
	      NumberFormat nf = NumberFormat.getInstance();
	      nf.setMinimumFractionDigits(2);
	      nf.setMaximumFractionDigits(2);
	      nf.setGroupingUsed(false);
	      strRet = nf.format(dbVal);
	    }
	    catch (Exception e)
	    {
	    }
	    return strRet;
	  }

	  /**
	   * <p>把从数据库中读出的中文字符串转换为国标编码</p>
	   * @param str 字符串
	   * @param strGBName 中文国标编码名
	   * @return String 编码转换后的字符串
	   */
	  public static String convertFromChinese(String str, String strGBName)
	  {
	    try
	    {
	      return new String(str.getBytes(), strGBName);
	    }
	    catch (Exception e)
	    {
	    }
	    return str;
	  }


	  /**
	   * <p>得到以字符'0'前缀的字符串</p>
	   * @param str 原始字符串
	   * @param nWantLength 希望的字符串长度
	   * @return String 长度为nWantLength的字符串，不足长度的前补字符'0'
	   */
	  public static String getZeroPrefixStr(String str, int nWantLength)
	  {
	    return getPrefixStr(str, '0', nWantLength);
	  }

	  /**
	   * <p>得到两个值异或运算后的结果</p>
	   * @param hexstr1 参与异或运算的十六进制字符串1
	   * @param hexstr2 参与异或运算的十六进制字符串2
	   * @return String 异或运算结果的十六进制字符串，失败返回null
	   */
	  public static String xor(String hexstr1, String hexstr2)
	  {
	    String hexstrRet = "";
	    byte[] byteArr1 = hex2Byte(hexstr1);
	    byte[] byteArr2 = hex2Byte(hexstr2);

	    if (byteArr1 != null && byteArr2 != null && byteArr1.length == byteArr2.length)
	    {
	      for (int i=0; i<byteArr1.length; i++)
	      {
	        hexstrRet += getZeroPrefixStr(Integer.toHexString((byteArr1[i]^byteArr2[i]) & 0xFF), 2).toUpperCase();
	      }
	    }

	    return hexstrRet;
	  }

	  /**
	   * <p>格式化数值字符串为指定数位和精度的格式</p>
	   * @param strVal 数值字符串
	   * @param iIntegerDigitsNum  整数位数
	   * @param iFractionDigitsNum 小数位数
	   * @return String 格式化后的字符串
	   */
	  public static String formatNumVal(String strVal, int iIntegerDigitsNum, int iFractionDigitsNum)
	  {
	    String strRet = strVal;
	    try
	    {
	      double dbVal = new Double(strVal).doubleValue();
	      NumberFormat nf = NumberFormat.getInstance();
	      nf.setMinimumIntegerDigits(iIntegerDigitsNum);
	      nf.setMaximumIntegerDigits(iIntegerDigitsNum);
	      nf.setMinimumFractionDigits(iFractionDigitsNum);
	      nf.setMaximumFractionDigits(iFractionDigitsNum);
	      nf.setGroupingUsed(false);
	      strRet = nf.format(dbVal);
	    }
	    catch (Exception e)
	    {
	    }
	    return strRet;
	  }

	  /**
	   * <p>删除字符串尾部的空格</p>
	   * @param str String 源字符串
	   * @return String 处理后的字符串
	   */
	  public static String trimRight(String str)
	  {
	    int i = str.length()-1;
	    for (; i>=0 && (str.charAt(i)==' ' || str.charAt(i) == '\r' || str.charAt(i) == '\n'); i--);
	    if (i < str.length() -1)
	      str = str.substring(0, i+1);
	    return str;
	  }
	  /**
	   * <p>删除字符串尾部的空格</p>
	   * @param str String 源字符串
	   * @return String 处理后的字符串
	   */
	  public static String listToString(List list)
	  {
		  
	   if(null==list) return "";
	   String str="";
	   int i=0;
	   for(Object s:list.toArray()){
		   if(i++==0)
		  str=(String)s;
		   else str=str+","+(String)s;
		   
	   }
	  
	    return str;
	  }

	  /**
	   * <p>转换为Unicode编码的十六进制字符串。（中文四个字符，英文两个字符）</p>
	   * @param str String 源字符串
	   * @return String Unicode编码的十六进制字符串。
	   */
	  public static String str2UnicodeHex(String str)
	  {
	    try
	    {
	      byte[] bytes = str.getBytes("UTF-16");
	      StringBuffer strRet = new StringBuffer(bytes.length);
	      for (int i=2; i+1<bytes.length; i+=2)
	      {
	        if (bytes[i] != 0)
	        {
	          strRet.append(CryptoUtils.hex_asc_tab[(bytes[i] >>> 4) & 0x0f]);
	          strRet.append(CryptoUtils.hex_asc_tab[(bytes[i]) & 0x0f]);
	        }
	        strRet.append(CryptoUtils.hex_asc_tab[(bytes[i+1] >>> 4) & 0x0f]);
	        strRet.append(CryptoUtils.hex_asc_tab[(bytes[i+1]) & 0x0f]);
	      }
	      return strRet.toString();
	    }
	    catch (Exception e)
	    {
	      return str;
	    }
	  }

	  /**
	   * <p>测试程序入口</p>
	   * @param args String[]
	   * @throws Exception
	   */
	  public static void main(String args[]) throws Exception
	  {
	    // 特色业务报文无法通过加密机验证，这里使用md5验证，加入运算因子
	    String strData2ValidateMac;
	    byte[] byteArrMd5Data;

	    strData2ValidateMac = "c=金碧一卡通ab";
	    //System.out.println(DataConversion.str2UnicodeHex(strData2ValidateMac));

	    strData2ValidateMac = "MsgType=Transaction&TransCode=0200_00000_010000&Pan=3568560000000035&CardType=12000&CardTypeBasic=12000&Track2=3568560000000035!3D10021010411149900000&Track3=994221889990000029!3D170210109126299000000003976999236000002070000000000000000000000!3D000000000000!3D0000000&BankNumOfCard=asdasd&PinBlock=7549626BC59731CC&TermNum=01000008&Amount=100&BmkIndex=-1&CardName=昆明农联社&BankNameOfCard=金碧一卡通&Mac=";
	    byteArrMd5Data = Md5.getDigest(DataConversion.hex2Byte(DataConversion.str2UnicodeHex(strData2ValidateMac)));
	    //System.out.println(DataConversion.byte2Hex(byteArrMd5Data));

	    strData2ValidateMac = "MsgType=Transaction&TransCode=0200_00000_010000&Pan=3568560000000035&CardType=12000&CardTypeBasic=12000&Track2=3568560000000035!3D10021010411149900000&Track3=994221889990000029!3D170210109126299000000003976999236000002070000000000000000000000!3D000000000000!3D0000000&BankNumOfCard=asdasd&PinBlock=7549626BC59731CC&TermNum=01000008&Amount=100&BmkIndex=-1&CardName=jcb&BankNameOfCard=123123&Mac=";
	    byteArrMd5Data = Md5.getDigest(DataConversion.hex2Byte(DataConversion.str2UnicodeHex(strData2ValidateMac)));
	    //System.out.println(DataConversion.byte2Hex(byteArrMd5Data));
	    byteArrMd5Data = Md5.getDigest(strData2ValidateMac.getBytes());
	    //System.out.println(DataConversion.byte2Hex(byteArrMd5Data));
	    
	    ArrayList al=new ArrayList();
	    al.add("123");
	    al.add("456");
	    al.add("789");
	    //System.out.println(listToString(al));
	   
	  }
}
