package com.team.controller.group;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.commons.Paging;
import com.team.group.service.GroupService;
import com.team.group.vo.GroupCmtVO;
import com.team.group.vo.GroupVO;
import com.team.groupuser.service.GroupuserService;
import com.team.groupuser.vo.GroupuserVO;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private Paging paging;
	@Autowired
	private UserService userService;
	@Autowired
	private GroupuserService groupuserService;
	
	@RequestMapping("/groupList.do")
	 public ModelAndView getAllGroups(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("group/groupList");
		
		// 전체 게시물의 수
		int count = groupService.getTotalCount();
		paging.setTotalRecord(count);
		
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
		// 시작블록과 끝블록 구하기
		paging.setBeginBlock(
				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);

		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
		
		// 주의사항
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		List<GroupVO> glist = groupService.getAllGroups(paging.getOffset(), paging.getNumPerPage());
		
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		if (u_idx != null) {
		    List<UserVO> Ulist = userService.getUsers(u_idx);
		    if (!Ulist.isEmpty()) {
		        mv.addObject("user", Ulist.get(0));
		    }
		}
		
		mv.addObject("glist", glist);
		mv.addObject("paging", paging);
        return mv;
    }
	
	@RequestMapping("/search.do")
	public ModelAndView searchGroups(
	        @RequestParam("title") String title, 
	        @RequestParam("city") String city,
	        @RequestParam("state") String state) {
		System.out.println("search");
	    
	    GroupVO gvo = new GroupVO();
	    gvo.setG_title(title);
	    gvo.setG_cdo(city);
	    gvo.setG_gugun(state);
	    gvo.setLimit(paging.getNumPerPage());
	 	gvo.setOffset(paging.getOffset());
	    
	    List<GroupVO> resultGroups = groupService.searchGroups(gvo);
	    
	        // 전체 게시물의 수
	 		paging.setTotalRecord(resultGroups.size());
	 		
	 		// 전체 페이지의 수
	 		if (paging.getTotalRecord() <= paging.getNumPerPage()) {
	 			paging.setTotalPage(1);
	 		} else {
	 			paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
	 			if (paging.getTotalRecord() % paging.getNumPerPage() != 0) {
	 				paging.setTotalPage(paging.getTotalPage() + 1);
	 			}
	 		}
	 		

	 		// offset = limit * (현재페이지-1);
	 		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));
	 		// 시작블록과 끝블록 구하기
	 		paging.setBeginBlock(
	 				(int) ((paging.getNowPage() - 1) / paging.getPagePerBlock()) * paging.getPagePerBlock() + 1);

	 		paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
	 		
	 		// 주의사항
	 		if (paging.getEndBlock() > paging.getTotalPage()) {
	 			paging.setEndBlock(paging.getTotalPage());
	 		}
	    
	    //ModelAndView modelAndView = new ModelAndView("group/groupSearchResult"); // Change to the new JSP page
	    ModelAndView modelAndView = new ModelAndView("group/groupList");
	    
	    modelAndView.addObject("glist", resultGroups);
	    modelAndView.addObject("paging", paging);
	    return modelAndView;
	}


	
	@GetMapping("/group_writeForm.do")
	public ModelAndView getGroupWriteForm(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("group/groupWrite");
		
		String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
		List<UserVO> Ulist = userService.getUsers(u_idx);
		mv.addObject("user", Ulist.get(0));
		
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
	@RequestMapping("/group_onelist.do")
	public ModelAndView getGroupOnelist(HttpServletRequest request, HttpSession session) {
	    ModelAndView mv = new ModelAndView("group/groupOnelist");
	    String g_idx = request.getParameter("g_idx");
	    String cPage = request.getParameter("cPage");
	    System.out.println(cPage);
	    String userIdx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
	    Date now = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    String formattedNow = sdf.format(now);
	    mv.addObject("now", formattedNow);
	  	    
	    // 참여 여부를 확인합니다.
	    int participationCount = groupService.checkUserParticipation(g_idx, userIdx);
	    boolean isParticipated = participationCount > 0;
	    mv.addObject("isParticipated", isParticipated);
	    
	    // 상세보기
	    GroupVO gvo = groupService.getGroupOnelist(g_idx);
	    
	    // 참여자 카운트
	    int maxPeople = Integer.parseInt(gvo.getG_maxPeople());
	    int curPeople = Integer.parseInt(gvo.getG_curPeople());
	    mv.addObject("maxPeople", maxPeople);
	    mv.addObject("curPeople", curPeople);
	    // 해당 그룹의 모든 참가자 목록을 가져옵니다.
	    List<GroupuserVO> groupuserlist = groupuserService.getAllList();
	    List<UserVO> userlist = userService.getAllUsers();
	    mv.addObject("groupUsers", groupuserlist);
	    mv.addObject("userlist",userlist);
	    mv.addObject("g_idx",g_idx);
	    mv.addObject("gvo", gvo);
	    
	    // 댓글 가져오기
	    List<GroupCmtVO> gc_list = groupService.getCommList(g_idx);
	    mv.addObject("gc_list", gc_list);
	    mv.addObject("cPage", cPage);
	    
	    return mv;
	}


	// 그룹 참여 또는 참여 취소 처리
	@RequestMapping("/joinGroup.do")
	@ResponseBody
	public Map<String, String> joinGroup(@RequestParam("g_idx") String g_idx, HttpServletRequest request) {
	    Map<String, String> result = new HashMap<>();
	    String u_idx = (String) request.getSession().getServletContext().getAttribute("sessionUidx");
	    
	    if (u_idx == null || u_idx.trim().isEmpty()) {
	        result.put("message", "로그인 필요");
	        return result;
	    }

	    int check = groupService.checkUserParticipation(g_idx, u_idx);

	    if (check > 0) {
	        groupService.removeParticipation(g_idx, u_idx);
	        groupService.decreaseGroupCount(g_idx);  // 참여 취소 시 g_curPeople 감소
	        result.put("message", "참여 취소");
	    } else {
	        groupService.addParticipation(g_idx, u_idx);
	        groupService.increaseGroupCount(g_idx);  // 참여 시 g_curPeople 증가
	        result.put("message", "참여 성공");
	    }
	    return result;
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