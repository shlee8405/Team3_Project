package com.team.camp.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 좋아요 추가
	public int addLike(String u_id, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("facltNm", facltNm);
		return sqlSessionTemplate.insert("camp.addLike", params);
	}

	// 좋아요 중복 체크
	public int checkLike(String u_id, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("facltNm", facltNm);
		Integer result = sqlSessionTemplate.selectOne("camp.checkLike", params);
		return result == null ? 0 : result;
	}

	// 좋아요 취소
	public int removeLike(String u_id, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", u_id);
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
	public int addWish(String u_id, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("facltNm", facltNm);
		return sqlSessionTemplate.insert("camp.addWish", params);
	}

	// 찜하기 중복 체크
	public int checkWish(String u_id, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("facltNm", facltNm);
		Integer result = sqlSessionTemplate.selectOne("camp.checkWish", params);
		return result == null ? 0 : result;
	}

	// 찜하기 취소
	public int removeWish(String u_id, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", u_id);
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
}