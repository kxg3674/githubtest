package com.human.springboot;

import lombok.Data;

@Data
public class KTH_HDTO {

	String LOGIN_ID;
	String MEMBER_NAME;
	String NICKNAME;
	String LOGIN_PW;
	String MOBILE;
	String EMAIL;
	String MEMBER_CREATED;
	String MEMBER_UPDATED;
	
	
	// admin page products
	int product_id;
	int category_id;
	String product_name;
	int price;
	String maker;
	String product_info;
	String product_info_detail;
	String product_created;
	String product_updated;
	int view_count;
	int stock;
	int product_state;
	
	//products_img
	String use;
	String url;
	String product_image_created;
	String product_image_updated;
	
	//category
//	int category_id;
	String category_name;
}
