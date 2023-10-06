package com.team.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.faq.service.FaqService;
import com.team.faq.vo.FaqVO;

@Controller
public class faq {

	@Autowired
	public FaqService faqService;
	
	// 상세 검색 list	
	@GetMapping("/adminFaqDetailSearch.do")
	public ModelAndView dEtAiLsEaRcHaDmInPaGeFaQ(@RequestParam("text") String text, @RequestParam("query") String subject, HttpSession session) {
		ModelAndView mv = new ModelAndView("admin/faq");
		System.out.println("text is "+text);
		System.out.println("subject is "+subject);
		
		if (subject.equals("1")) {
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<FaqVO> list = faqService.getListByContent(newText);
			mv.addObject("list", list);
			return mv;
		} else if (subject.equals("2")) {
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<FaqVO> list = faqService.getListByResponse(newText);
			mv.addObject("list",list);
		} 
		return mv;
	}
	@RequestMapping("/updateFaqAdmin.do")
	public ModelAndView UpDaTeAdMiNFaQ(FaqVO fvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminFAQ.do");		
		System.out.println("fvo idx is"+ fvo.getF_idx());
		System.out.println("fvo content is " + fvo.getF_content());
		System.out.println("fvo response is " + fvo.getF_response());
		
		int res = faqService.getUpdateFaqAdmin(fvo);
		if (res > 0) session.setAttribute("adminActionControl", "update");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	@GetMapping("/hideFaqAdmin.do")
	public ModelAndView hideFaq(@RequestParam("idx") String idx, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminFAQ.do");
		int res = faqService.getHideFaq(idx);
		if(res>0)session.setAttribute("adminActionControl", "hide");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	@GetMapping("/unhideFaqAdmin.do")
	public ModelAndView unhideFaq(@RequestParam("idx") String idx, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminFAQ.do");
		int res = faqService.getUnhideFaq(idx);
		if(res>0)session.setAttribute("adminActionControl", "unhide");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	
	@GetMapping("/deleteFaqAdmin.do")
	public ModelAndView deleteFaq(@RequestParam("idx") String idx, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminFAQ.do");
		int res = faqService.getDeleteFaq(idx);
		if(res>0) session.setAttribute("adminActionControl", "delete");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	
	@RequestMapping("/addFaqAdmin.do")
	public ModelAndView addFaq(FaqVO fvo, 
			HttpServletResponse response,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/adminFAQ.do");
		String sessionidx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		fvo.setU_idx(sessionidx);
		System.out.println("/addFaqAdmin u_idx is " + fvo.getU_idx());
		int res = faqService.getInsertFaq(fvo);
		if(res>0) request.getSession().getServletContext().setAttribute("adminActionControl", "insert");
		else request.getSession().getServletContext().setAttribute("adminActionControl", "error");
		return mv;
	}
	
}
