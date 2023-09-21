package com.team.counter.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.counter.vo.LCVO;

@Repository
public class LogincounterDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int loginCount() {
		int res = sqlSessionTemplate.insert("counter.loginCount");
		return res;
	}
	
	public LCVO getLoginCount() {
		return sqlSessionTemplate.selectOne("counter.getLoginCount");
	}
}
