package com.team.counter.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.counter.vo.VCVO;

@Repository
public class ViewcounterDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int viewCount() {
		int res = sqlSessionTemplate.insert("counter.viewCount");
		return res;
	}
	
	public VCVO getViewCount() {
		return sqlSessionTemplate.selectOne("counter.getViewCount");
	}
}
