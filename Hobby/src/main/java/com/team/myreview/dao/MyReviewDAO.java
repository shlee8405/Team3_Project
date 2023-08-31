package com.team.myreview.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.myreview.vo.MyReviewVO;

@Repository
public class MyReviewDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	public List<MyReviewVO> getMyReivew(){
		return sessionTemplate.selectList("mypage.myreview");
	}
	
}
