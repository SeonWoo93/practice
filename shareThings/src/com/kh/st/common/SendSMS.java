package com.kh.st.common;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class SendSMS {
	
  public void send(String phone, String parentBtitle, String type) {
    String api_key = "NCSQMQQGEJNHGZOC";
    String api_secret = "QQPSTY9TVHJTJQ5GSVSL4ONOH8IBCNTK";
    Message coolsms = new Message(api_key, api_secret);

    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", phone);
    params.put("from", "01038578956");
    params.put("type", "SMS");
    String msg = "";
    if(parentBtitle.length() > 10) {
    	msg = parentBtitle.substring(0, 10) + "..";
    }else {
    	msg = parentBtitle;
    }
    params.put("text", "[쉐어띵스]나의 등록물품 \"" + msg + "\"에 새로운" + type + "가 등록되었습니다.");
    params.put("app_version", "test app 1.2"); // application name and version

    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
    
    
    // Optional parameters for your own needs
    HashMap<String, String> status = new HashMap<String, String>();
    // params.put("count", "1"); // 기본값 1이며 1개의 최신 레코드를 받을 수 있음. 10입력시 10분동안의 레코드 목록을 리턴
    // params.put("unit", "minute"); // minute(default), hour, day 중 하나 해당 단위의 평균
    // params.put("date", "20161016230000"); // 데이터를 읽어오는 기준 시각 
    // params.put("channel", "1"); // 1 : 1건 발송채널(default), 2 : 대량 발송 채널

    try {
      JSONObject obj = (JSONObject) coolsms.getStatus(status);
      System.out.println("잔여 금액 : " + obj.toString());
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
    }
  }
  
  
  public void sendCode(String phone, int code) {
	    String api_key = "NCSQMQQGEJNHGZOC";
	    String api_secret = "QQPSTY9TVHJTJQ5GSVSL4ONOH8IBCNTK";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);
	    params.put("from", "01038578956");
	    params.put("type", "SMS");
	    String msg = "";
	    params.put("text", "[쉐어띵스] 인증번호 " + code);
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	    
	    // Optional parameters for your own needs
	    HashMap<String, String> status = new HashMap<String, String>();
	    // params.put("count", "1"); // 기본값 1이며 1개의 최신 레코드를 받을 수 있음. 10입력시 10분동안의 레코드 목록을 리턴
	    // params.put("unit", "minute"); // minute(default), hour, day 중 하나 해당 단위의 평균
	    // params.put("date", "20161016230000"); // 데이터를 읽어오는 기준 시각 
	    // params.put("channel", "1"); // 1 : 1건 발송채널(default), 2 : 대량 발송 채널

	    try {
	      JSONObject obj = (JSONObject) coolsms.getStatus(status);
	      System.out.println("잔여 금액 : " + obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	  }
  
  
  
  
  
  
  
  
  
  
}