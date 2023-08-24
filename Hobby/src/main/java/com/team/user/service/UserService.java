package com.team.user.service;

import java.util.List;

import com.team.user.vo.UserVO;

public interface UserService {

	
	
	//전체보기
	public List<UserVO> getAllUsers();
	
	// 삽입
	int getUserInsert(UserVO uvo);
	
	UserVO getUserLogin(String u_id);
	// 이메일 중복 확인
	boolean isEmailDuplicate(String email);
	// 아이디 로그인 확인
	boolean isIdDuplicate(String id);
}
