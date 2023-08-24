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
	public List<UserVO> getAllUsers() {
		return userDAO.getAllUsers();
	}



	@Override
	public int getUserInsert(UserVO uvo) {
		return userDAO.getUserInsert(uvo);
	}



	@Override
	public UserVO getUserLogin(String u_id) {
		return userDAO.getUserLogin(u_id);
	}



	@Override
    public boolean isEmailDuplicate(String email) {
        int count = userDAO.idCheck(email);
        System.out.println("count" + count);
        return count > 0;
    }
	
	
	
	
}
