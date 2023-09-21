package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.counter.service.LogincounterService;
import com.team.counter.service.ViewcounterService;
import com.team.faq.service.FaqService;
import com.team.faq.vo.FaqVO;
import com.team.group.service.GroupService;
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


	@Autowired
	private FaqService faqService;

	@Autowired 
	private LogincounterService logincounterService;
	
	@Autowired
	private ViewcounterService viewcounterService;
	// 홈 control

	@GetMapping("/")
	public ModelAndView rootRedirect() {
		ModelAndView mv = new ModelAndView("redirect:/home.do");
		return mv;
	}
	
	@RequestMapping("/home.do")
	public ModelAndView goHome(HttpSession session) /* �솃�쑝濡� 媛�湲�. �쁽�옱 index 2濡� �릺�뼱�엳�쓬 */ {
		ModelAndView mv = new ModelAndView("index2");
		System.out.println("current viewCounter is : " + session.getServletContext().getAttribute("viewCounter"));
		Object viewcounter = session.getServletContext().getAttribute("viewCounter");
		// viewcounter가 생성/존재하지 않으면 viewcount 추가
		if(viewcounter==null) {
			int res = viewcounterService.viewCount();
			if(res>0) session.getServletContext().setAttribute("viewCounter", "true");
		}
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
	
	// 고객센터 controls
	@GetMapping("/cusSer.do")
	public ModelAndView goCusSer() /* 고객센터 메인 */ {
	    ModelAndView mv = new ModelAndView("cusser/cusSerMain");
	    List<FaqVO> F_list = faqService.getList();
	    List<QnaVO> Q_list = qnaService.getAllQna();
	    List<ReportVO> R_list = reportService.getAllReports();
	    
	    // Use the first item's f_content and f_response
	    if (!F_list.isEmpty()) {
	        FaqVO firstFaq = F_list.get(0);
	        mv.addObject("faqTitle", firstFaq.getF_content());
	        mv.addObject("faqListText", firstFaq.getF_response());
	    }
	    mv.addObject("F_list", F_list);
	    mv.addObject("R_list", R_list);
	    mv.addObject("Q_list", Q_list);
	    return mv;
	}


	@GetMapping("/cusSerFAQ.do")
	public ModelAndView goCusSerFAQ() /* FAQ페이지 */ {
		ModelAndView mv = new ModelAndView("cusser/cusSerFAQ");
		List<FaqVO> list = faqService.getList();
		mv.addObject("list", list);
		return mv;
	}


	@RequestMapping("/cusSerAsk.do")
	public ModelAndView goCusSerAsk(HttpServletRequest request) /* 1대1 문의 페이지 */ {
		ModelAndView mv = new ModelAndView("cusser/cusSerAsk");
		String q_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(q_idx);
		List<QnaVO> list = qnaService.getQnAOne(q_idx);
		mv.addObject("list", list);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}
	

	@GetMapping("/go_inquiry.do")
	public ModelAndView goinquiry(HttpServletRequest request) /* 1대1 문의 작성 페이지로 이동 */ {
		ModelAndView mv = new ModelAndView("cusser/cusSerAskQ");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		List<QnaVO> list = qnaService.getAllQna();
		mv.addObject("alllist", list);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}

	@PostMapping("/insert_QNA.do")/* 1대1 문의 넣기 */ 
	public ModelAndView insert_QNA(QnaVO qvo, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("redirect:/cusSerAsk.do");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		int res = qnaService.getInsert(qvo,u_idx);
		return mv;
	}

	@GetMapping("/go_AskDetail.do")/* 1:1 상세 페이지 */ 
	public ModelAndView goAskDetail(@ModelAttribute("q_idx") String q_idx,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("cusser/cusSerAskDetail");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		QnaVO qvo = qnaService.Detail(q_idx);
		mv.addObject("qvo", qvo);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}

	@RequestMapping("/go_updateQ.do") /* 문의 수정 페이지로 이동 */
	public ModelAndView goUpdateQ(@ModelAttribute("q_idx") String q_idx,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("cusser/cusSerAskUpdate");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		QnaVO qvo = qnaService.Detail(q_idx);
		mv.addObject("qvo", qvo);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}

	@RequestMapping("/Update_QNA.do") /* 문의 수정하기 */
	public ModelAndView goUpdateQna(QnaVO qvo) {
		ModelAndView mv = new ModelAndView("redirect:/cusSerAsk.do");
		int res = qnaService.UpdateQna(qvo);
		return mv;
	}

	@RequestMapping("/go_deleteQ.do") /* 문의 삭제 */
	public ModelAndView goDeleteQ(@ModelAttribute("q_idx") String q_idx) {
		ModelAndView mv = new ModelAndView("redirect:/cusSerAsk.do");
		int res = qnaService.DeleteQ(q_idx);
		return mv;
	}
	
	@GetMapping("/go_AskDelete.do")/* 문의 삭제 페이지로 이동 */ 
	public ModelAndView goAskDelete(@ModelAttribute("q_idx") String q_idx){
		ModelAndView mv = new ModelAndView("cusser/cusSerAskDelete");
		QnaVO qvo = qnaService.Detail(q_idx);
		mv.addObject("qvo", qvo);
		return mv;
	}

	@RequestMapping("/cusSerReport.do") /* 신고 목록 페이지로 이동 */ 
	public ModelAndView goCusSerReport(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("cusser/cusSerReport");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		List<ReportVO> list = reportService.getReports(u_idx);
		mv.addObject("list", list);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}
	
	@GetMapping("/go_ReportDetail.do")/* 신고 상세 페이지 */ 
	public ModelAndView goReportDetail(@ModelAttribute("r_idx") String r_idx,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("cusser/cusSerReportDetail");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		ReportVO rvo = reportService.Detail(r_idx);
		mv.addObject("user", Ulist.get(0));
		mv.addObject("rvo", rvo);
		return mv;
	}
	
	@RequestMapping("/go_updateReport.do") /* 신고 수정 페이지로 이동 */
	public ModelAndView goUpdateReport(@ModelAttribute("r_idx") String r_idx,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("cusser/cusSerReportUpdate");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		ReportVO rvo = reportService.Detail(r_idx);
		mv.addObject("user", Ulist.get(0));
		mv.addObject("rvo", rvo);
		return mv;
	}
	
	@RequestMapping("/updateReport.do") /* 신고 수정하기 */
	public ModelAndView goUpdateReport(ReportVO rvo) {
		ModelAndView mv = new ModelAndView("redirect:/cusSerReport.do");
		int res = reportService.UpdateReport(rvo);
		return mv;
	}

	@RequestMapping("/go_deleteReport.do") /* 신고 삭제 */
	public ModelAndView goDeleteReport(@ModelAttribute("r_idx") String r_idx) {
		ModelAndView mv = new ModelAndView("redirect:/cusSerReport.do");
		int res = reportService.DeleteReport(r_idx);
		return mv;
	}

	@GetMapping("/report.do")
	public ModelAndView goReport(HttpServletRequest request)/* 신고 작성 페이지로 이동 */ {
		ModelAndView mv = new ModelAndView("cusser/cusSerReportR");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}

	@PostMapping("/report_insert.do") /* 신고 넣기 */
	public ModelAndView goReportInsert(ReportVO rvo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/cusSerReport.do");
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		int res = reportService.getReportInsert(rvo,u_idx);
		return mv;
	}

	// 留덉씠�럹�씠吏� 愿��젴 controls
//	@GetMapping("/myPageMain.do")
//	public ModelAndView goMyPage() /* 留덉씠�럹�씠吏� 硫붿씤 */ {
//		ModelAndView mv = new ModelAndView("user/myPageMain");
//		return mv;
//	}
//
//	@GetMapping("/myPageOneList.do")
//	public ModelAndView goMyPageOneList() /* �굹�쓽 �젙蹂� 蹂닿린 */ {
//		ModelAndView mv = new ModelAndView("user/myPageOneList");
//		return mv;
//	}

	/*
	 * @GetMapping("/myPageEdit.do") public ModelAndView goMyPageEdit() �굹�쓽 �젙蹂�
	 * �닔�젙 { ModelAndView mv = new ModelAndView("user/myPageEdit"); return mv; }
	 */


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
			result = userService.getUserInsert(vo);
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
