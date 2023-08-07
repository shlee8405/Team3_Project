package com.team.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.user.dao.UserDAO;
import com.team.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int addUser(UserVO vo) {
		return userDAO.addUser(vo);
	}

	@Override
	public List<UserVO> getAllUsers() {
		return userDAO.getAllUsers();
	}
	
}
