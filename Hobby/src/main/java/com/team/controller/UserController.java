package com.team.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;
import com.team.group.service.GroupService;
import com.team.qna.service.QnaService;
import com.team.report.service.ReportService;
import com.team.user.service.UserService;
import com.team.user.vo.KakaoVO;
import com.team.user.vo.NaverVO;
import com.team.user.vo.UserVO;

@RestController
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping("/") 
	public ModelAndView goHOME() {
		return new ModelAndView("redirect:/home.do");
	}
	
	// 회원가입 이동
	@RequestMapping("/signup.do")
	public ModelAndView goSignUp() {		
		ModelAndView mv = new ModelAndView("test/signup");
		return mv;
	}
	
	/* */ 
	@RequestMapping("/checkSession.do")
	public ModelAndView checkSession(HttpServletResponse response,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/home.do");
		
		System.out.println(request.getSession().getServletContext().getAttribute("sessionUidx"));
		return mv;
		
	}
	
	@RequestMapping("/logOut.do")
	public ModelAndView logOutSession(HttpServletResponse response,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/home.do");
		request.getSession().getServletContext().removeAttribute("sessionUidx");
		request.getSession().getServletContext().removeAttribute("adminChecker");
		if(request.getSession().getServletContext().getAttribute("kakaoSession")!=null) {
			request.getSession().getServletContext().removeAttribute("kakaoSession");
		}
		return mv;
	}
		
		
	
	
	// 회원가입 DB 저장 실행
	@PostMapping("/signupGo.do")
	public ModelAndView getUserInsert(UserVO uvo) {
		ModelAndView mv = new ModelAndView("index2");
		//비밀번호 암호화
		String newPass = passwordEncoder.encode(uvo.getU_pw());
		//setter in vo
		uvo.setU_pw(newPass);
		
		//비밀번호 암호화 상태로 DB 저장
		int result = userService.getUserInsert(uvo);
		return mv;
	}
	
	// 로그인 
	@PostMapping("/login.do")
    public ModelAndView loginUser(UserVO uvo, 
    		HttpServletRequest request,
    		HttpServletResponse response,
    		@RequestParam("url") String url) {
        ModelAndView mv = new ModelAndView(url);
        // 아이디 DB에 존재하는지 확인 
        int res = userService.getUserCount(uvo.getU_id());
        System.out.println(url);
        // 없으면 종료
        if(res == 0) {
        	request.getSession().getServletContext().setAttribute("loginChk", "invalid");
        	mv.setViewName("redirect:"+url);
        	return mv;
        }
               
        // 비밀번호 추출
        String dbpw = userService.getUserPass(uvo);
        
        // 비밀번호 디코딩
        try {
			if (!passwordEncoder.matches(uvo.getU_pw(), dbpw)) {
				request.getSession().getServletContext().setAttribute("loginChk", "wrong");
				mv.setViewName("redirect:"+url);
				return mv;
			} else {
				UserVO dbuvo = userService.getUserVoWithId(uvo.getU_id());
				if(dbuvo.getU_status().equals("9")) {
				request.getSession().getServletContext().setAttribute("sessionUidx", dbuvo.getU_idx());
				request.getSession().getServletContext().setAttribute("adminChecker", dbuvo.getU_status());
				mv.setViewName("redirect:"+url);
				return mv;
				} else if (dbuvo.getU_ban().equals("1")) {
				//밴 
					
				} else if (dbuvo.getU_status().equals("0")) {
				//탈퇴회원
					
				} else {
				//일반회원
					mv.setViewName("redirect:"+url);
					request.getSession().getServletContext().setAttribute("sessionUidx", dbuvo.getU_idx());
					return mv;
				}
			 
//				if(mvo.getM_id().equals("shlee2")) {
//					session.setAttribute("admin", "ok");
//				}
//				session.setAttribute("loginChk", "ok");
//				session.setAttribute("mvo", mvo);
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return mv;
		} 

    }
	// 이메일 중복확인
	@RequestMapping("/emailCheck.do")
	public String checkEmail(@RequestBody String email) {
	    String decodedEmail2 = "";
	    try {
	        decodedEmail2 = URLDecoder.decode(email, "UTF-8");
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }
	    String decodedEmail = decodedEmail2.replace("=", ""); // = 문자 제거
	    System.out.println("controller email : " + decodedEmail);

	    if (userService.isEmailDuplicate(decodedEmail)) {
	        System.out.println("test2");
	        return "duplicate"; // 이미 사용 중인 이메일인 경우
	    } else {
	        System.out.println("test3");
	        return "available"; // 사용 가능한 이메일인 경우
	    }
	}

	 // 아이디 중복확인
	 @RequestMapping("/idCheck.do")
	    public String checkId(@RequestBody String id) {
	        String decodedId2 = "";
	        try {
	            decodedId2 = URLDecoder.decode(id, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        }
	        String decodedId = decodedId2.substring(0, decodedId2.length() - 1);
			 System.out.println("controller id : "+decodedId);	        
			 if (userService.isIdDuplicate(decodedId)) {
	            return "duplicate";
	        } else {
	            // 사용 가능한 아이디인 경우
	            return "available";
	        }
	    }
	 
	 
	 
	 // 카카오 로그인. KakaoVO를 통해 id 받음
	 @PostMapping("/kakaoLogin.do")
	 public ModelAndView kakaologin(@RequestBody KakaoVO kakaovo, 
			 HttpServletResponse response, 
			 HttpServletRequest request) {
		 System.out.println("url is " + request.getRequestURI());
		 ModelAndView mv = new ModelAndView();
		 @SuppressWarnings("unchecked")
		 LinkedTreeMap<String, String> kakaomap = (LinkedTreeMap<String, String>) kakaovo.getProperties();
		 //kakaovo.getId() = 카카오 고유 아이디
		 //kakaomap.get("nickname") = 카카오 계정 이름
		 String kakaoId = kakaovo.getId();
		 String kakaoName = kakaomap.get("nickname");
		 System.out.println("kakao Object url is "+kakaovo.getUrl());
		 // check if id exists
		 boolean result = userService.isIdDuplicate(kakaoId);
		 if(result) {
			 UserVO dbuvo = userService.getUserVoWithId(kakaoId);
			 System.out.println("kakaoLogin.do u_ban==1 is :" + dbuvo.getU_ban().equals("1"));
			 System.out.println("kakaoLogin.do retrieve id successfull id: " + kakaoId );
			 request.getSession().getServletContext().setAttribute("sessionUidx", dbuvo.getU_idx());
			 request.getSession().getServletContext().setAttribute("kakaoSession", "true");
			 System.out.println("kakaoLogin.do insert session Idx success");
			 System.out.println("redirect:"+kakaovo.getUrl());
			 return new ModelAndView("redirect:"+kakaovo.getUrl());
		 } else {
			 UserVO uvo = new UserVO();
			 uvo.setU_id(kakaoId);
			 uvo.setU_nickname(kakaoName);
			 uvo.setU_name(kakaoName);
			 int insertResult = userService.getUserInsertKakao(uvo);
			 UserVO dbuvo = userService.getUserVoWithId(kakaoId);
			 System.out.println("kakaoLogin.do insert id successfull  id: " + kakaoId);
			 request.getSession().getServletContext().setAttribute("sessionUidx", dbuvo.getU_idx());
			 request.getSession().getServletContext().setAttribute("kakaoSession", "true");
			 System.out.println("kakaoLogin.do insert session Idx success");
			 System.out.println("redirect:"+kakaovo.getUrl());
			 return new ModelAndView("redirect:"+kakaovo.getUrl());
		 }
	 }
	 
	 @RequestMapping(value = "/naver.do")
	 public ModelAndView handleNaverLogin(
	     @RequestParam("email") String email,
	     @RequestParam("nickname") String nickname,
	     @RequestParam("id") String id,
	     @RequestParam("name") String name,
	     HttpServletResponse response, 
		 HttpServletRequest request
	     ) {

	     // 1. 데이터베이스에서 이메일을 사용하여 기존 정보를 조회
	     String existingNaverUser = userService.getNaverUserByEmail(id);
	     
	     // 2. 조회된 정보가 없을 경우에만 새로운 데이터를 삽입
	     if (existingNaverUser == null) {
	         NaverVO naverVO = new NaverVO();
	         naverVO.setId(id);
	         naverVO.setName(name);
	         naverVO.setEmail(email);
	         naverVO.setNickname(nickname);

	         int res = userService.naver(naverVO);
	     }
	     
	     boolean result = userService.isIdDuplicate(id);
	     
		 if(result) {
			 UserVO dbuvo = userService.getUserVoWithId(id);
			 request.getSession().getServletContext().setAttribute("sessionUidx", dbuvo.getU_idx());
			 request.getSession().getServletContext().setAttribute("kakaoSession", "true");
			 return new ModelAndView("redirect:/home.do");
		 } else {
			 UserVO uvo = new UserVO();
			 uvo.setU_id(id);
			 uvo.setU_nickname(name);
			 uvo.setU_name(name);
			 int insertResult = userService.getUserInsertKakao(uvo);
			 UserVO dbuvo = userService.getUserVoWithId(id);
			 request.getSession().getServletContext().setAttribute("sessionUidx", dbuvo.getU_idx());
			 request.getSession().getServletContext().setAttribute("kakaoSession", "true");
			 return new ModelAndView("redirect:/home.do");
		 }

	 }


	 
	 @RequestMapping("/forgotId.do")
	 public String forgotId(@RequestBody String encodedEmail) {
		 String decodedEmail2 = "";
		    try {
		        decodedEmail2 = URLDecoder.decode(encodedEmail, "UTF-8");
		    } catch (UnsupportedEncodingException e) {
		        e.printStackTrace();
		    }
		    String decodedEmail = decodedEmail2.replace("=", ""); // = 문자 제거
		    String finalemail = decodedEmail.substring(5);
		    System.out.println("controller email : " + finalemail);
		    String foundId = userService.findIdByEmail(finalemail);
	     if (foundId != null) {
	         System.out.println("아이디 찾음: " + foundId);
	         return foundId; // Return the 아이디
	     } else {
	         System.out.println("아이디를 찾을 수 없음");
	         return null;
	     }
	 }
	 @RequestMapping("/forgotPwd.do")
	 public String forgotPw(@RequestBody String encodedEmail) {
		 String decodedEmail2 = "";
		    try {
		        decodedEmail2 = URLDecoder.decode(encodedEmail, "UTF-8");
		    } catch (UnsupportedEncodingException e) {
		        e.printStackTrace();
		    }
		    String decodedEmail = decodedEmail2.replace("=", ""); // = 문자 제거
		    String finalemail = decodedEmail.substring(6);
		    System.out.println("controller email : " + finalemail);
		    String foundPw = userService.findPwByEmail(finalemail);
	     if (foundPw != null) {
	         System.out.println("비번 찾음: " + foundPw);
	         return foundPw; // Return the 아이디
	     } else {
	         System.out.println("비번을 찾을 수 없음");
	         return null;
	     }
	 }
	 
	 }

