package com.team.group.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.group.dao.GroupDAO;
import com.team.group.vo.GroupVO;

@Service
public class GroupServiceImpl implements GroupService {
	@Autowired 
	private GroupDAO groupDAO;
	
	@Override
	public List<GroupVO> getAllGroups() {
		return groupDAO.getAllGroups();
	}

}