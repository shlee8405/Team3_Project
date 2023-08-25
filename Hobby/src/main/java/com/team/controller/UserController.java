package com.team.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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
	 @RequestMapping("/emailCheck.do")
	    public String checkEmail(@RequestBody String email) {
		 String decodedEmail2 = "";
		 try {
			 decodedEmail2 = URLDecoder.decode(email, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		 String decodedEmail = decodedEmail2.substring(0, decodedEmail2.length() - 1);
		 System.out.println("controller email : "+decodedEmail);
	        if (userService.isEmailDuplicate(decodedEmail)) {
	        	System.out.println("test2");
	            return "duplicate"; // 이미 사용 중인 이메일인 경우
	        } else {
	        	System.out.println("test3");
	            return "available"; // 사용 가능한 이메일인 경우
	        }
	    }
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
}
