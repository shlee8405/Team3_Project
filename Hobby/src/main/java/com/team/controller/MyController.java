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

	// �솃 control
	@GetMapping("/home.do")
	public ModelAndView goHome() /* �솃�쑝濡� 媛�湲�. �쁽�옱 index 2濡� �릺�뼱�엳�쓬 */ {
		ModelAndView mv = new ModelAndView("index2");
		return mv;
	}

	// 罹좏븨�옣 愿��젴 controls
	@GetMapping("/camp.do")
	public ModelAndView goCamp() /* 罹좏븨�옣 硫붿씤 �럹�씠吏� */ {
		ModelAndView mv = new ModelAndView("camp/camp");

		// �뿬湲곗꽌 commons�뿉�꽌 JSON �삎�깭濡� �뜲�씠�꽣 諛쏆쓬
		String[] test = { "�옣�냼", "010 0000 0000", "3321.321", "4321.321", "5" };
		String[] test1 = { "�옣�냼2", "010 3333 3330", "11.321", "321.321", "3" };

		// 罹좏븨�옣 由ъ뒪�듃瑜� model�뿉 蹂대궡湲�
		mv.addObject("test", test); // 紐⑤뜽 �냽�꽦�뿉 ���븳 �궎 "testArray"瑜� 紐낆떆�쟻�쑝濡� �젣怨�
		mv.addObject("test1", test1); // 紐⑤뜽 �냽�꽦�뿉 ���븳 �궎 "testArray"瑜� 紐낆떆�쟻�쑝濡� �젣怨�
		return mv;
	}

	// 紐⑥엫 愿��젴 controls
	@GetMapping("/group.do")
	public ModelAndView goGroup() /**/ {
		ModelAndView mv = new ModelAndView("group/groupAdd");

		String[] test = { "�젣紐�", "�씠由�", "010 0000 0000", "4321.321", "5" };
		mv.addObject("test", test); // 紐⑤뜽 �냽�꽦�뿉 ���븳 �궎 "testArray"瑜� 紐낆떆�쟻�쑝濡� �젣怨�
		return mv;
	}

	/*
	 * @GetMapping("/groupList.do") public ModelAndView goGroupList() { ModelAndView
	 * mv = new ModelAndView("group/groupList"); String[] test3 = {"�옣�냼",
	 * "010 0000 0000", "15", "�쑕�씪", "5"}; String[] test4 = {"�옣�냼2",
	 * "010 3333 3330", "20", "�븞�쑕�씪", "3"}; mv.addObject("test3", test3); // 紐⑤뜽
	 * �냽�꽦�뿉 ���븳 �궎 "testArray"瑜� 紐낆떆�쟻�쑝濡� �젣怨� mv.addObject("test4", test4); //
	 * 紐⑤뜽 �냽�꽦�뿉 ���븳 �궎 "testArray"瑜� 紐낆떆�쟻�쑝濡� �젣怨� return mv; }
	 */

	// 怨좉컼�꽱�꽣 愿��젴 controls
	@GetMapping("/cusSer.do")
	public ModelAndView goCusSer() /* 怨좉컼�꽱�꽣 硫붿씤 */ {
		ModelAndView mv = new ModelAndView("cusser/cusSerMain");
		return mv;
	}

	@GetMapping("/cusSerFAQ.do")
	public ModelAndView goCusSerFAQ() /* �옄二쇳븯�뒗 吏덈Ц �럹�씠吏� */ {
		ModelAndView mv = new ModelAndView("cusser/cusSerFAQ");
		return mv;
	}

	@GetMapping("/cusSerAsk.do")
	public ModelAndView goCusSerAsk() /* 1��1 臾몄쓽 �럹�씠吏� */ {
		ModelAndView mv = new ModelAndView("cusser/cusSerAsk");
		return mv;
	}

	@GetMapping("/cusSerReport.do")
	public ModelAndView goCusSerReport() {
		ModelAndView mv = new ModelAndView("cusser/cusSerReport");
		return mv;
	}

	// 留덉씠�럹�씠吏� 愿��젴 controls
	@GetMapping("/myPage.do")
	public ModelAndView goMyPage() /* 留덉씠�럹�씠吏� 硫붿씤 */ {
		ModelAndView mv = new ModelAndView("user/myPageMain");
		return mv;
	}

	@GetMapping("/myPageOneList.do")
	public ModelAndView goMyPageOneList() /* �굹�쓽 �젙蹂� 蹂닿린 */ {
		ModelAndView mv = new ModelAndView("user/myPageOneList");
		return mv;
	}

	/*
	 * @GetMapping("/myPageEdit.do") public ModelAndView goMyPageEdit() �굹�쓽 �젙蹂�
	 * �닔�젙 { ModelAndView mv = new ModelAndView("user/myPageEdit"); return mv; }
	 */

	// 愿�由ъ옄 愿��젴 controls
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
		List<GroupVO> list = groupService.getAllGroups();
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/adminQNA.do")
	public ModelAndView goAdminQNA() /* 愿�由ъ옄 1��1 */ {
		ModelAndView mv = new ModelAndView("admin/qna");
		List<QnaVO> list = qnaService.getAllQna();
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/adminReport.do")
	public ModelAndView goAdminReport() /* 愿�由ъ옄 �떊怨� */ {
		ModelAndView mv = new ModelAndView("admin/report");
		List<ReportVO> list = reportService.getAllReports();
		mv.addObject("list", list);
		return mv;
	}

	// �쉶�썝媛��엯, 濡쒓렇�씤 controls
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

	// �벐�젅湲�
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
	public ModelAndView signUpNormal(UserVO vo) /* �쉶�썝媛��엯 DB泥섎━ */ {
		ModelAndView mv = new ModelAndView("redirect:/signup.do");
		System.out.println("running post mapping '/singupOK.do'");
		int result = 0;
		try {
			result = userService.addUser(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			System.out.println("userService.addUser(vo) success!");
		} else {
			System.out.println("userService.addUser(vo) fail!");
		}

		return mv;
	}

}
