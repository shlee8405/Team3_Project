package com.team.qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.qna.vo.QnaVO;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<QnaVO> getAllQna() {
		return sqlSessionTemplate.selectList("qna.allList");
	}
	
	public int getInsert(QnaVO qvo, String u_idx) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("qvo", qvo);
		map.put("u_idx", u_idx);
		
		return sqlSessionTemplate.insert("qna.insert",map);
	}
	
	public QnaVO Detail(String q_idx) {
		return sqlSessionTemplate.selectOne("qna.detail",q_idx);
	}
	
	public int DeleteQ(String q_idx) {
		return sqlSessionTemplate.update("qna.delete",q_idx);
	}
	
	public int UpdateQna(QnaVO qvo) {
		return sqlSessionTemplate.update("qna.update",qvo);
	}
	
	public List<QnaVO> getQnAOne(String q_idx) {
		return sqlSessionTemplate.selectList("qna.QnAOne",q_idx);
	}
}
