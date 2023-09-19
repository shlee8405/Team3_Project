package com.team.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.mpimg.service.MpimgService;
import com.team.mpimg.vo.MPIVO;

@Controller
public class mainpagemodifier {

	
	@Autowired
	private MpimgService mpimgService;
	
	@PostMapping("/uploadMPImage.do")
	public ModelAndView uploadMPImage(MPIVO mpivo , HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminMainPageModifier.do");
		
		/*
		if (empty file) { // if file is empty RETURN ERROR
			return ERRORORORORROROROR
			return mv;
		}	
		
		try {
			String filename = getfile    // get file as multipart from front-end
			
			
			
			int res = file copy (path, filname) // CAN UPLOAD FILE?
			
			if (res > 0 ) {    // IF YES, 	 
				int res2 = DAO.insert(mpivo) // ADD INTO DB ASWELL 
				if (res > 0 ) {  // IF SUCCESS 
					session.setAttribute(success , success)   //SUCCESSS
					return mv;	
				} else  {
					session.setattribute(error with DB)   //DB INSERT FAIL
					return mv;
				}
			} else {
				session.setAttribute(ERROR WITH FILEUPLOAD)  // fileupload FAIL
				return mv;
			} 
		}
		   
		   
		   
		    
		    
		    
		    
		   */
		
		return mv;
	}
	
	
	@PostMapping("/deleteMPImage.do")
	public ModelAndView deleteMPImage(MPIVO mpivo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminMainPageModifier.do");
		
		/*
		 
		 try {
		 	file.delete(); //TRY DELETING FIRST, IF SUCCESS WILL CONTINUE
		 
			int res = DAO.deleteMPImg(mpivo); // TRY DELETING WITH mpivo. IDX
			 
			if(res>0) {	// SUCCESS DELETING
			 	session.setAttribute(SUCCESS DELETING MPIDB)
			} else {
				session.setATtribute(ERROR DELETING MPIDB)
			}
		 } catch {
		 	"ERROR DELETING FILE"
		 }
		 
		 
		 */
		
		return mv;
	}
	
	@PostMapping("/updateMPImage.do")
	public ModelAndView updateMPImage(MPIVO mpivo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminMainPageModifier.do");
		
		
		
		return mv;
	}
	
}
