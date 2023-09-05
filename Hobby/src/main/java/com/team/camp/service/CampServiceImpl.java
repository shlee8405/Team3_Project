package com.team.camp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.camp.dao.CampDAO;
import com.team.camp.vo.ReviewVO;
import com.team.user.vo.UserVO;

@Service
public class CampServiceImpl implements CampService {

	@Autowired
	private CampDAO campDAO;

	// 상위 3개 캠핑장 이름을 가져오는 메소드
	@Override
	public List<String> getBest3() {
		return campDAO.getBest3();
	}

	// 좋아요 수 증가
	@Override
	public int addLike(String u_idx, String facltNm) {
		UserVO user = campDAO.getUserInfoByUidx(u_idx);

		// 중복 체크
		int check = campDAO.checkLike(u_idx, facltNm);

		if (check > 0) {
			// 좋아요 취소
			System.out.println("좋아요 취소:::" + check);

			campDAO.removeLike(u_idx, facltNm);
			return -1; // 취소 성공값으로 -1 보내기.
		} else {
			// 좋아요 추가
			System.out.println("좋아요 성공:::" + check);
			return campDAO.addLike(u_idx, user.getU_id(), user.getU_nickname(), facltNm); // 성공값으로 1 반환
		}
	}

	// 좋아요 수 가져오기
	@Override
	public int getLikes(String facltNm) {
		return campDAO.getLikeCount(facltNm);
	}

	// 찜하기 수 증가
	@Override
	public int addWish(String u_idx, String facltNm) {
		UserVO user = campDAO.getUserInfoByUidx(u_idx);

		// 찜하기 중복 체크
		int check = campDAO.checkWish(u_idx, facltNm);

		if (check > 0) {
			// 찜하기 취소
			System.out.println("찜하기 취소:::" + check);

			campDAO.removeWish(u_idx, facltNm);
			return -1; // 취소 성공값으로 -1 보내기.
		} else {
			// 찜하기 추가
			System.out.println("찜하기 성공:::" + check);
			return campDAO.addWish(u_idx, user.getU_id(), user.getU_nickname(), facltNm); // 성공값으로 1 반환
		}
	}

	// 찜하기 수 가져오기
	@Override
	public int getWish(String facltNm) {
		return campDAO.getWishCount(facltNm);
	}

	// 후기, 별점 추가
	@Override
	public void addReview(String facltNm, String u_Idx, String comment, int rating) {
		UserVO user = campDAO.getUserInfoByUidx(u_Idx);
		campDAO.addReview(facltNm, u_Idx, user.getU_id(), user.getU_nickname(), comment, rating);
	}

	// 후기 삭제
	public void deleteReview(int id, String u_idx) {
		campDAO.deleteReview(id, u_idx);
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