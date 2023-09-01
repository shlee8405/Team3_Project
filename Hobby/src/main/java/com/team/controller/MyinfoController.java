package com.team.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.myinfo.service.MyinfoService;
import com.team.myinfo.vo.MyinfoVO;
import com.team.myinfoupdate.service.MyinfoUpdateService;
import com.team.myinfoupdate.vo.MyinfoUpdateVO;
import com.team.qna.vo.QnaVO;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class MyinfoController {

	@Autowired
	private MyinfoService myinfoService;
	@Autowired
	private UserService userService;
	@Autowired
	private MyinfoUpdateService myinfoUpdateService;

	@RequestMapping("/mypage.do")
	public ModelAndView gomyreview(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("mypage/info");
		String l_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(l_idx);
		List<MyinfoVO> list = myinfoService.getMyinfo(l_idx);
		mv.addObject("list", list);
		mv.addObject("user", Ulist.get(0));
		return mv;
	}
	// 수정하는 페이지로 이동하는 컨트롤러
	@RequestMapping("/myPageEdit.do")
    public ModelAndView goMyPageEdit(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("mypage/update");
        String l_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(l_idx);
        List<MyinfoUpdateVO> list = myinfoUpdateService.getMyinfoUpdate();
        mv.addObject("list", list);
        mv.addObject("user", Ulist.get(0));
        return mv;
    }
	 
	// 수정하는 페이지 컨트롤러 
	 @RequestMapping("/myPageEdit2.do") 
	    public ModelAndView updateMyPage(MyinfoVO vo) {
	        ModelAndView mv = new ModelAndView("redirect:/mypage.do");
	        int res = myinfoService.updateMyinfo(vo);
	        return mv;
	    }
	}
