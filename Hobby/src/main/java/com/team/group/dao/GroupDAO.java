package com.team.group.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.group.vo.GroupCmtVO;
import com.team.group.vo.GroupVO;
import com.team.user.vo.UserVO;

@Repository
public class GroupDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount() {
		return sqlSessionTemplate.selectOne("group.count");
	}
	
	public List<GroupVO> getAllGroups(){
		return sqlSessionTemplate.selectList("group.allList");
	}
	
	// group select * no paging
	public List<GroupVO> getAllGroupsAdmin() {
		return sqlSessionTemplate.selectList("group.allListNoPaging");
	}
	
	public List<GroupVO> getAllGroups(int offset, int limit) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("limit", limit);
		map.put("offset", offset);
		return sqlSessionTemplate.selectList("group.allList", map);
	}
	
	public int getGroupWriteOk(GroupVO gvo) {
		return sqlSessionTemplate.insert("group.insert", gvo);
	}
	
	public int getGroupAdminWrite(GroupVO gvo) {
		return sqlSessionTemplate.insert("group.insertAsAdmin", gvo);
	}
	
	public GroupVO getGroupOnelist(String g_idx) {
		return sqlSessionTemplate.selectOne("group.onelist", g_idx);
	}
	
	public int checkUserParticipation(String g_idx, String u_idx) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("g_idx", g_idx);
	    map.put("u_idx", u_idx);
	    return sqlSessionTemplate.selectOne("group.checkUserParticipation", map);
	}

	public void joinGroup(String g_idx, String u_idx) {
	    Map<String, String> map = new HashMap<>();
	    map.put("g_idx", g_idx);
	    map.put("u_idx", u_idx);
	    sqlSessionTemplate.insert("group.joinGroup", map);
	}

	public void cancelParticipation(String g_idx, String u_idx) {
	    Map<String, String> map = new HashMap<>();
	    map.put("g_idx", g_idx);
	    map.put("u_idx", u_idx);
	    sqlSessionTemplate.delete("group.cancelParticipation", map);
	}

	
	public int getGroupDelete(GroupVO gvo) {
		return sqlSessionTemplate.update("group.delete", gvo);
	}
	
	public int getGroupRevive(GroupVO gvo) {
		return sqlSessionTemplate.update("group.revive", gvo);
	}
	
	public int getGroupUpdate(GroupVO gvo) {
		return sqlSessionTemplate.update("group.update", gvo);
	}
	
	public List<GroupCmtVO> getCommList(String g_idx) {
		return sqlSessionTemplate.selectList("group.cmtList",g_idx);
	}
	// 댓글아이디 출력 아직 적용 확인불가..
	public UserVO getUserCmtInfo(String u_idx) {
        return sqlSessionTemplate.selectOne("user.getUserCmtInfo", u_idx);
    }
	
	public int getCommInsert(GroupCmtVO gcvo) {
		return sqlSessionTemplate.insert("group.cmtInsert", gcvo);
	}
	
	public int commentDel(GroupCmtVO gcvo) {
		return sqlSessionTemplate.update("group.cmtDel", gcvo);
	}
	public List<GroupVO> searchGroups(GroupVO gvo) {
        return sqlSessionTemplate.selectList("group.searchGroups", gvo);
	}
	
	
	
	
	public int insertMember(String g_idx, String u_idx) {
	    Map<String, String> map = new HashMap<>();
	    map.put("g_idx", g_idx);
	    map.put("u_idx", u_idx);
	    return sqlSessionTemplate.insert("group.insertMember", map);
	}

}
