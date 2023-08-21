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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.group.service.GroupService;
import com.team.group.vo.GroupVO;


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
		return new ModelAndView("group/groupWrite");
	}
    
	@PostMapping("/groupInsert.do")
	public ModelAndView getGroupWriteOk(GroupVO gvo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/groupList.do");
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/images");
			
			MultipartFile f_param = gvo.getFile();
			
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
			return mv;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	
}