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
	
	public int getGroupWriteOk(GroupVO gvo) {
		return sqlSessionTemplate.insert("group.insert", gvo);
	}
	
	public GroupVO getGroupOnelist(String g_idx) {
		return sqlSessionTemplate.selectOne("group.onelist", g_idx);
	}
	
	public int getGroupDelete(GroupVO gvo) {
		return sqlSessionTemplate.update("group.delete", gvo);
	}
}
