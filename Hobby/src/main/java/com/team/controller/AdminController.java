package com.team.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.counter.service.LogincounterService;
import com.team.counter.service.ViewcounterService;
import com.team.faq.service.FaqService;
import com.team.faq.vo.FaqVO;
import com.team.group.service.GroupService;
import com.team.group.vo.GroupVO;
import com.team.groupuser.service.GroupuserService;
import com.team.groupuser.vo.GroupuserVO;
import com.team.mpimg.service.MpimgService;
import com.team.mpimg.vo.MPIVO;
import com.team.qna.service.QnaService;
import com.team.qna.vo.QnaVO;
import com.team.report.service.ReportService;
import com.team.report.vo.ReportVO;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private GroupService groupService;

	@Autowired
	private QnaService qnaService;

	@Autowired
	private ReportService reportService;

	@Autowired
	private FaqService faqService;

	@Autowired
	private GroupuserService groupuserService;

	@Autowired
	private LogincounterService logincounterService;
	
	@Autowired
	private ViewcounterService viewcounterService;
	
	@Autowired
	private MpimgService mpimgService;
//	@GetMapping("/adminUser.do")
//	public ModelAndView goAdminUser() /* 관리자 유저 */ {
//		ModelAndView mv = new ModelAndView("admin/user");
//		List<UserVO> list = userService.getAllUsers();
//		mv.addObject("list", list);
//		return mv;
//	}
	
	
	@GetMapping("/shltest.do")
	public ModelAndView goSHLTEST() {
		ModelAndView mv = new ModelAndView("videotest");
		return mv;
	}
	
	@GetMapping("/adminHome.do")
	public ModelAndView goAdminHome() /* 관리자 홈 */ {
		ModelAndView mv = new ModelAndView("admin/home");
		int userCountToday = userService.getUsersToday();
		int groupsCountToday = groupService.getGroupsToday();
		int todayView = viewcounterService.todayView();
		int todayLogin = logincounterService.todayLogin();
		List<QnaVO> qnalist = qnaService.getUncheckedQna();
		List<ReportVO> reportlist = reportService.getUncheckedReport();
		List<UserVO> userlist = userService.getAllUsers();
		mv.addObject("viewCount", todayView);
		mv.addObject("loginCount", todayLogin);
		mv.addObject("groupCount", groupsCountToday);
		mv.addObject("userCount", userCountToday);
		mv.addObject("qnalist", qnalist);
		mv.addObject("reportlist" , reportlist);
		mv.addObject("userlist",userlist);
		return mv;
	}


	@GetMapping("/adminUser.do")
	public ModelAndView goAdminUser() /* 愿�由ъ옄 �쑀�� */ {
		ModelAndView mv = new ModelAndView("admin/user");
		List<UserVO> list = userService.getAllUsers();
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/adminGroup.do")
	public ModelAndView goAdminGroup() /* 관리자 캠핑모임 */ {
		ModelAndView mv = new ModelAndView("admin/group");
		List<GroupVO> list = groupService.getAllGroupsNoPaging();
		List<UserVO> userlist = userService.getAllUsers();
		List<GroupuserVO> groupuserlist = groupuserService.getAllList();
		mv.addObject("groupuserlist", groupuserlist);
		mv.addObject("userlist" , userlist);
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/adminQNA.do")
	public ModelAndView goAdminQNA() /* 愿�由ъ옄 1��1 */ {
		int res = qnaService.checkQna();
//		if (res>0) System.out.println("checked all q_status=2 to q_status=1");
//		else System.out.println("failed to check all unchecked qna");
		
		ModelAndView mv = new ModelAndView("admin/qna");
		List<QnaVO> list = qnaService.getAllQnaOrderByResponse();
		List<UserVO> userlist = userService.getAllUsers();
		mv.addObject("userlist" , userlist);
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/adminReport.do")
	public ModelAndView goAdminReport() /* 愿�由ъ옄 �떊怨� */ {
		int res = reportService.checkReport();
//		if(res>0) System.out.println("checked all r_status=2 to r_status=1");
//		else System.out.println("failed to check all unchecked reports");
		
		ModelAndView mv = new ModelAndView("admin/report");
		List<ReportVO> list = reportService.getAllReports();
		List<UserVO> userlist = userService.getAllUsers();
		mv.addObject("list", list);
		mv.addObject("userlist" , userlist);
		return mv;
	}
	
	@GetMapping("/adminFAQ.do")
	public ModelAndView goAdminFaq() /*관리자 FAQ 페이지 */ {
		ModelAndView mv = new ModelAndView("admin/faq");
		List<FaqVO> list = faqService.getList();
		mv.addObject("list", list);
		return mv;
	}
	
	@GetMapping("/adminMainPageModifier.do")
	public ModelAndView goAdminMainPageModifier(HttpSession session) {
		ModelAndView mv = new ModelAndView("admin/mainpagemodifier");
		List<MPIVO> list = mpimgService.getImages();
		mv.addObject("list", list);
		return mv;
	}

}

