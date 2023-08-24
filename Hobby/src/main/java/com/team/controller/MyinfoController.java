package com.team.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.vo.GroupVO;
import com.team.myinfo.dao.MyinfoDAO;
import com.team.myinfo.service.MyinfoService;
import com.team.myinfo.vo.MyinfoVO;

@Controller
public class MyinfoController {

	@Autowired
	private MyinfoService myinfoService;

	@GetMapping("/mypage.do")
	public ModelAndView gomypage() {
		ModelAndView mv = new ModelAndView("mypage/info");
		List<MyinfoVO> list = myinfoService.getMyinfo();
		mv.addObject("list", list);
		return mv;
	}


}
