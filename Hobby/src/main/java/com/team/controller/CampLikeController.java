package com.team.controller;


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
	public ResponseEntity<Map<String, Object>> incrementLike(@RequestParam String facltNm) {
		System.out.println("좋아요 컨트롤러:::" + facltNm);
		
		// 좋아요 수 증가
		int updatedLikesCount = campService.increaseLikeCount(facltNm);
		
		// 업데이트 된 좋아요 수 가져오기
		int likesCount = campService.getLikes(facltNm);
		
		// 빈 HashMap 생성
		Map<String, Object> response = new HashMap<>();
		
		// HashMap에 좋아요 수 담아서 보내기
		response.put("likesCount", likesCount);
		return ResponseEntity.ok(response);
	}
	
//	CREATE TABLE camp_likes (
//	    camp_id INT AUTO_INCREMENT PRIMARY KEY, 
//	    facltNm VARCHAR(255) UNIQUE,
//	    likes_count INT UNSIGNED DEFAULT 0
//	);
}