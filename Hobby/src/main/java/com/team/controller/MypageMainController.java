package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.myinfo.vo.MyinfoVO;
import com.team.mypagemain.service.MypageMainService;
import com.team.mypagemain.vo.MypageMainVO;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class MypageMainController {

	@Autowired
	private MypageMainService mypageMainService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/myPagemain.do")
	public ModelAndView gomypagemain(HttpServletRequest request) {
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		ModelAndView mv = new ModelAndView("mypage/main");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		String u_id = Ulist.get(0).getU_id();
		List<MypageMainVO> list = mypageMainService.getMypageMain(u_id);
		mv.addObject("list", list);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}
}
