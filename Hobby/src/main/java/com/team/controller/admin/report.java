package com.team.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.faq.vo.FaqVO;
import com.team.report.service.ReportService;
import com.team.report.vo.ReportVO;
import com.team.user.service.UserService;
import com.team.user.vo.UserVO;

@Controller
public class report {
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private UserService userService;
	
	// 상세 검색
	@GetMapping("/adminReportDetailSearch")
	public ModelAndView adminReportDetailSearch(@RequestParam("text") String text, @RequestParam("query") String subject, HttpSession session) {
		ModelAndView mv = new ModelAndView("admin/report");
		System.out.println("text is "+text);
		System.out.println("subject is "+subject);
		List<UserVO> userlist = userService.getAllUsers();
		mv.addObject("userlist" , userlist);
		
		if (subject.equals("1")) {
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<ReportVO> list = reportService.getListByTitle(newText);
			mv.addObject("list", list);
			return mv;
		} else if (subject.equals("2")) {
			String newText = "%"+text+"%";
			System.out.println("newText is "+ newText);
			List<ReportVO> list = reportService.getListByNickname(newText);
			mv.addObject("list",list);
		} 
		return mv;
	}
	
	@RequestMapping("/updateReportAdmin")
	public ModelAndView updateReportAdmin(ReportVO rvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminReport.do");
		int res = reportService.getUpdateReportByRVO(rvo);
		if(res>0) session.setAttribute("adminActionControl", "update");
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	
	@RequestMapping("/deleteReportAdmin")
	public ModelAndView deleteReportAdmin(ReportVO rvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminReport.do");
		System.out.println("/deleteReportAdmin idx : "+rvo.getR_idx());
		int res = reportService.getDeleteReportByRVO(rvo); 
		if(res>0) session.setAttribute("adminActionControl", "delete"); 
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	
	@RequestMapping("/reviveReportAdmin")
	public ModelAndView reviveReportAdmin(ReportVO rvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminReport.do");
		System.out.println("/reviveReportAdmin idx : "+rvo.getR_idx());
		int res = reportService.getReviveReportByRVO(rvo); 
		if(res>0) session.setAttribute("adminActionControl", "revive"); 
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	
	@RequestMapping("/banUserReportAdmin")
	public ModelAndView banUserReportAdmin(ReportVO rvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminReport.do");
		System.out.println(rvo.getU_idx2());
		System.out.println(rvo.getR_idx());
		int res = reportService.getBanUserReportAdmin(rvo); 
		if(res>0) session.setAttribute("adminActionControl", "ban");
		else session.setAttribute("adminActionControl", "error");		
		return mv;
	}
}
