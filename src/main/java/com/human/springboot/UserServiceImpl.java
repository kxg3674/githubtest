package com.human.springboot;

import java.util.HashMap;


public interface UserServiceImpl {
	String getAccessToken(String authorize_code);
	
	HashMap<String, Object> getUserInfo(String access_Token);
}
