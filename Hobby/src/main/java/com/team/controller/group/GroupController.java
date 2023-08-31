package com.team.controller.group;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import com.team.commons.Paging;
import com.team.group.service.GroupService;
import com.team.group.vo.GroupCmtVO;
import com.team.group.vo.GroupVO;
import com.team.user.vo.UserVO;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private Paging paging;
	
	@RequestMapping("/groupList.do")
	 public ModelAndView getAllGroups(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("group/groupList");
		
		// 전체 게시물의 수
		int count = groupService.getTotalCount();
		paging.setTotalRecord(count);
		System.out.println(count);
		// 전체 페이지의 수
		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
			paging.setTotalPage(1);
		} else {
			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
				paging.setTotalPage(paging.getTotalPage() + 1);
			}
		}
		// 현재 페이지
		String cPage = request.getParameter("cPage");
		if (cPage == null) {
			paging.setNowPage(1);
			System.out.println("1페");
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
			System.out.println(cPage+"그외페");
		}

		// offset = limit * (현재페이지-1);
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));
		System.out.println(paging);
		// 시작블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);

		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);

		// 주의사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<GroupVO> glist = groupService.getAllGroups(paging.getOffset(), paging.getNumPerPage());
		mv.addObject("glist", glist);
		mv.addObject("paging", paging);
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
	public ModelAndView getGroupOnelist(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("group/groupOnelist");
		String g_idx = request.getParameter("g_idx");
		String cPage = request.getParameter("cPage");
		// 사용자 정보 가져오기
        //UserVO userInfo = (UserVO) session.getAttribute("userInfo");
		
		// 상세보기
		GroupVO gvo = groupService.getGroupOnelist(g_idx);
		// 댓글 가져오기
		List<GroupCmtVO> gc_list = groupService.getCommList(g_idx);
		
		mv.addObject("uvo", new UserVO().getU_id());
		mv.addObject("gvo", gvo);
		mv.addObject("gc_list",gc_list);
		mv.addObject("cPage", cPage);
		//mv.addObject("uvo", userInfo);
		
		// 사용자의 u_idx를 이용하여 사용자 정보 가져오기
        /*UserVO user = groupService.getUserCmtInfo(userInfo.getU_idx());
        mv.addObject("user", user);*/
		return mv;
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
	
	@PostMapping("/groupUpdate.do")
	public ModelAndView getGroupUpdate(GroupVO gvo, HttpServletRequest request,
			//@ModelAttribute("cPage") String cPage,
			@ModelAttribute("g_idx") String g_idx) {
		ModelAndView mv = new ModelAndView();
		String path = request.getSession().getServletContext().getRealPath("/resources/images");
		MultipartFile f_param = gvo.getFile();
		if (f_param.isEmpty()) {
			gvo.setG_fname(gvo.getG_oldfname());
		} else {
			// 같은 이름의 파일 없도록 UUID 사용
			UUID uuid = UUID.randomUUID();
			String g_fname = uuid.toString() + "_" + gvo.getFile().getOriginalFilename();
			gvo.setG_fname(g_fname);

			// 이미지 저장
			try {
				byte[] in = gvo.getFile().getBytes();
				File out = new File(path, g_fname);
				FileCopyUtils.copy(in, out);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int result = groupService.getGroupUpdate(gvo);
		  
		 mv.setViewName("redirect:/group_onelist.do?g_idx="+gvo.getG_idx());
		return mv;
	}
	
}