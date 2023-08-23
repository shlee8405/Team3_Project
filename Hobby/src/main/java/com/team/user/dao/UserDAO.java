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
	
	
	
	//전체 보기
	public List<UserVO> getAllUsers() {
		List<UserVO> list = sqlSessionTemplate.selectList("user.allList");
		return list;
	}
	public int getUserInsert(UserVO uvo) {
		return sqlSessionTemplate.insert("user.addUser", uvo);
	}
	public UserVO getUserLogin(String u_id) {
		return sqlSessionTemplate.selectOne("user.selectId, u_id");
	}
	
}
