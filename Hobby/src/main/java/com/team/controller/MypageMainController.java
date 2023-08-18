package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.mypagemain.service.MypageMainService;
import com.team.mypagemain.vo.MypageMainVO;

@Controller
public class MypageMainController {

	@Autowired
	private MypageMainService mypageMainService;
	
	@GetMapping("/myPagemain.do")
	public ModelAndView gomypagemain() {
		ModelAndView mv = new ModelAndView("mypage/main");
		List<MypageMainVO> list = mypageMainService.getMypageMain();
		mv.addObject("list", list);
		return mv;
	}
}
