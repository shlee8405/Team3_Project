package com.team.controller.camp;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.team.camp.service.CampService;

@RestController
public class CampLikeController {
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private CampService campService;
	
	
	// 좋아요 기능
		@PostMapping("/addLike.do")
		public Map<String, Object> addLike(@RequestParam String u_id, @RequestParam String facltNm) {
		    // 좋아요 수 증가 또는 감소
		    int result = campService.addLike(u_id, facltNm);
		    
		    Map<String, Object> response = new HashMap<>();
		    
		    System.out.println("addLike result:::" + result);

		    if (result == 1) {
		        response.put("message", "좋아요 성공");
		    } else if (result == -1) {
		        response.put("message", "좋아요 취소");
		    } else {
		        response.put("message", "좋아요 중복 또는 오류");
		    }

		    // 업데이트 된 좋아요 수 가져오기 : 화면에 바로 업데이트 시키기 위해 보냄.
		    int likesCount = campService.getLikes(facltNm);
		    response.put("likesCount", Integer.toString(likesCount));  // int를 String으로 변환하여 저장

		    return response; // { message:"좋아요 성공", likesCount:"2" } 
		}
	
//	CREATE TABLE camp_likes (
//	    camp_id INT AUTO_INCREMENT PRIMARY KEY, 
//	    facltNm VARCHAR(255) UNIQUE,
//	    likes_count INT UNSIGNED DEFAULT 0
//	);
}