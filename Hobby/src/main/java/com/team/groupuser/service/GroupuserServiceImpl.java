package com.team.groupuser.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.groupuser.dao.GroupuserDAO;
import com.team.groupuser.vo.GroupuserVO;


@Service
public class GroupuserServiceImpl implements GroupuserService {
	
		@Autowired
		private GroupuserDAO groupuserDAO;
		
		@Override
		public List<GroupuserVO> getAllList() {
			return groupuserDAO.getAllList();
		}
		
		
}
