package com.team.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.mpimg.service.MpimgService;
import com.team.mpimg.vo.MPIVO;
import com.team.popup.service.PopupService;
import com.team.popup.vo.PopupVO;
import com.team.user.service.UserService;

@Controller
public class PopupController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PopupService popupService;
	
	@Autowired
	private MpimgService mpimgService;

	@RequestMapping("/Popup.do")/*팝업관리 이동*/
	public ModelAndView Popup() {
		ModelAndView mv = new ModelAndView("admin/Popup");
		List<PopupVO> list = popupService.SelectPopup();
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/Popup2.do")/*팝업창에 넣기*/
	@ResponseBody
	public ResponseEntity<List<Object>> getPopupData() {
	    List<PopupVO> list = popupService.SelectPopup();
	    List<MPIVO> imglist = mpimgService.getImages();
	    List<Object> list2 = new ArrayList<Object>();
	    list2.add(list);
	    list2.add(imglist);
	    return ResponseEntity.ok(list2);
	}
	
	@RequestMapping("/PopupWrite.do")/*팝업 작성 이동*/
	public ModelAndView PopupWrite() {
		ModelAndView mv = new ModelAndView("admin/PopupWrite");
		return mv;
	}
	
	
	@RequestMapping("/insert_Popup.do")/*팝업 작성하기*/
	public ModelAndView Insert_Popup(PopupVO vo) {
		ModelAndView mv = new ModelAndView("redirect:/Popup.do");
		int res = popupService.Insert_Popup(vo);
		return mv;
	}
	
	@RequestMapping("/delete_Popup.do")/*팝업 삭제하기*/
	public ModelAndView Delete_Popup(@RequestParam("pop_idx")String idx) {
		ModelAndView mv = new ModelAndView("redirect:/Popup.do");
		int res = popupService.Delete_Popup(idx);
		return mv;
	}
	
	@RequestMapping("/update_Popup.do")/*수정 페이지로 이동*/
	public ModelAndView Update_Popup(@ModelAttribute("PopupVo")PopupVO popupVO) {
		ModelAndView mv = new ModelAndView("admin/PopupUpdate");
		popupVO = popupService.selectOne(popupVO);
		mv.addObject("popvo",popupVO);
		return mv;
	}
	
	@RequestMapping("/update.do")/*수정하기*/
	public ModelAndView Update(PopupVO popvo) {
		ModelAndView mv = new ModelAndView("redirect:/Popup.do");
		int res = popupService.Update(popvo);
		return mv;
	}

}
