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
	@PostMapping("/likeCamp.do")
	public ResponseEntity<Map<String, Object>> incrementLike(@RequestParam String u_id, @RequestParam String facltNm) {
		System.out.println("좋아요 컨트롤러:::" + facltNm);
		
		// 좋아요 수 증가
		int result = campService.increaseLikeCount(u_id, facltNm);
		
		// 빈 HashMap 생성
		Map<String, Object> response = new HashMap<>();
		
		if (result > 0) {
			// 업데이트 된 좋아요 수 가져오기
			int likesCount = campService.getLikes(facltNm);
			
			// HashMap에 좋아요 수와 메시지를 담아서 보낸다.
			response.put("likesCount", likesCount);
			response.put("message", "좋아요 성공");
		} else {
			// result = 0이면 중복이라고 Service에서 설정함.
			response.put("message", "이미 좋아요한 캠핑장입니다.");
		}
			return ResponseEntity.ok(response);
	}
	
//	CREATE TABLE camp_likes (
//	    camp_id INT AUTO_INCREMENT PRIMARY KEY, 
//	    facltNm VARCHAR(255) UNIQUE,
//	    likes_count INT UNSIGNED DEFAULT 0
//	);
}