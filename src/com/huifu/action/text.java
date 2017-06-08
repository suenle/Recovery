package com.huifu.action;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
public class text {
	  private static HttpClient httpClient=new DefaultHttpClient();

	    //主登录入口
	    public static void loginDouban(){
	        String redir="https://cloud.blibao.com/server/account/shopperLogin.htm";    // 输入你登录成功后要跳转的网页
	        String login_src="https://cloud.blibao.com/server/module/shop/";
	        String form_email="winbox_test";    // 你的用户名
	        String form_password="123456";    // 你的密码
	      //  String captcha_id=getImgID();
	        String login="登录";
	        String captcha_solution="";

	        //构建参数
	        List<NameValuePair> list=new ArrayList<NameValuePair>();
	        list.add(new BasicNameValuePair("pbossid", null));
	        list.add(new BasicNameValuePair("pusername", null));
	        list.add(new BasicNameValuePair("who", "0"));
	        list.add(new BasicNameValuePair("bossid", null));
	        list.add(new BasicNameValuePair("username", form_email));
	        list.add(new BasicNameValuePair("password", form_password));
	        list.add(new BasicNameValuePair("captcha-id", null));
	        list.add(new BasicNameValuePair("backType", null));
	        //list.add(new BasicNameValuePair("login", login));
	        HttpPost httpPost = new HttpPost(login_src);
	        try {
	            httpPost.setEntity(new UrlEncodedFormEntity(list));
	            HttpResponse response=httpClient.execute(httpPost);
	            HttpEntity entity=response.getEntity();
	            String result=EntityUtils.toString(entity,"utf-8");

	            HttpGet httpGet=new HttpGet(redir);
	            HttpResponse response1=httpClient.execute(httpGet);
	            HttpEntity entity1=response1.getEntity();
	            String result1=EntityUtils.toString(entity1,"utf-8");
	            System.out.println(result1);

	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	   /* *//**
	     * 获取验证码图片“token”值
	     * @return token
	     *//*
	    private static String getImgID(){
	        String src="https://www.douban.com/j/misc/captcha";
	        HttpGet httpGet=new HttpGet(src);
	        String token="";
	        try {
	            HttpResponse response=httpClient.execute(httpGet);
	            HttpEntity entity=response.getEntity();
	            String content=EntityUtils.toString(entity,"utf-8");
	            Map<String,String> mapList=getResultList(content);
	            token=mapList.get("token");
	            String url="https:"+mapList.get("url");
	            downImg(url);
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	        return token;
	    }*/
	 /*   *//**
	     * 用JSON 把数据格式化，并生成迭代器，放入Map中返回
	     * @param content 请求验证码时服务器返回的数据
	     * @return Map集合
	     *//*
	    public static Map getResultList(String content){
	        Map maplist=new HashMap();

	        try {
	            JSONObject jo=new JSONObject(content);
	            Iterator it = jo.keys();
	            String key="";
	            String value="";
	            while(it.hasNext()){
	                key=(String) it.next();
	                if ("r".equals(key)) {
	                    value = jo.getBoolean(key) + "";
	                }else {
	                    value=jo.getString(key);
	                }
	                maplist.put(key, value);
	            }
	        } catch (JSONException e) {
	            e.printStackTrace();
	        }
	        return maplist;
	    }
	    *//**
	     * 此方法是下载验证码图片到本地
	     * @param src  给个验证图片完整的地址
	     *//*
	    private static void downImg(String src){
	        File fileDir=new File("D://爬虫测试/jackie");
	        if(!fileDir.exists()){
	            fileDir.mkdirs();
	        }
	        File file=new File("D://爬虫测试/jackie/jackie.png");
	        if(file.exists()){
	            file.delete();
	        }
	        InputStream input = null;
	        FileOutputStream out= null;
	        HttpGet httpGet=new HttpGet(src);
	        try {
	            HttpResponse response=httpClient.execute(httpGet);
	            HttpEntity entity = response.getEntity();
	            input = entity.getContent();
	            int i=-1;
	            byte[] byt=new byte[1024];
	            out=new FileOutputStream(file);
	            while((i=input.read(byt))!=-1){
	                out.write(byt);
	            }
	            System.out.println("图片下载成功！");
	        } catch (ClientProtocolException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
*/
	    public static void main(String[] args) {
	        loginDouban();
	    }
	}
