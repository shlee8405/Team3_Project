package com.team.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.user.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	//유저 추가
	public int addUser(UserVO vo) {
		return sqlSessionTemplate.insert("user.addUser", vo);
	};
	
	//전체 보기
	public List<UserVO> getAllUsers() {
		List<UserVO> list = sqlSessionTemplate.selectList("user.allList");
		return list;
	}
}
