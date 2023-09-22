package com.team.controller.admin;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		try {
			String path = session.getServletContext().getRealPath("/resources/background");
			MultipartFile vo_file = mpivo.getFile();
//			System.out.println("file name in /uploadMPImage.do is : " + vo_file.getName());
			
			if(vo_file.isEmpty()) { // didn't receive file
//				System.out.println("file is empty in /uploadMPImage.do");
				session.setAttribute("adminActionControl", "emptyfile");
				return mv;
			} else {
				int res = mpimgService.uploadImage(mpivo);
				if(res>0) {	// insert successful
					String idx = mpimgService.getMaxIdx();
					String extension = FilenameUtils.getExtension(vo_file.getOriginalFilename());
					String imgname = "background"+idx+"."+extension;
//					System.out.println("img name is : "+imgname);
					mpivo.setMp_idx(idx);
					mpivo.setMp_imgname(imgname);
					int res2 = mpimgService.insertImgname(mpivo);
					byte[] in = vo_file.getBytes();
					File out = new File(path, imgname);
					if(out.exists()) {
						out.delete();
						FileCopyUtils.copy(in, out);
//						System.out.println("file deleted and copied in : " + path );
					} else {
						FileCopyUtils.copy(in, out);
//						System.out.println("file copied in : "+ path);
					}
				} else { // insert fail
					System.out.println("insert failed in /uploadMPImage.do");
				}
			}
		} catch (Exception e) {
			System.out.println("try failed in /uploadMPImage.do");
		}
		return mv;
	}
	
	
	@GetMapping("/deleteMPImage.do")
	public ModelAndView deleteMPImage(@RequestParam("idx") String idx,
			@RequestParam("imgname") String imgname ,
			HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminMainPageModifier.do");
		MPIVO mpivo = new MPIVO();
		mpivo.setMp_idx(idx);
		int res = mpimgService.deleteImage(mpivo);
		if(res>0) {
			session.setAttribute("adminActionControl", "delete");
			try {
				String path = session.getServletContext().getRealPath("/resources/background");
				File out = new File(path, imgname);
				out.delete();
			} catch (Exception e) {
				System.out.println("delete failed in try/catch : "+e);
			}
		} 
		else session.setAttribute("adminActionControl", "error");
		return mv;
	}
	
	@PostMapping("/updateMPImage.do")
	public ModelAndView updateMPImage(MPIVO mpivo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:/adminMainPageModifier.do");
		
		
		
		return mv;
	}
	
}
