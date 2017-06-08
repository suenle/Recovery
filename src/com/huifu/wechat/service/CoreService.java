package com.huifu.wechat.service;


import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.huifu.constant.Constant;
import com.huifu.wechat.pojo.TextMessage;
import com.huifu.wechat.util.MessageUtil;


public class CoreService {
	/** 
     * 处理微信发来的请求 
     *  
     * @param request 
     * @return 
     */  
    public static String processRequest(HttpServletRequest request) {  
        String respMessage = null;  
        try {  
            // 默认返回的文本消息内容  
            String respContent = "请求处理异常，请稍候尝试！";  
  
            // xml请求解析  
            Map<String, String> requestMap = MessageUtil.parseXml(request);  
  
            // 发送方帐号（open_id）  
            String fromUserName = requestMap.get("FromUserName");  
            // 公众帐号  
            String toUserName = requestMap.get("ToUserName");  
            // 消息类型  
            String msgType = requestMap.get("MsgType");  
  
            // 回复文本消息  
            TextMessage textMessage = new TextMessage();  
            textMessage.setToUserName(fromUserName);  
            textMessage.setFromUserName(toUserName);  
            textMessage.setCreateTime(new Date().getTime());  
            textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);  
            textMessage.setFuncFlag(0);  
  
            // 文本消息  
            if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {  
                respContent = "谢谢留言！";  
            }  
            // 图片消息  
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {  
                respContent = "谢谢留言！";  
            }  
            // 地理位置消息  
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {  
                respContent = "谢谢留言！";  
            }  
            // 链接消息  
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {  
                respContent = "谢谢留言！";  
            }  
            // 音频消息  
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {  
                respContent = "谢谢留言！";  
            }  
            // 事件推送  
            else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {  
                // 事件类型  
                String eventType = requestMap.get("Event");  
                // 订阅  
                if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {  
                    respContent = "谢谢您的关注！";  
                }  
                // 取消订阅  
                else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {  
                    // TODO 取消订阅后用户再收不到公众号发送的消息，因此不需要回复消息  
                }  
                // 自定义菜单点击事件  
                else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {  
                    // 事件KEY值，与创建自定义菜单时指定的KEY值对应  
                    String eventKey = requestMap.get("EventKey");  
  
                    if (eventKey.equals("12")) {  
                        respContent = "此功能即将上线！";  
                    } else if (eventKey.equals("21")) {  
                        respContent = "点击<a href='"+Constant.WECHAT_CX+"'>百度云下载</a>晨兴信息，分享密码为："+Constant.WECHAT_CX_PASSWORD+"!";  
                        		
                    } else if (eventKey.equals("22")) {  
                        respContent = "点击<a href='"+Constant.WECHAT_XP+"'>百度云下载</a>小排信息，分享密码为："+Constant.WECHAT_XP_PASSWORD+"";  
                    } else if (eventKey.equals("23")) {  
                        respContent = "点击<a href='"+Constant.WECHAT_QT+"'>百度云下载</a>属灵书报，分享密码为："+Constant.WECHAT_QT_PASSWORD+"";  
                    } else if (eventKey.equals("32")) {  
                        respContent = "http://www.churchinnanjing.org/appuser/goToChinesePage.do#footer";  
                    } else if (eventKey.equals("33")) {  
                        respContent = "此功能即将上线！";  
                    }  
                }  
            }  
  
            textMessage.setContent(respContent);  
            respMessage = MessageUtil.textMessageToXml(textMessage);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
        return respMessage;  
    }  
}  
