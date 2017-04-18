package com.huifu.action;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AreasGetRequest;
import com.taobao.api.response.AreasGetResponse;

public class text123 {
	public static void main(String[] args) throws ApiException {
		
		TaobaoClient client = new DefaultTaobaoClient("http://gw.api.taobao.com/router/rest", "23736667", "b86e6c76ca04a340da4a1844dbed04bf");
		AreasGetRequest req = new AreasGetRequest();
		req.setFields("255,1,北京市");
		AreasGetResponse rsp = client.execute(req);
		System.out.println(rsp.getBody());
		
	}

}
