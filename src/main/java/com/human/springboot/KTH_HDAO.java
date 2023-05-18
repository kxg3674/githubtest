package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface KTH_HDAO {
	// members 회원가입 및 로그인
	// 회원가입
	void member_Insert(String m1,String m2,String m3,String m4,String m5,String m6);
	// 아이디 유효성 검사
	int member_idCheck(String a1);
	// 비밀번호 유효성 검사
	int member_nickCheck(String a1);
	// 로그인
	String member_login(String l1, String l2);
	
	
	
//	mypage
		// mypage 입력값 불러오기
	ArrayList<KTH_HDTO> myPage(String myPage1 );
		//  mypage 닉네임 중복확인
	int myPage_NickCheck(String m1);
	void myPage_Update(String nickname, String pw,String mobile,String email,String member_id);
	void member_Delete(String d1);
	

// adnin products
	void productInsert(int category, String pname,int price,String maker,
			String ex, String ex_de,int stock);
	void admin_products_img(String ms, String iurl);
	ArrayList<KTH_HDTO> productList();
	
	int getproduct_id(String get1);
	// product 업데이트
	void product_update(int category1,
			String product_name2,
			int product_price3,
			String product_maker4,
			String product_ex5,
			String product_ex_d6,
			int product_id7,
			int stock);
	//product delete
	void productDelete(int product_id);
	
	// main, sub_img 저장
	void getUrlMain(int product_id,int mainnum,String main_img);
	void getUrlSub(int product_id,int subnum,String sub_img);
	
	// img update
	void img_update_main(int product_id1, String imgurl);
	void img_update_sub(int product_id,int subnum2, String imgurl3);
	
	// img delete 
	void imgDelete(int product_id);
	
	// img 불러오기 hidden
	ArrayList<KTH_HDTO> imgList(int product_id);
	
	
	//category
	void categoryInsert(int category_id,String category_name);
	void categoryDelete(int category_id);
	
	//categorylist
	ArrayList<KTH_HDTO> categoryList();
	
	
	void test_img(int a1,String a3);
	
	
}