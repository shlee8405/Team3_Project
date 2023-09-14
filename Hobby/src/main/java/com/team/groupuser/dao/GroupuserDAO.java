package com.team.groupuser.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.groupuser.vo.GroupuserVO;

@Repository
public class GroupuserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<GroupuserVO> getAllList() {
		return sqlSessionTemplate.selectList("groupuser.allList");
	}
}
