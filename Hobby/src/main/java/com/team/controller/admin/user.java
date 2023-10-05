package com.team.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class user {

	@Autowired
	private  UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	// 회원가입 DB 저장 실행
	@PostMapping("/signupGoAdmin.do")
	public ModelAndView getUserInsert(UserVO uvo) {
		ModelAndView mv = new ModelAndView("redirect:/adminUser.do");
		//비밀번호 암호화
		String newPass = passwordEncoder.encode(uvo.getU_pw());
		//setter in vo
		uvo.setU_pw(newPass);
		
		//비밀번호 암호화 상태로 DB 저장
		int result = userService.getUserInsert(uvo);
		return mv;
	}
	@PostMapping("/signupGoAdminAdmin.do")
	public ModelAndView getUserAdminInsert(UserVO uvo) {
		ModelAndView mv = new ModelAndView("redirect:/adminUser.do");
		//비밀번호 암호화
		String newPass = passwordEncoder.encode(uvo.getU_pw());
		//setter in vo
		uvo.setU_pw(newPass);
		
		//db저장
		int result = userService.getAdminInsert(uvo);
		return mv;
	}
	
	
	@GetMapping("/banUserAdmin")
	public ModelAndView banUserAdmin(@RequestParam("idx") String idx, HttpSession session) {
//		System.out.println("ban : " + idx);
		ModelAndView mv = new ModelAndView("redirect:/adminUser.do");
		
		int res = userService.getBanUser(idx);
		if(res>0)session.setAttribute("adminActionControl", "ban");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	@GetMapping("/unbanUserAdmin")
	public ModelAndView unbanUserAdmin(@RequestParam("idx") String idx, HttpSession session) {
//		System.out.println("ban : " + idx);
		ModelAndView mv = new ModelAndView("redirect:/adminUser.do");
		
		int res = userService.getUnbanUser(idx);
		if(res>0)session.setAttribute("adminActionControl", "unban");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	@GetMapping("/deleteUserAdmin")
	public ModelAndView deleteUserAdmin(@RequestParam("idx") String idx, HttpSession session) {
//		System.out.println("delete : " + idx);
		ModelAndView mv = new ModelAndView("redirect:/adminUser.do");
		
		int res = userService.getDeleteUser(idx);
		if(res>0)session.setAttribute("adminActionControl", "delete");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	@RequestMapping("/updateUserAdmin")
	public ModelAndView updateUserAdmin(UserVO uvo, HttpSession session) {
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
	}
	
	@GetMapping("/adminUserPageDetailSearch")
	public ModelAndView dEtAiLsEaRcHaDmInPaGe(
			@RequestParam("text") String text, 
			@RequestParam("query") String subject, 
			HttpSession session) {
		ModelAndView mv = new ModelAndView("admin/user");
		if (subject.equals("1")) {
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<UserVO> list = userService.getUsersWithNickname(newText);
			mv.addObject("list", list);
			return mv;
		} else if (subject.equals("2")) {
			String newText = text+"%";
			System.out.println("newText is "+ newText);
			List<UserVO> list = userService.getUsersWithBirthday(newText);
			mv.addObject("list",list);
		} else if (subject.equals("3")) {
			String newText = "%"+text;
			System.out.println("newText is "+ newText);
			List<UserVO> list = userService.getUsersWithPhone(newText);
			mv.addObject("list",list);
		}
		return mv;
	}
}
