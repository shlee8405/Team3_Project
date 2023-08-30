package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.myqna.service.MyQnaService;
import com.team.myqna.vo.MyQnaVO;

@Controller
public class MyQnaController {

	@Autowired
	private MyQnaService myQnaService;
	
	@GetMapping("/myqna.do")
	public ModelAndView gomyqna() {
		ModelAndView mv = new ModelAndView("mypage/myqna");
		List<MyQnaVO> list = myQnaService.getMyQna();
		mv.addObject("list", list);
		return mv;
	}
	
	@PostMapping("/submit")
	public String submitQna(@RequestParam("qContent") String qContent,
            @RequestParam("qName") String qName) {
		MyQnaVO myqnavo = new MyQnaVO();
		myqnavo.setQ_content(qContent);
		myqnavo.setQ_name(qName);
		return "redirect:/qna/myqna.do";
	}
}
