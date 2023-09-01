package com.team.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.service.GroupService;
import com.team.qna.service.QnaService;
import com.team.report.service.ReportService;
import com.team.user.service.UserService;
import com.team.user.vo.KakaoVO;
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
		return mv;
	}
		
		
	
	
	// 회원가입 DB 저장 실행
	@PostMapping("/signupGo.do")
	public ModelAndView getUserInsert(UserVO uvo) {
		ModelAndView mv = new ModelAndView("test/login");
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
    		HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        // 아이디 DB에 존재하는지 확인 
        int res = userService.getUserCount(uvo.getU_id());
        
        // 없으면 종료
        if(res == 0) {
        	mv.setViewName("test/login");
        	return mv;
        }
               
        // 비밀번호 추출
        String dbpw = userService.getUserPass(uvo);
        
        // 비밀번호 디코딩
        try {
			if (!passwordEncoder.matches(uvo.getU_pw(), dbpw)) {
				request.getSession().getServletContext().setAttribute("LoginChk", "fail");
				return mv;
			} else {
				UserVO dbuvo = userService.getUserVoWithId(uvo.getU_id());
				if(dbuvo.getU_status().equals("9")) {
				//관리자 
					
				} else if (dbuvo.getU_ban().equals("1")) {
				//밴 
					
				} else if (dbuvo.getU_status().equals("0")) {
				//탈퇴회원
					
				} else {
				//일반회원
					mv.setViewName("index2");
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
	 @RequestMapping("/kakaoLogin.do")
	 public ModelAndView kakaologin(@RequestBody KakaoVO kakaovo, 
			 HttpServletResponse response, 
			 HttpServletRequest request) {

		 ModelAndView mv = new ModelAndView("index2");
		 System.out.println("id is : " + kakaovo.getId() + " on /kakaoLogin.do");
		 // 아이디 정상적으로 옴
		 
		 
		 //db에 넣는코드
		 
		 // if(db에 KakaoVO.getId() 가 존재하지 않으면){
			 // int res = userDAO.getInsert()
		 //	 } 
		 // else if (db에 kakaoVO.getID()가 존재하면) {
		 	// proceed...
		 //	 }
		 
		 // Session에 id 추가
		 return mv;
	 }
	 @RequestMapping("/forgotId.do")
	 public String forgotId(@RequestBody String encodedEmail) {
//	     if (encodedEmail.isEmpty()) {
//	         return ResponseEntity.badRequest().body("이메일 주소가 유효하지 않습니다.");
//	     }
//	     System.out.println(encodedEmail);
//	     String foundId = userService.findIdByEmail(encodedEmail);
		 
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
	    public ResponseEntity<String> forgotPassword(@RequestBody String encodedEmail) {
	        String decodedEmail = decodeEmail(encodedEmail);

	        if (decodedEmail == null || decodedEmail.isEmpty()) {
	            return ResponseEntity.badRequest().body("Invalid email address.");
	        }

	        String newPassword = userService.generateNewPassword();
	        if (newPassword != null) {
	            boolean updated = userService.updateUserPassword(decodedEmail, newPassword);
	            if (updated) {
	                String responseMessage = "A new password has been sent to " + decodedEmail + ".";
	                return ResponseEntity.ok(responseMessage);
	            } else {
	                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                        .body("Failed to reset password.");
	            }
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                    .body("Failed to generate a new password.");
	        }
	    }

	    // Helper method to decode the email
	    private String decodeEmail(String encodedEmail) {
	        try {
	            return URLDecoder.decode(encodedEmail, "UTF-8").replaceAll("=", "");
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	            return null;
	        }
	    }
	 
	 }

