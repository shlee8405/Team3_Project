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
}
