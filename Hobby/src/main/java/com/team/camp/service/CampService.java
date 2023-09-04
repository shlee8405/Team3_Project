package com.team.camp.service;

import java.util.List;

import com.team.camp.vo.ReviewVO;

public interface CampService {

	// 좋아요 수 증가
	int addLike(String u_idx, String facltNm);

	// 좋아요 수 가져오기
	int getLikes(String facltNm);

	// 찜하기
	int addWish(String u_Idx, String facltNm);
	
	// 찜하기 수 가져오기
	int getWish(String facltNm);
	
	// 후기
	public void addReview(String facltNm, String u_Idx, String comment, int rating);
	List<ReviewVO> getReviews(String facltNm);
	double getAverageRating(String facltNm);
	
	// 후기 삭제
	public void deleteReview(int id, String u_idx);
}