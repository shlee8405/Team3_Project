package com.team.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.qna.service.QnaService;
import com.team.qna.vo.QnaVO;
import com.team.report.vo.ReportVO;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class qna {

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private UserService userService;
	
	// 상세 검색
	@GetMapping("/adminQnaDetailSearch.do")
	public ModelAndView adminQnaDetailSearch(
			@RequestParam("text") String text, 
			@RequestParam("query") String subject, 
			HttpSession session) {
		ModelAndView mv = new ModelAndView("admin/qna");
		List<UserVO> userlist = userService.getAllUsers();
		mv.addObject("userlist" , userlist);
		
		if (subject.equals("1")) {
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<QnaVO> list = qnaService.getListByTitle(newText);
			mv.addObject("list", list);
			return mv;
		} else if (subject.equals("2")) {
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<QnaVO> list = qnaService.getListByNickname(newText);
			mv.addObject("list",list);
		} 
		return mv;
	}
	
	
	
	@RequestMapping("/deleteQnaAdmin.do")
	public ModelAndView deleteQnaAdmin(QnaVO qvo , HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminQNA.do");
		int res = qnaService.getDeleteQnaWithQVO(qvo);
		if (res > 0)session.setAttribute("adminActionControl", "delete");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}

	@RequestMapping("/updateQnaAdmin.do")
	public ModelAndView updateQnaAdmin(QnaVO qvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminQNA.do");
		int res = qnaService.getUpdateQnaWithQVO(qvo);
		if (res > 0) session.setAttribute("adminActionControl", "update");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}

}
