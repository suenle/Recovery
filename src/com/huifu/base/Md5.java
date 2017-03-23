package com.huifu.base;

import java.security.*;

/**
 * <p>Md5摘要算法</p>
 * @author lm
 * @version
 * <p>2015/05/14  First Release</p>
 */
public class Md5
{
  private static String ALGORITHM_NAME = "Md5";

  /**
   * <p>获取信息数据的Md5摘要</p>
   * @param info 信息数据
   * @return byte[] 信息数据的Md5摘要，8字节，失败返回 null
   */
  public static byte[] getDigest(byte[] info)
  {
    byte[] byteArrRet = null;
    try
    {
      MessageDigest algorithm = MessageDigest.getInstance(ALGORITHM_NAME);
      byte[] byteArrTemp = algorithm.digest(info);
      // 返回8个就够了
      byteArrRet = new byte[8];
      System.arraycopy(byteArrTemp, 0, byteArrRet, 0, 8);
    }
    catch (NoSuchAlgorithmException e)
    {
    }
    return byteArrRet;
  }

  /**
   * @param info1Digest 第一个信息数据的Md5摘要
   * @param info2 第二个信息数据
   * @return boolean 两个信息数据是否相等
   */
  public static boolean isEqualInfo(byte[] info1Digest, byte[] info2)
  {
    boolean bret = false;
    try
    {
      MessageDigest algorithm = MessageDigest.getInstance(ALGORITHM_NAME);
      bret = algorithm.isEqual(info1Digest, algorithm.digest(info2));
    }
    catch (NoSuchAlgorithmException e)
    {
    }
    return bret;
  }

}

