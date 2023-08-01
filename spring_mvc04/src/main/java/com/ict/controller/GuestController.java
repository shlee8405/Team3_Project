package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.model.service.GuestService;
import com.ict.model.service.GuestServiceImpl;
import com.ict.model.vo.GuestBookVO;

@Controller
public class GuestController {
	@Autowired
	private GuestServiceImpl guestServiceimpl;

	
	
	public GuestServiceImpl getGuestService() {
		return guestServiceimpl;
	}



	public void setGuestService(GuestServiceImpl guestServiceimpl) {
		this.guestServiceimpl = guestServiceimpl;
	}

	// 일처리(DB)가 있으면 서비스로 가자`

	@GetMapping("/Guestbook_list.do")
	public ModelAndView getGuestList() {
		ModelAndView mv = new ModelAndView("guest/list");
		List<GuestBookVO> list = guestServiceimpl.guestList();
		mv.addObject("list",list);
		return mv;
	}
	@GetMapping("/guestbookAddForm.do")
	public ModelAndView getGuestBookAddForm() {
		return new ModelAndView("guest/write");
	}
	@PostMapping("/guestbook_writeOK.do")
		public ModelAndView getGuestBookInsert(GuestBookVO gvo) {
			ModelAndView mv = new ModelAndView("redirect:/Guestbook_list.do");		
			int result = guestServiceimpl.getGuestBookInsert(gvo);
			return mv;
		}
	

}
