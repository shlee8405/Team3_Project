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
	
	// 좋아요 수 증가 
	public int increaseLikeCount(String u_id, String facltNm) {
		System.out.println("좋아요 DAO ::: " + facltNm);
		
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("facltNm", facltNm);
		
		return sqlSessionTemplate.insert("camp.increaseLikeCount", params);
	}
	
	// 좋아요 중복 검사
	public int checkLike(String u_id, String facltNm) {
		Map<String, Object> params = new HashMap<>();
		params.put("u_id", u_id);
		params.put("facltNm", facltNm);
		
		Integer result = sqlSessionTemplate.selectOne("camp.checkLike", params);
		
		// 만약 조회 결과가 없다면 result == null : 중복 값 없음.
		// 만약 조회 결과가 있다면 0을 반환 : 중복값 있음.
		return result == null ? 0 : result;
	}
	
	// 좋아요 수 조회 메서드
	public Integer getLikes(String facltNm) {
		//DB에서 facltNm에 해당하는 좋아요 수 가져오기
		Integer result = sqlSessionTemplate.selectOne("camp.getLikeCount", facltNm);
        return result == null ? 0 : result;
	}
}
