package com.team.controller.admin;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team.mpimg.service.MpimgService;
import com.team.mpimg.vo.MPIVO;

@Controller
public class mainpagemodifier {

	
	@Autowired
	private MpimgService mpimgService;
	
	@RequestMapping("/fetchmainpageimg.do")
	@ResponseBody
	public ResponseEntity<List<MPIVO>> fetchmainpageimages() {
		List<MPIVO> list = mpimgService.getImages();
		return ResponseEntity.ok(list);
	}
	
	@PostMapping("/uploadMPImage.do")
	public ModelAndView uploadMPImage(MPIVO mpivo , HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminMainPageModifier.do");
		try {
			String path = session.getServletContext().getRealPath("/resources/background");
			MultipartFile vo_file = mpivo.getFile();
			System.out.println("file name in /uploadMPImage.do is : " + vo_file.getName());
			
			if(vo_file.isEmpty()) { // didn't receive file
				System.out.println("file is empty in /uploadMPImage.do");
				session.setAttribute("adminActionControl", "emptyfile");
				return mv;
			} else {
				int res = mpimgService.uploadImage(mpivo);
				if(res>0) {	// insert successful
					String idx = mpimgService.getMaxIdx();
					String extension = FilenameUtils.getExtension(vo_file.getOriginalFilename());
					String imgname = "background"+idx+"."+extension;
					System.out.println("img name is : "+imgname);
					mpivo.setMp_idx(idx);
					mpivo.setMp_imgname(imgname);
					int res2 = mpimgService.insertImgname(mpivo);
					byte[] in = vo_file.getBytes();
					File out = new File(path, imgname);
					if(out.exists()) {
						out.delete();
						FileCopyUtils.copy(in, out);
						System.out.println("file deleted and copied in : " + path );
					} else {
						FileCopyUtils.copy(in, out);
						System.out.println("file copied in : "+ path);
					}
				} else { // insert fail
					System.out.println("insert failed in /uploadMPImage.do");
					
				}
				
			}
			
		} catch (Exception e) {
			System.out.println("try failed in /uploadMPImage.do");
		}
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
