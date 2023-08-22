package com.team.camp.service;

public interface CampService {

	// 좋아요 수 증가
	int increaseLikeCount(String u_id, String facltNm);
	
	// 좋아요 중복 확인
	int checkLike(String u_id, String facltNm);
	
	// 업데이트 된 좋아요 수 가져오기
	int getLikes(String facltNm);
}
