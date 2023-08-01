package com.ict.common;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class Summer_Controller {
	@Autowired
	private FileReName fileReName;
	
	public FileReName getFileReName() {
		return fileReName;
	}

	public void setFileReName(FileReName fileReName) {
		this.fileReName = fileReName;
	}

	@PostMapping(value = "/saveimage.do")
	@ResponseBody
	public Map<String, String> saveImg(ImgVO vo, HttpServletRequest request){
		Map<String, String> map = new HashMap<String, String>();
		
		// 넘어온 파일 검증
		MultipartFile f = vo.getS_file();
		String fname = null;
		
		if(f.getSize()>0) {
			// 첨부파일 위치
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			fname = f.getOriginalFilename()	;
			
			
			// 같은 파일 이름이 있으면 업로드를 못하므로 이름을 변경 시켜야 한다.
			// 단, 한번이상은 안된다. (나중에 겹치지 않게 만들어야 한다.)
			fname = fileReName.exec(path, fname);
			System.out.println("fname : " + fname);
			// 업로드
			try {
				f.transferTo(new File(path, fname));
			} catch (IllegalStateException e) {	
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 비동기식 요청이므로 저장된 파일에 경로와 파일명을 보내야 한다.
			String path2 = request.getContextPath();
			map.put("path", "/resources/upload");
			map.put("fname", fname);	
			
			// pom.xml에 json변환 해주는 라이브러리 추가
			return map;
		}
		return null;
	}
}
