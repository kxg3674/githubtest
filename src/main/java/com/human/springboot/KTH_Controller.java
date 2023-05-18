package com.human.springboot;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class KTH_Controller {
	@Autowired
	private KTH_HDAO hdao;
	@Autowired
	private UserServiceImpl us;
	
	ArrayList<String> imgUrlMain= new ArrayList();
	ArrayList<String> imgUrlSub= new ArrayList();
		
	@GetMapping("/login")
	public String login(HttpServletRequest req,Model model) {
	
	String memberid=req.getParameter("id");
	model.addAttribute("login",memberid);

		return "login";
	}
	@GetMapping("/NewFile")
	public String newfile() {
		return "NewFile";
	} 
	
	@PostMapping("/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req) {
		
		String logVal="ok";
		HttpSession login=req.getSession();
		String logid=req.getParameter("id");
		String password=req.getParameter("pw");
		System.out.println("Id"+logid);
		System.out.println("Pw"+password);
		String memid=hdao.member_login(logid, password);
		System.out.println("Check"+memid);
		try {
			if(memid!=(null) ) {
				login.setAttribute("logid", memid);
				login.setAttribute("nickname", memid);
			} else {
				System.out.println("id or pw check");
				logVal="fail";
			}
			
		} catch (Exception ex) {
			 printExceptionMsg("doMyPage_Check", ex.getMessage());
		} 

			
		
		
		
		return logVal;
	}
	@GetMapping("/signon")
	public String signon() {
		return "signon";
	}
	
	// 회원가입 페이지
	@PostMapping("/doSignon" )
	@ResponseBody
	public String doSignon(HttpServletRequest req) {
		String dosingval="ok";
		System.out.println("text");
		String member_id=req.getParameter("member_id");
		String humanname=req.getParameter("member_name");
		String nickname=req.getParameter("nickname");
		String password=req.getParameter("password");
		System.out.println("pass"+password);
		String repassword=req.getParameter("repassword");
		System.out.println("repas"+repassword);
		String mobile=req.getParameter("mobile");
		String email=req.getParameter("email");
		System.out.println("id"+member_id+"이름"+ humanname+ nickname+ password+ mobile+ email);
		System.out.println("why?"+!humanname.equals(""));
//		HttpSession login= req.getSession();
		
		try {
			if(!humanname.equals("") && !member_id.equals("") && 
					!nickname.equals("") && !password.equals("") && !mobile.equals("") &&
					!email.equals("")) {
				if(password.equals(repassword)) {
//					login.setAttribute("logid", member_id);
					hdao.member_Insert(member_id, humanname, nickname, password, mobile, email);
					System.out.println("insert ok");
				} else {
				dosingval="fail";
			}
			}
		} catch(Exception ex){
			 printExceptionMsg("doSignon", ex.getMessage());
			dosingval="fail";
			System.out.println("insert fail");
		}
		System.out.println(dosingval);
		return dosingval;
	}
	
	@GetMapping("/mypage")
	public String mypage(HttpServletRequest req,Model model) {
	

		return "mypage";
	}
	
	
	
	@PostMapping("/member_Delete")
	@ResponseBody
	public String memberDelete(HttpServletRequest req) {
		String mDeVal="ok";
		String MDelete=req.getParameter("logId");
		HttpSession SeDel= req.getSession();
		
		System.out.println(MDelete);
		System.out.println(SeDel.getAttribute("logid"));
		
		try {
			
			SeDel.invalidate() ;
			
			hdao.member_Delete(MDelete);
		} catch (Exception ex) {
			 printExceptionMsg("memberDelete", ex.getMessage());
			 mDeVal="fail";
		}

		System.out.println(mDeVal);		
		return mDeVal;
	}
	@GetMapping("/main")
	public String main(HttpServletRequest req,Model model) {
		HttpSession logIn=req.getSession();
		try {
			if(logIn.getAttribute("logid")==null) {
				model.addAttribute("logId","<a href='/login'>로그인</a>");
			} else {
			model.addAttribute("logId",logIn.getAttribute("logid"));
			model.addAttribute("logOut","<a href='/logout'>로그아웃</a>");
			model.addAttribute("mypage","<a href='/mypage'>mypage</a>");
			}	
		} catch (Exception ex) {
			 printExceptionMsg("memberDelete", ex.getMessage());
		}
		
		return "main";
	}
	@GetMapping("/logout")
	public String dologout(HttpServletRequest req) {
		HttpSession login=req.getSession();
				
		login.invalidate(); // 모든 세션정보를 remove all 해준다
		
		return "redirect:/main";
	}
	@GetMapping("/product")
	public String product() {
		return "product";
	}
	@PostMapping("/idCheck")
	@ResponseBody
	public String doIdCheck(HttpServletRequest req) {
		
		String idCheckVal="ok";
		int idCount=0;
		String a=req.getParameter("idCheck");
		System.out.println(a);
		idCount=hdao.member_idCheck(a);
		System.out.println(idCount);
		try {
		if(idCount==0) {
			System.out.println("사용가능한 아이디");
		} else {
			idCheckVal="fail";
			System.out.println("이미 사용중인 아이디");
		}
		} catch(Exception ex) {
			 printExceptionMsg("doCheck", ex.getMessage());
			
		}
		System.out.println("개수 확인="+idCount);
		return idCheckVal;
	}
	
	@PostMapping("/nickCheck")
	@ResponseBody
	public String doNickCheck(HttpServletRequest req) {
		
		String nickCheckVal="ok";
		int nickCount=0;
		String a=req.getParameter("nickCheck");
		System.out.println(a);
		nickCount=hdao.member_nickCheck(a);
		System.out.println(nickCheckVal);
		try {
		if(nickCount==0) {
			System.out.println("사용가능한 아이디");
		} else {
			nickCheckVal="fail";
			System.out.println("이미 사용중인 아이디");
		}
		} catch(Exception ex) {
			 printExceptionMsg("doCheck", ex.getMessage());
			
		}
		System.out.println("개수 확인="+nickCount);
		return nickCheckVal;
	}
	@GetMapping("/adminpage")
	public String doAdminPage() {
		
		return "adminpage";
	}
	private void printExceptionMsg(String methodName, String msg) {
		      System.out.println("Exception[" + methodName + "]: " + msg);
		   }
	
	
	//카테고리 추가
	// 김태현
	@PostMapping("/categoryinsert")
	@ResponseBody
	public String doCategoryInsert(HttpServletRequest req) {
		String categoryval="ok";
		int category_id=Integer.parseInt(req.getParameter("category_Id"));
		String category_name=req.getParameter("category_Name");
		System.out.println("category test");
		
		try {
			hdao.categoryInsert(category_id, category_name);
		} catch (Exception ex) {
			 printExceptionMsg("doCategoryInsert", ex.getMessage());
			 categoryval="fail";
		}
		
		
		return categoryval;
	}
	
	//카테고리 삭제 
	// 김태현
	@PostMapping("/categoryDelete")
	@ResponseBody
	public String doTypeDelete(HttpServletRequest req) {
		String categoryDeVal="ok";
		System.out.println(req.getParameter("타입삭제확인"));
	int category_Id=Integer.parseInt(req.getParameter("category_Id"));

	 try {
		 hdao.categoryDelete(category_Id);	 
	 } catch(Exception ex) {
		 printExceptionMsg("doCategoryInsert", ex.getMessage());
		 categoryDeVal="fail";
	 }
	 
		return categoryDeVal;
	}
	
	@PostMapping("/categoryList")
	@ResponseBody
	public String doCategoryList() {
		
		ArrayList<KTH_HDTO> list=hdao.categoryList();
		JSONArray ja= new JSONArray();
		
		for(int i=0;i<list.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("category_Id",list.get(i).getCategory_id());
			jo.put("category_Name",list.get(i).getCategory_name());

			ja.put(jo);
			
		}
		return ja.toString();
	}
	
	@PostMapping("/product_Insert")
	@ResponseBody
	public String doProduct_Insert(HttpServletRequest req) {
		String pInVal="ok";
		int category=Integer.parseInt(req.getParameter("category"));
		System.out.println("c="+category);
		String product_Name=req.getParameter("product_Name");
		System.out.println("name="+product_Name);
		int product_Price=Integer.parseInt(req.getParameter("product_Price"));
		System.out.println("price="+product_Price);
		String product_Maker=req.getParameter("product_Maker");
		System.out.println("ma="+product_Maker);
		String product_Ex=req.getParameter("product_Ex");
		System.out.println("ex="+product_Ex);
		String product_Ex_Detail=req.getParameter("product_Ex_Detail");
		System.out.println("ed="+product_Ex_Detail);
		int stock=Integer.parseInt(req.getParameter("stock"));
		
		 try {
			 hdao.productInsert(category, product_Name, product_Price, product_Maker, product_Ex, product_Ex_Detail,stock);
			
		 } catch(Exception ex) {
			 printExceptionMsg("doProduct_Insert", ex.getMessage());
			 pInVal="fail";
		 }
		return pInVal;
	}
	
	//상품 리스트 불러오기 
	@PostMapping("/productlist")
	@ResponseBody
	public String doProductlist() {
		
		
		ArrayList<KTH_HDTO> list=hdao.productList();
		
		JSONArray ja= new JSONArray();
		
		for(int i=0;i<list.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("product_Id",list.get(i).getProduct_id());
			jo.put("category_Name",list.get(i).getCategory_name());
			jo.put("product_Name",list.get(i).getProduct_name());
			jo.put("product_Price",list.get(i).getPrice());
			jo.put("product_Maker",list.get(i).getMaker());
			jo.put("product_Ex",list.get(i).getProduct_info());
			jo.put("product_Ex_Detail",list.get(i).getProduct_info_detail());
			jo.put("stock", list.get(i).getStock());
			

			ja.put(jo);
			
		}
		return ja.toString();
		
	}
	
	   @PostMapping("/main_Img")
	   @ResponseBody
	   public String main_Img(HttpServletRequest hsr, MultipartFile file) {
	      String img="ok";
	      
	  
	      
		   try {
	         String fileName = file.getOriginalFilename();
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String sub_url="/resources/img/" + fileName;
	         String folder = hsr.getServletContext().getRealPath("/");
	         System.out.println("?");
	         System.out.println(folder+sub_url);
	         file.transferTo(new File(folder+sub_url));
	         imgUrlMain.add(sub_url);
	        
//	         hdao.main_img(sub_url);
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         img="fail";
	      }
		   return img;
	   }
	   @PostMapping("/getId")
	   @ResponseBody
	   public int getID(HttpServletRequest req) {
		   System.out.println();
		   
		   String getname=req.getParameter("get_id");
		   int id=0;
		   try {
			   
			   System.out.println(getname);
			   hdao.getproduct_id(getname);
			   System.out.println("chekc id"+hdao.getproduct_id(getname));
			   
			   id=hdao.getproduct_id(getname);
		} catch (Exception ex) {
		     System.out.println(ex.getMessage());
		
		}
		   
		   
		   
		   
		   return id;
	   }
	   @PostMapping("/sub_Img1")
	   @ResponseBody
	   public String sub_Img1(HttpServletRequest hsr, MultipartFile file) {
	      String img="ok";
	      
		   try {
	         String fileName = file.getOriginalFilename();
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String sub_url="/resources/img/" + fileName;
	         String folder = hsr.getServletContext().getRealPath("/");
	         System.out.println("?");
	         System.out.println(folder+sub_url);
	         file.transferTo(new File(folder+sub_url));
	         imgUrlSub.add(sub_url);
	         
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         img="fail";
	      }
		   return img;
	   }
	   @PostMapping("/sub_Img2")
	   @ResponseBody
	   public String sub_Img2(HttpServletRequest hsr, MultipartFile file) {
	      String img="ok";
	      
		   try {
	         String fileName = file.getOriginalFilename();
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String sub_url="/resources/img/" + fileName;
	         String folder = hsr.getServletContext().getRealPath("/");
	         System.out.println("?");
	         System.out.println(folder+sub_url);
	         file.transferTo(new File(folder+sub_url));
	         imgUrlSub.add(sub_url);
	         
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         img="fail";
	      }
		   return img;
	   }
	   @PostMapping("/sub_Img3")
	   @ResponseBody
	   public String sub_Img3(HttpServletRequest hsr, MultipartFile file) {
	      String img="ok";
	      
		   try {
	         String fileName = file.getOriginalFilename();
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String sub_url="/resources/img/" + fileName;
	         String folder = hsr.getServletContext().getRealPath("/");
	         System.out.println("?");
	         System.out.println(folder+sub_url);
	         file.transferTo(new File(folder+sub_url));
	         imgUrlSub.add(sub_url);
	         
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         img="fail";
	      }
		   return img;
	   }
	   
	   
	   @PostMapping("/imgGetUrl")
	   @ResponseBody
	   public String imgGetUrl(HttpServletRequest req) {
		   String imgGetUrlVal="ok";
		   
		   int getId=Integer.parseInt(req.getParameter("getId"));
		   int subnumber=201;
		   int mainnumber=101;
		   try {
			   for(int i=0;i<imgUrlMain.size();i++) {
				   
				   System.out.println(imgUrlMain.get(i));
				   System.out.println("size"+imgUrlMain.size());
				   hdao.getUrlMain(getId,mainnumber,imgUrlMain.get(i));
			   }
			   	for(int i=0;i<imgUrlSub.size();i++) {
				   System.out.println(imgUrlSub.size());
				   System.out.println("size check"+imgUrlSub.get(i));
				   hdao.getUrlSub(getId,subnumber,imgUrlSub.get(i));
				   subnumber++;
			   }
			   
			   	
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			imgGetUrlVal="fail";
		}
		   
		   
		   System.out.println(imgUrlMain.size());
		   System.out.println(imgUrlSub.size());
		   imgUrlMain.clear();
		   imgUrlSub.clear();
		   return imgGetUrlVal;
	   }
	
	   
	   @PostMapping("/imgList")
	   @ResponseBody
	   public String doImgList(HttpServletRequest req) {
		   int product_id=Integer.parseInt(req.getParameter("product_Id"));
		   
			ArrayList<KTH_HDTO> list=hdao.imgList(product_id);
			JSONArray ja= new JSONArray();
			System.out.println(list.size());
			for(int i=0;i<list.size();i++) {
				JSONObject jo=new JSONObject();
				jo.put("product_id",list.get(i).getProduct_id());
				jo.put("useimg",list.get(i).getUse());
				jo.put("imgurl", list.get(i).getUrl());

				ja.put(jo);
				
			}
			return ja.toString();
	   
	   }
	   
	   @PostMapping("/product_Update")
	   @ResponseBody
	   public String doProduct_Update(HttpServletRequest req){
			String pInVal="ok";
			int category=Integer.parseInt(req.getParameter("category"));
			System.out.println("c="+category);
			String product_Name=req.getParameter("product_Name");
			System.out.println("name="+product_Name);
			int product_Price=Integer.parseInt(req.getParameter("product_Price"));
			System.out.println("price="+product_Price);
			String product_Maker=req.getParameter("product_Maker");
			System.out.println("ma="+product_Maker);
			String product_Ex=req.getParameter("product_Ex");
			System.out.println("ex="+product_Ex);
			String product_Ex_Detail=req.getParameter("product_Ex_Detail");
			System.out.println("ed="+product_Ex_Detail);
			int product_Id=Integer.parseInt(req.getParameter("product_Id"));
			System.out.println("id="+product_Id);
			int stock=Integer.parseInt(req.getParameter("stock"));
			System.out.println("stock="+stock);
			try {
				hdao.product_update(category,
						product_Name,
						product_Price,
						product_Maker,
						product_Ex,
						product_Ex_Detail,
						product_Id,
						stock);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
				pInVal="fail";
			}
			
			return pInVal;
		   }
	   
	   @PostMapping("/update_main_img")
	   @ResponseBody
	   public String mainImgUpdate(HttpServletRequest hsr, MultipartFile file) {
		   String mainUpVal="ok";
		   String fileName="";
		   String sub_url="";
		   try {
			   System.out.println("test filename");
			   if(file==null) {
				   fileName="";
				   sub_url="";
			   } else {
		         fileName = file.getOriginalFilename();
		         sub_url="/resources/img/" + fileName;
		         String folder = hsr.getServletContext().getRealPath("/");
		         file.transferTo(new File(folder+sub_url));
			   }
		         int product_id=Integer.parseInt(hsr.getParameter("product_Id"));
		         // webapp 폴더까지의 경로 정보를 가져온다. 

		         System.out.println("?");
		         System.out.println("mainimg="+product_id);
		         System.out.println("url="+sub_url);
		         hdao.img_update_main(product_id, sub_url);
		         
		      } catch (Exception ex) {
		         System.out.println(ex.getMessage());
		         mainUpVal="fail";
		      }
		   System.out.println(mainUpVal);
		   return mainUpVal;
	   }
	   
	   @PostMapping("/update_sub_img1")
	   @ResponseBody
	   public String update_sub_Img1(HttpServletRequest hsr, MultipartFile file) {
	      String subUpVal="ok";
	      int product_id=Integer.parseInt(hsr.getParameter("product_Id"));
	      int subnum=201;
		  String fileName = "";
		  String sub_url="";
	      try {
	    	  if(file==null) {
				   fileName="";
				   sub_url="";
			   } else {
		         fileName = file.getOriginalFilename();
		         sub_url="/resources/img/" + fileName;
		         String folder = hsr.getServletContext().getRealPath("/");
		         file.transferTo(new File(folder+sub_url));
		         System.out.println(folder+sub_url);
		         file.transferTo(new File(folder+sub_url));
			   }
			   
	        
	         // webapp 폴더까지의 경로 정보를 가져온다. 

	         System.out.println("?");
	         System.out.println(product_id);
	         System.out.println(sub_url);
	         hdao.img_update_sub(product_id,subnum, sub_url);
	         
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         subUpVal="fail";
	      }
		   return subUpVal;
	   }
	   @PostMapping("/update_sub_img2")
	   @ResponseBody
	   public String update_sub_Img2(HttpServletRequest hsr, MultipartFile file) {
	      String subUpVal="ok";
	      int product_id=Integer.parseInt(hsr.getParameter("product_Id"));
	      int subnum=202;
	      String fileName = "";
		  String sub_url="";
	      try {
	    	  if(file==null) {
				   fileName="";
				   sub_url="";
			   } else {
		         fileName = file.getOriginalFilename();
		         sub_url="/resources/img/" + fileName;
		         String folder = hsr.getServletContext().getRealPath("/");
		         file.transferTo(new File(folder+sub_url));
		         System.out.println(folder+sub_url);
		         file.transferTo(new File(folder+sub_url));
			   }
	        
	         hdao.img_update_sub(product_id,subnum,sub_url);
	         
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         subUpVal="fail";
	      }
		   return subUpVal;
	   }
	   @PostMapping("/update_sub_img3")
	   @ResponseBody
	   public String update_sub_Img3(HttpServletRequest hsr, MultipartFile file) {
	      String subUpVal="ok";
	      int product_id=Integer.parseInt(hsr.getParameter("product_Id"));
	      int subnum=203;
	      String fileName = "";
		  String sub_url="";
	      try {
	    	  if(file==null) {
				   fileName="";
				   sub_url="";
			   } else {
		         fileName = file.getOriginalFilename();
		         sub_url="/resources/img/" + fileName;
		         String folder = hsr.getServletContext().getRealPath("/");
		         file.transferTo(new File(folder+sub_url));
		         System.out.println(folder+sub_url);
		         file.transferTo(new File(folder+sub_url));
			   }
	         
	         hdao.img_update_sub(product_id,subnum, sub_url);
	         
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         subUpVal="fail";
	      }
		   return subUpVal;
	   }
	   
	   @PostMapping("/productDelete")
	   @ResponseBody
	   public String doProductDelete(HttpServletRequest req) {
		   String deleteVal="ok";
		   int product_id=Integer.parseInt(req.getParameter("product_Id"));
		try {
			
			
			hdao.productDelete(product_id);
		} catch (Exception ex) {
			 System.out.println(ex.getMessage());
			 deleteVal="fail";
		}
		   
		
		   return deleteVal; 
	   }
	   @PostMapping("/imgDelete")
	   @ResponseBody
	   public String doImgDelete(HttpServletRequest req) {
		   String imgdeleteVal="ok";
		   int product_id=Integer.parseInt(req.getParameter("product_Id"));
		try {
			
			
			hdao.imgDelete(product_id);
		} catch (Exception ex) {
			 System.out.println(ex.getMessage());
			 imgdeleteVal="fail";
		}
		   
		
		   return imgdeleteVal; 
	   }
	   
	   @GetMapping("/test")
	   public String test() {
		   
		   return "test";
	   }
	   	   
	   @GetMapping("/test_kakao")
	   public String kakaotest() {
		   
		   return "test_kakao";
	   }
	   
	   
	   
	   
	   @RequestMapping(value="/oauth/kakao", method=RequestMethod.GET)
	    public String kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Exception {
	       

	        System.out.println("#########" + code);
	        String access_Token = us.getAccessToken(code);

	        // 위에서 만든 코드 아래에 코드 추가
	        HashMap<String, Object> userInfo = us.getUserInfo(access_Token);
	        System.out.println("###access_Token#### : " + access_Token);
	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
	        System.out.println("###email#### : " + userInfo.get("email"));

	        return "member/testPage";
	        }
	   
	   
	   
	   
//	   @ResponseBody
//	    @GetMapping("/kakao")
//	    public void  kakaoCallback(@RequestParam String code){
//
//	            String access_Token = userService.getKaKaoAccessToken(code);
//	            userService.createKakaoUser(access_Token);
//
//	    }

	   
}
