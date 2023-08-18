package com.team.myinfoupdate.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.myinfoupdate.vo.MyinfoUpdateVO;
import com.team.mypagemain.vo.MypageMainVO;

@Repository
public class MyinfoUpdateDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	public List<MyinfoUpdateVO> getMyinfoUpdate(){
		return sessionTemplate.selectList("mypage.myinfoupdate");
	}
}
