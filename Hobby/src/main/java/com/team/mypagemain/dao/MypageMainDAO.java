package com.team.mypagemain.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.mypagemain.vo.MypageMainVO;

@Repository
public class MypageMainDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	public List<MypageMainVO> getMypageMain(String u_id){
		return sessionTemplate.selectList("mypage.mypagemain", u_id);
	}
}
