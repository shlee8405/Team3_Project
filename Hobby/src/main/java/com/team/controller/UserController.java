package com.team.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	
	@PostMapping("/signup.do")
	public ModelAndView getUserInsert(UserVO uvo) {
		ModelAndView mv = new ModelAndView("test/login");
		int result = userService.getUserInsert(uvo);
		return mv;
		
	}
	@PostMapping("/login.do")
    public ModelAndView loginUser(UserVO uvo) {
        ModelAndView mv = new ModelAndView();
        UserVO user = userService.getUserLogin(uvo.getU_id());

        if (user != null && user.getU_pw().equals(uvo.getU_pw())) {
            // 로그인 성공
            mv.setViewName("index2"); // 로그인 성공 시 이동할 페이지 설정
            // 필요한 처리 추가
        } else {
            // 로그인 실패
            mv.setViewName("test/login"); // 로그인 실패 시 이동할 페이지 설정
            // 필요한 처리 추가
        }

        return mv;
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
