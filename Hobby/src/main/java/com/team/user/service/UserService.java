package com.team.user.service;

import java.util.List;

import com.team.user.vo.UserVO;

public interface UserService {

	//회원가입
	public int addUser(UserVO uvo);
	
	//전체보기
	public List<UserVO> getAllUsers();
}
