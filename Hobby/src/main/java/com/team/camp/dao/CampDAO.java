package com.team.camp.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 좋아요 수 증가 
	public int increaseLikeCount(String facltNm) {
		System.out.println("좋아요 DAO ::: " + facltNm);
		return sqlSessionTemplate.insert("camp.increaseLikeCount", facltNm);
	}
	
	// 좋아요 수 조회 메서드
	public Integer getLikes(String facltNm) {
		//DB에서 facltNm에 해당하는 좋아요 수 가져오기
		Integer result = sqlSessionTemplate.selectOne("camp.getLikeCount", facltNm);
		if(result == null) {
			return 0;
		}
		return result;
	}
}
