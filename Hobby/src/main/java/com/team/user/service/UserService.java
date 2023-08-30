package com.team.user.service;

import java.util.List;

import com.team.user.vo.UserVO;

public interface UserService {

	
	
	//전체보기
	public List<UserVO> getAllUsers();
	
	// 삽입
	int getUserInsert(UserVO uvo);
	
	// 유저 비밀번호 추출
	String getUserPass(UserVO uvo);
	
	// 유저 아이디 DB에 존재하는지 확인
	int getUserCount(String u_id);
	
	// 유저 아이디로 VO 가져오기
	UserVO getUserVoWithId(String u_id);
	
	// 이메일 중복 확인
	boolean isEmailDuplicate(String email);
	// 아이디 로그인 확인
	boolean isIdDuplicate(String id);
	 // 이메일로 아이디 찾기
	 String findIdByEmail(String email);
	 	// 비밀번호 리셋을 위한 이메일로 유저 찾기
	    UserVO findUserByEmail(String email);

	    // 비밀번호 리셋을 위한 새로운 비밀번호 생성
	    String generateNewPassword();

	    // 유저 비밀번호 업데이트
	    boolean updateUserPassword(String u_id, String newPassword);

	 
}
