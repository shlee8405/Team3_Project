package com.team.counter.dao;

import java.util.List;

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
	
	public List<LCVO> getLoginCount() {
		return sqlSessionTemplate.selectList("counter.getLoginCount");
	}
	
	public int todayLogin() {
		return sqlSessionTemplate.selectOne("counter.todayLogin");
	}
}
