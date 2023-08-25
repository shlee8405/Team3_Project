package com.team.camp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.camp.dao.CampDAO;

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

}
