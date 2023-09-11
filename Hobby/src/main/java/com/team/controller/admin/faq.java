package com.team.controller.admin;

import java.util.List;

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
	

	@GetMapping("/adminFaqDetailSearch")
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
	@RequestMapping("/updateFaqAdmin")
	public ModelAndView UpDaTeAdMiNFaQ(FaqVO fvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminFAQ.do");		
		System.out.println("fvo idx is"+ fvo.getF_idx());
		System.out.println("fvo content is " + fvo.getF_content());
		System.out.println("fvo response is " + fvo.getF_response());
		
//		int res = faqService.getUpdateFaqAdmin(fvo);
		
		
		return mv;
		
		/*
		 
		  //		System.out.println("update : " + idx);
		ModelAndView mv = new ModelAndView("redirect:/adminUser.do");
//		Map<String, String> queryMap = new HashMap<String, String>();
//		queryMap.put("u_idx", uvo.getU_idx);
		System.out.println("id is "+uvo.getU_id());
		System.out.println("idx is "+uvo.getU_idx());
		System.out.println("name is "+uvo.getU_name());
		
		int res = userService.getUpdateUserAdmin(uvo);
		if(res>0)session.setAttribute("adminActionControl", "update");
		else session.setAttribute("adminActionControl", "error");
		return mv;
		  
		  
		  
		
		 */
	}
}
