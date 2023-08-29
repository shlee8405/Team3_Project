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
	public String getUserPass(UserVO uvo) {
		return userDAO.getUserPass(uvo);
	}


	@Override
	public int getUserCount(String u_id) {
		return userDAO.getUserCount(u_id);
	}

	@Override
	public UserVO getUserVoWithId(String u_id) {
		return userDAO.getUserVoWithId(u_id);
	}
	
	@Override
    public boolean isEmailDuplicate(String email) {
        int count = userDAO.idCheck(email);
        System.out.println("count" + count);
        return count > 0;
    }



	@Override
	public boolean isIdDuplicate(String id) {
		int count = userDAO.idCheck2(id);
        System.out.println("count" + count);
        return count > 0;
	}
	
	
	
	
	
	@Override
	public List<UserVO> getUsers(String u_idx) {
		return userDAO.getUsers(u_idx);
	}
	
	
}
