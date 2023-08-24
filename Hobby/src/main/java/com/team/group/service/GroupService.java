package com.team.group.service;

import java.util.List;

import com.team.group.vo.GroupVO;

public interface GroupService {

	public List<GroupVO> getAllGroups();
	
	public int getGroupWriteOk(GroupVO gvo);
	
	public GroupVO getGroupOnelist(String g_idx);
	
	public int getGroupDelete(GroupVO g_idx);
	
	public int getGroupUpdate(GroupVO gvo);
}
