package com.team.camp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.camp.vo.ReviewVO;
import com.team.user.vo.UserVO;

@Repository
public class CampDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// u_idx로 USERS테이블에서 u_id, u_nickname 가져옴.
	public UserVO getUserInfoByUidx(String u_idx) {
		return sqlSessionTemplate.selectOne("camp.getUserInfoByUidx", u_idx);
	}

	// 좋아요 추가
	public int addLike(String u_idx, String u_id, String u_nickname, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_idx", u_idx);
		params.put("u_id", u_id);
		params.put("u_nickname", u_nickname);
		params.put("facltNm", facltNm);
		return sqlSessionTemplate.insert("camp.addLike", params);
	}

	// 좋아요 중복 체크
	public int checkLike(String u_idx, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_idx", u_idx);
		params.put("facltNm", facltNm);
		Integer result = sqlSessionTemplate.selectOne("camp.checkLike", params);
		return result == null ? 0 : result;
	}

	// 좋아요 취소
	public int removeLike(String u_idx, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_idx", u_idx);
		params.put("facltNm", facltNm);
		return sqlSessionTemplate.delete("camp.removeLike", params);
	}

	// 좋아요 수 조회 메서드
	public Integer getLikeCount(String facltNm) {
		// DB에서 facltNm에 해당하는 좋아요 수 가져오기
		Integer result = sqlSessionTemplate.selectOne("camp.getLikeCount", facltNm);
		if (result == null) {
			return 0;
		}
		return result;
	}

	// 찜하기 추가
	public int addWish(String u_idx, String u_id, String u_nickname, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_idx", u_idx);
		params.put("u_id", u_id);
		params.put("u_nickname", u_nickname);
		params.put("facltNm", facltNm);
		return sqlSessionTemplate.insert("camp.addWish", params);
	}

	// 찜하기 중복 체크
	public int checkWish(String u_idx, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_idx", u_idx);
		params.put("facltNm", facltNm);
		Integer result = sqlSessionTemplate.selectOne("camp.checkWish", params);
		return result == null ? 0 : result;
	}

	// 찜하기 취소
	public int removeWish(String u_idx, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_idx", u_idx);
		params.put("facltNm", facltNm);
		return sqlSessionTemplate.delete("camp.removeWish", params);
	}

	// 찜하기 수 조회
	public Integer getWishCount(String facltNm) {
		// DB에서 facltNm에 해당하는 찜하기 수 가져오기
		Integer result = sqlSessionTemplate.selectOne("camp.getWishCount", facltNm);
		if (result == null) {
			return 0;
		}
		return result;
	}

	// 후기와 별점 추가
	public void addReview(String facltNm, String u_idx, String u_id, String u_nickname, String comment, int rating) {
		Map<String, Object> params = new HashMap<>();
		params.put("facltNm", facltNm);
		params.put("u_idx", u_idx);
		params.put("u_id", u_id);
		params.put("u_nickname", u_nickname);
		params.put("comment", comment);
		params.put("rating", rating);
		sqlSessionTemplate.insert("camp.addReview", params);
	}

	// 해당 캠핑장 리뷰랑 별점 가져오기
	public List<ReviewVO> getReviews(String facltNm) {
		System.out.println("getReviews");
		return sqlSessionTemplate.selectList("camp.getReviews", facltNm);
	}

	// 해당 캠핑장의 평균 별점 가져오기
	public Double getAverageRating(String facltNm) {
		Double result = sqlSessionTemplate.selectOne("camp.getAverageRating", facltNm);
		if (result == null) { // 해당 캠핑장의 리뷰가 아직 없을 때
			return 0.0;
		}
		return result;
	}

	// 후기삭제
	public int deleteReview(int id, String u_idx) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("u_idx", u_idx);
		return sqlSessionTemplate.delete("camp.deleteReview", params);
	}
}