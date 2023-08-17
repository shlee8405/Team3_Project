package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.service.GroupService;
import com.team.group.vo.GroupVO;
import com.team.qna.service.QnaService;
import com.team.qna.vo.QnaVO;
import com.team.report.service.ReportService;
import com.team.report.vo.ReportVO;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class MyController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ReportService reportService;
	
	//홈 control
	@GetMapping("/home.do")
	public ModelAndView goHome() /*홈으로 가기. 현재 index 2로 되어있음*/ {
		ModelAndView mv = new ModelAndView("index2");
		return mv;
	}
	
	
	
	//캠핑장 관련 controls
	@GetMapping("/camp.do")
	public ModelAndView goCamp() /*캠핑장 메인 페이지*/ {
	    ModelAndView mv = new ModelAndView("camp/camp");
	    
	    // 여기서 commons에서 JSON 형태로 데이터 받음
	    String[] test = {"장소", "010 0000 0000", "3321.321", "4321.321", "5"};
	    String[] test1 = {"장소2", "010 3333 3330", "11.321", "321.321", "3"};
	    
	    // 캠핑장 리스트를 model에 보내기
	    mv.addObject("test", test); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
	    mv.addObject("test1", test1); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
	    return mv;
	}
	
	
	
	
	//모임 관련 controls
	@GetMapping("/group.do")
	public ModelAndView goGroup() /**/ {
		ModelAndView mv = new ModelAndView("group/groupAdd");
		
		String[] test = {"제목", "이름", "010 0000 0000", "4321.321", "5"};
		mv.addObject("test", test); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
		return mv;
	}
	
	@GetMapping("/groupList.do") 
	public ModelAndView goGroupList() /**/ {
		ModelAndView mv = new ModelAndView("group/groupList");
		String[] test3 = {"장소", "010 0000 0000", "15", "휴일", "5"};
	    String[] test4 = {"장소2", "010 3333 3330", "20", "안휴일", "3"};
	    mv.addObject("test3", test3); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
	    mv.addObject("test4", test4); // 모델 속성에 대한 키 "testArray"를 명시적으로 제공
		return mv;
	}

	
	
	
	
	//고객센터 관련 controls
	@GetMapping("/cusSer.do")
	public ModelAndView goCusSer()  /*고객센터 메인*/ {
		ModelAndView mv = new ModelAndView("cusser/cusSerMain");
		return mv;
	}
	
	@GetMapping("/cusSerFAQ.do")
	public ModelAndView goCusSerFAQ() /*자주하는 질문 페이지*/ {
		ModelAndView mv = new ModelAndView("cusser/cusSerFAQ");
		return mv;
	}
	
	@GetMapping("/cusSerAsk.do")
	public ModelAndView goCusSerAsk() /*1대1 문의 페이지*/ {
		ModelAndView mv = new ModelAndView("cusser/cusSerAsk");
		return mv;
	}
	
	@GetMapping("/cusSerReport.do")
	public ModelAndView goCusSerReport() {
		ModelAndView mv = new ModelAndView("cusser/cusSerReport");
		return mv;
	}
	
	
	
	
	
	//마이페이지 관련 controls
	@GetMapping("/myPage.do") 
	public ModelAndView goMyPage() /*마이페이지 메인*/ {
		ModelAndView mv = new ModelAndView("user/myPageMain");
		return mv;
	}
	
	@GetMapping("/myPageOneList.do") 
	public ModelAndView goMyPageOneList() /*나의 정보 보기*/ {
		ModelAndView mv = new ModelAndView("user/myPageOneList");
		return mv;
	}
	
	@GetMapping("/myPageEdit.do") 
	public ModelAndView goMyPageEdit() /*나의 정보 수정*/ {
		ModelAndView mv = new ModelAndView("user/myPageEdit");
		return mv;
	}
	
	
	
	
	
	// 관리자 관련 controls
	@GetMapping("/adminHome.do")
	public ModelAndView goAdminHome() /*관리자 홈*/ {
		return new ModelAndView("admin/home");
	}
	

	@GetMapping("/adminGroup.do")
	public ModelAndView goAdminGroup() /*관리자 그룹*/ {
		ModelAndView mv =  new ModelAndView("admin/group");
		List<GroupVO> list = groupService.getAllGroups();
		mv.addObject("list", list);
		return mv;
	}
	
	@GetMapping("/adminQNA.do")
	public ModelAndView goAdminQNA() /*관리자 1대1*/ {
		ModelAndView mv = new ModelAndView("admin/qna");
		List<QnaVO> list = qnaService.getAllQna();
		mv.addObject("list", list);
		return mv;
	}
	
	@GetMapping("/adminReport.do")
	public ModelAndView goAdminReport() /*관리자 신고*/ {
		ModelAndView mv = new ModelAndView("admin/report");
		List<ReportVO> list = reportService.getAllReports();
		mv.addObject("list", list);
		return mv;
	}
	
	
	
	
	
	
	//회원가입, 로그인 controls
	@GetMapping("/login.do")
	public ModelAndView goLogin() {
		ModelAndView mv = new ModelAndView("test/login");
		return mv;
	}
	
	@GetMapping("/signup.do")
	public ModelAndView goSignup() {
		ModelAndView mv = new ModelAndView("test/signup");
		System.out.println("running get mapping '/signup.do'");
		return mv;
	}

	
	
	
	
	
	
	//쓰레기
	@GetMapping("/hello.do")
	public ModelAndView goHello() {
		ModelAndView mv = new ModelAndView("test/hello");
		return mv;
	}
	
	@GetMapping("/world.do")
	public ModelAndView goWorld() {
		ModelAndView mv = new ModelAndView("test/world");
		return mv;
	}
	
	@GetMapping("/test.do")
	public ModelAndView goTest() {
		ModelAndView mv = new ModelAndView("test");
		return mv;
	}

	
	@PostMapping("/test_groupSend.do")
	public ModelAndView goGroupAddForm() {
		ModelAndView mv = new ModelAndView("group/groupList");
		return mv;
	}
	

	
	@PostMapping("/signupOk.do")
	public ModelAndView signUpNormal(UserVO vo) /*회원가입 DB처리*/{
		ModelAndView mv = new ModelAndView("redirect:/signup.do");
		System.out.println("running post mapping '/singupOK.do'");
		int result = 0;
		try {
			result = userService.addUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result > 0 ) {
			System.out.println("userService.addUser(vo) success!");
		} else {
			System.out.println("userService.addUser(vo) fail!");
		}
		
		return mv;
	}
	
    

}
