package com.team.controller.admin;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.service.GroupService;
import com.team.group.vo.GroupVO;
import com.team.groupuser.service.GroupuserService;
import com.team.groupuser.vo.GroupuserVO;
import com.team.qna.vo.QnaVO;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class group {
	@Autowired
	private GroupuserService groupuserService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/adminGroupPageDetailSearch")
	public ModelAndView adminGroupPageDetailSearch(@RequestParam("text") String text, @RequestParam("query") String subject, HttpSession session) {
		ModelAndView mv = new ModelAndView("admin/group");
		System.out.println("text is "+text);
		System.out.println("subject is "+subject);
		List<UserVO> userlist = userService.getAllUsers();
		List<GroupuserVO> groupuserlist = groupuserService.getAllList();
		mv.addObject("userlist" , userlist);
		
		if (subject.equals("1")) {
			// 생성자
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<GroupVO> list = groupService.getListByNickname(newText);
			mv.addObject("list", list);
			mv.addObject("userlist", userlist);
			mv.addObject("groupuserlist", groupuserlist);
			return mv;
		} else if (subject.equals("2")) {
			// 제목
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<GroupVO> list = groupService.getListByTitle(newText);
			mv.addObject("list", list);
			mv.addObject("userlist", userlist);
			mv.addObject("groupuserlist", groupuserlist);
		} else if (subject.equals("3")) {
			// 날짜
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			System.out.println();
			List<GroupVO> list = groupService.getListByDate(newText);
			mv.addObject("list", list);
			mv.addObject("userlist", userlist);
			mv.addObject("groupuserlist", groupuserlist);
		} else if (subject.equals("4")) {
			// 위치
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<GroupVO> list = groupService.getListByLocation(newText);
			mv.addObject("list", list);
			mv.addObject("userlist", userlist);
			mv.addObject("groupuserlist", groupuserlist);
		}  
		
		return mv;
	}
	
	
	@RequestMapping("/deleteGroupAdmin") 
	public ModelAndView deleteGroupAdmin(GroupVO gvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminGroup.do");
		int res = groupService.getGroupDelete(gvo);
		if(res>0) session.setAttribute("adminActionControl", "delete");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	
	@RequestMapping("/reviveGroupAdmin")
	public ModelAndView reviveGroupAdmin(GroupVO gvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminGroup.do");
		int res = groupService.getGroupRevive(gvo);
		if(res>0) session.setAttribute("adminActionControl", "revive");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	
	@PostMapping("/groupInsertAdmin.do")
	public ModelAndView groupInsertAdmin(@ModelAttribute ("file") MultipartFile file,
			GroupVO gvo, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminGroup.do");
		try {
			System.out.println("uidx is " + gvo.getU_idx());
			String path = request.getSession().getServletContext().getRealPath("/resources/images");
			MultipartFile f_param = gvo.getFile();
			 // g_cdo와 g_gugun 값을 출력해 보거나 사용합니다.
	        System.out.println("Selected g_cdo: " + gvo.getG_cdo());
	        System.out.println("Selected g_gugun: " + gvo.getG_gugun());
			if (f_param.isEmpty()) {
				gvo.setG_fname("");
			}else {
				// DB에 저장할 파일 이름을 변경하자  
				UUID uuid = UUID.randomUUID();
				String g_fname = uuid.toString()+"_"+gvo.getFile().getOriginalFilename();
				gvo.setG_fname(g_fname);
				
				// 이미지 /resources/images 저장하기
				byte[] in = gvo.getFile().getBytes();
				File out = new File(path, g_fname);
				FileCopyUtils.copy(in, out);
			}
			int res = groupService.getGroupAdminWrite(gvo);
			if(res >0) {
				session.setAttribute("adminActionControl", "create");
				return mv;
			}else {
				session.setAttribute("adminActionControl", "error");
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("adminActionControl", "error");
			return mv;
		}
	}
}
