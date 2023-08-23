package com.team.controller.group;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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
import com.team.user.vo.UserVO;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	
	@RequestMapping("/groupList.do")
	 public ModelAndView getAllGroups() {
		ModelAndView mv = new ModelAndView("group/groupList");
		List<GroupVO> glist = groupService.getAllGroups();
		mv.addObject("glist", glist);
        return mv;
    }
	@GetMapping("/group_writeForm.do")
	public ModelAndView getGroupWriteForm() {
		ModelAndView mv = new ModelAndView("group/groupWrite");
		mv.addObject("uvo", new UserVO().getU_nickname());
		return mv;
	}
    
	@PostMapping("/groupInsert.do")
	public ModelAndView getGroupWriteOk(@ModelAttribute ("file") MultipartFile file,
			GroupVO gvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/groupList.do");
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/images");
			System.out.println(gvo.getFile());
			MultipartFile f_param = gvo.getFile();
			System.out.println(f_param);
			System.out.println(file.getName());
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
			int res = groupService.getGroupWriteOk(gvo);
			if(res >0) {
				 return mv;
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@GetMapping("/group_onelist.do")
	public ModelAndView getGroupOnelist(@RequestParam("g_idx")String g_idx) {
		ModelAndView mv = new ModelAndView("group/groupOnelist");
		try {
			GroupVO gvo = groupService.getGroupOnelist(g_idx);
			mv.addObject("gvo", gvo);
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@PostMapping("/groupDelete.do")
	public ModelAndView getGroupDelete(GroupVO gvo) {
		ModelAndView mv = new ModelAndView("redirect:/groupList.do");
		int result = groupService.getGroupDelete(gvo);
		if (result == 1) {
			
		}else {
			
		}
		return mv;
	}
	@PostMapping("/groupUpdate_Form.do")
	public ModelAndView getGroupUpdateForm(String g_idx) {
		ModelAndView mv = new ModelAndView("group/groupUpdate");
		GroupVO gvo = groupService.getGroupOnelist(g_idx);
		mv.addObject("gvo",gvo);
		return mv;
	}
	
	
	
	
	
}