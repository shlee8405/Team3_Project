package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.team.myreview.service.MyReviewService;
import com.team.myreview.vo.MyReviewVO;

@Controller
public class MyreviewController {
	@Autowired
	private MyReviewService myReviewService;
	
	@GetMapping("/myreview.do")
	public ModelAndView gomyreview(@ModelAttribute("u_idx") String u_idx,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage/review");
		List<MyReviewVO> list = myReviewService.getMyReview();
		mv.addObject("list", list);
		return mv;
	}
}
