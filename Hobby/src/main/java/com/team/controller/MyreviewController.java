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
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class MyreviewController {
	@Autowired
	private MyReviewService myReviewService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/myreview.do")
	public ModelAndView gomyreview(HttpServletRequest request) {
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		ModelAndView mv = new ModelAndView("mypage/review");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		String u_id = Ulist.get(0).getU_id();
		List<MyReviewVO> list = myReviewService.getMyReview(u_id);
		mv.addObject("list", list);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}
}
