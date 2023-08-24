package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.myinfoupdate.service.MyinfoUpdateService;
import com.team.myinfoupdate.vo.MyinfoUpdateVO;
import com.team.mypagemain.service.MypageMainService;
import com.team.mypagemain.vo.MypageMainVO;

@Controller
public class MyinfoUpdateController {

	@Autowired
	private MyinfoUpdateService myinfoUpdateService;
	
	@PostMapping("/myPageEdit.do")
	public ModelAndView gomypageedit() {
		ModelAndView mv = new ModelAndView("mypage/update");
		List<MyinfoUpdateVO> list = myinfoUpdateService.getMyinfoUpdate();
		mv.addObject("list", list);
		return mv;
	}
	
}
