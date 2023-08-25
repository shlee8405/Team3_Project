package com.team.camp.service;

public interface CampService {

	// 좋아요 수 증가
	int addLike(String u_id, String facltNm);

	// 좋아요 수 가져오기
	int getLikes(String facltNm);

	// 찜하기
	int addWish(String userId, String facltNm);
	
	// 찜하기 수 가져오기
	int getWish(String facltNm);
}
