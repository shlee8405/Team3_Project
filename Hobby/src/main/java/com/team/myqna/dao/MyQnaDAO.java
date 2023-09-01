package com.team.myqna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.myinfoupdate.vo.MyinfoUpdateVO;
import com.team.myqna.vo.MyQnaVO;

@Repository
public class MyQnaDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	public List<MyQnaVO> getMyQna(){
		return sessionTemplate.selectList("mypage.myqna");
	}
}
