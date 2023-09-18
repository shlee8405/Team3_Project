package com.team.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.popup.service.PopupService;
import com.team.popup.vo.PopupVO;
import com.team.user.service.UserService;

@Controller
public class PopupController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PopupService popupService;

	@RequestMapping("/Popup.do")
	public ModelAndView Popup() {
		ModelAndView mv = new ModelAndView("admin/Popup");
		List<PopupVO> list = popupService.SelectPopup();
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/Popup2.do")
	@ResponseBody
	public ResponseEntity<List<PopupVO>> getPopupData() {
	    List<PopupVO> list = popupService.SelectPopup();
	    
	    for (PopupVO popupVO : list) {
	    	System.out.println(popupVO.getPop_content());
		}
	    return ResponseEntity.ok(list);
	}
	
	@RequestMapping("/PopupWrite.do")
	public ModelAndView PopupWrite() {
		ModelAndView mv = new ModelAndView("admin/PopupWrite");
		return mv;
	}
	
	
	@RequestMapping("/insert_Popup.do")
	public ModelAndView Insert_Popup(PopupVO vo) {
		ModelAndView mv = new ModelAndView("redirect:/Popup.do");
		int res = popupService.Insert_Popup(vo);
		return mv;
	}
	

}
