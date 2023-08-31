package com.team.camp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.camp.dao.CampDAO;
import com.team.camp.vo.ReviewVO;

@Service
public class CampServiceImpl implements CampService {

	@Autowired
	private CampDAO campDAO;

	// 좋아요 수 증가
	@Override
	public int addLike(String u_id, String facltNm) {
		// 중복 체크
		int check = campDAO.checkLike(u_id, facltNm);

		if (check > 0) {
			// 좋아요 취소
			System.out.println("좋아요 취소:::" + check);

			campDAO.removeLike(u_id, facltNm);
			return -1; // 취소 성공값으로 -1 보내기.
		} else {
			// 좋아요 추가
			System.out.println("좋아요 성공:::" + check);
			return campDAO.addLike(u_id, facltNm); // 성공값으로 1 반환
		}
	}

	// 좋아요 수 가져오기
	@Override
	public int getLikes(String facltNm) {
		return campDAO.getLikeCount(facltNm);
	}

	// 찜하기 수 증가
	@Override
	public int addWish(String u_id, String facltNm) {
		// 찜하기 중복 체크
		int check = campDAO.checkWish(u_id, facltNm);

		if (check > 0) {
			// 찜하기 취소
			System.out.println("찜하기 취소:::" + check);

			campDAO.removeWish(u_id, facltNm);
			return -1; // 취소 성공값으로 -1 보내기.
		} else {
			// 찜하기 추가
			System.out.println("찜하기 성공:::" + check);
			return campDAO.addWish(u_id, facltNm); // 성공값으로 1 반환
		}
	}

	// 찜하기 수 가져오기
	@Override
	public int getWish(String facltNm) {
		return campDAO.getWishCount(facltNm);
	}

	// 후기, 별점 추가
	@Override
	public void addReview(String facltNm, String u_Id, String comment, int rating) {
	    campDAO.addReview(facltNm, u_Id, comment, rating);
	}

	// 해당 캠핑장의 모든 후기와 별점 가져오기
	@Override
	public List<ReviewVO> getReviews(String facltNm) {
		return campDAO.getReviews(facltNm);
	}

	// 해당 캠핑장 평균 별점 가져오기
	@Override
	public double getAverageRating(String facltNm) {
		return campDAO.getAverageRating(facltNm);
	}
}
