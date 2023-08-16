package com.team.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.faq.vo.FaqVO;
import com.team.qna.vo.QnaVO;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<FaqVO> getAllfaq() {
		return sqlSessionTemplate.selectList("faq.allList");
	}
}
