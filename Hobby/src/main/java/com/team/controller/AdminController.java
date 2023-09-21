package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView goAdminHome() /* 愿�由ъ옄 �솃 */ {
		return new ModelAndView("admin/home");
	}


	@GetMapping("/adminUser.do")
	public ModelAndView goAdminUser() /* 愿�由ъ옄 �쑀�� */ {
		ModelAndView mv = new ModelAndView("admin/user");
		List<UserVO> list = userService.getAllUsers();
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/adminGroup.do")
	public ModelAndView goAdminGroup() /* 愿�由ъ옄 洹몃９ */ {
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
		ModelAndView mv = new ModelAndView("admin/qna");
		List<QnaVO> list = qnaService.getAllQnaOrderByResponse();
		List<UserVO> userlist = userService.getAllUsers();
		mv.addObject("userlist" , userlist);
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/adminReport.do")
	public ModelAndView goAdminReport() /* 愿�由ъ옄 �떊怨� */ {
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

