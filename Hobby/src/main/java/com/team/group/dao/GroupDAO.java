package com.team.group.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.group.vo.GroupVO;

@Repository
public class GroupDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<GroupVO> getAllGroups(){
		return sqlSessionTemplate.selectList("group.allList");
	}
}
