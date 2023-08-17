package com.team.myinfo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.myinfo.vo.MyinfoVO;
@Repository
public class MyinfoDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public List<MyinfoVO> getMyinfo() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("mypage.myinfo");
	}

}
