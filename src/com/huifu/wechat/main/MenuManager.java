package com.huifu.wechat.main;

import com.huifu.constant.Constant;
import com.huifu.wechat.pojo.AccessToken;
import com.huifu.wechat.pojo.Button;
import com.huifu.wechat.pojo.CommonButton;
import com.huifu.wechat.pojo.ComplexButton;
import com.huifu.wechat.pojo.Menu;
import com.huifu.wechat.pojo.ViewButton;
import com.huifu.wechat.util.WeixinUtil;
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * 
 * 菜单实现类
 * 
 * @author suenle
 * 
 */
public class MenuManager {
	private static Logger log = LoggerFactory.getLogger(MenuManager.class);

	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = Constant.WECHAT_APPID;
		// 第三方用户唯一凭证密钥
		String appSecret = Constant.WECHAT_SECRET;

		// 调用接口获取access_token
		AccessToken at = WeixinUtil.getAccessToken(appId, appSecret);

		if (null != at) {
			// 调用接口创建菜单
			int result = WeixinUtil.createMenu(getMenu(), at.getToken());

			// 判断菜单创建结果
			if (0 == result) {
				log.info("OK");
			} else {
				log.info("NO" + result);

			}
		}
	}

	/**
	 * 组装菜单数据
	 * 
	 * @return
	 */
	private static Menu getMenu() {
		ViewButton btn11 = new ViewButton();
		btn11.setName("神人生活操练");
		btn11.setType("view");
		btn11.setUrl("https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxd3b4d1cab699520c&redirect_uri=http%3a%2f%2fwww.suenle.cn%2fRecovery%2fUser%2fweChatLogin.do&response_type=code&scope=snsapi_userinfo&state=STATE&connect_redirect=1#wechat_redirect");
		CommonButton btn12 = new CommonButton();
		btn12.setName("其他操练");
		btn12.setType("click");
		btn12.setKey("12");
		CommonButton btn21 = new CommonButton();
		btn21.setName("晨兴圣言");
		btn21.setType("click");
		btn21.setKey("21");
		CommonButton btn22 = new CommonButton();
		btn22.setName("真理课程");
		btn22.setType("click");
		btn22.setKey("22");
		CommonButton btn23 = new CommonButton();
		btn23.setName("属灵书报");
		btn23.setType("click");
		btn23.setKey("23");

		ViewButton btn31 = new ViewButton();
		btn31.setName("召会网站");
		btn31.setType("view");
		btn31.setUrl("http://www.churchinnanjing.org/appuser/homepage_welcome");
		ViewButton btn32 = new ViewButton();
		btn32.setName("关于我们");
		btn32.setType("view");
		btn32.setUrl("http://www.churchinnanjing.org/appuser/goToChinesePage.do#footer");
		CommonButton btn33 = new CommonButton();
		btn33.setName("需要代祷");
		btn33.setType("click");
		btn33.setKey("33");

		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("生活操练");
		mainBtn1.setSub_button(new Button[] { btn11, btn12 });

		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("资料下载");
		mainBtn2.setSub_button(new Button[] { btn21, btn22, btn23 });

		ComplexButton mainBtn3 = new ComplexButton();
		mainBtn3.setName("联系我们");
		mainBtn3.setSub_button(new Button[] { btn31, btn32, btn33 });

		/**
		 * 这是公众号xiaoqrobot目前的菜单结构，每个一级菜单都有二级菜单项<br>
		 * 
		 * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br>
		 * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br>
		 * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 });
		 */
		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });

		return menu;
	}
}
