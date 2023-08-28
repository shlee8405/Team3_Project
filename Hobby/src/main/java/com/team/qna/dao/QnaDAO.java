package com.team.qna.dao;

import java.util.List;

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
	
	public int getInsert(QnaVO qvo) {
		return sqlSessionTemplate.insert("qna.insert",qvo);
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
	
}
