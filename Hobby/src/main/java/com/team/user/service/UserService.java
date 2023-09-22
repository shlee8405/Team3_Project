package com.team.user.service;

import java.util.List;

import com.team.user.vo.NaverVO;
import com.team.user.vo.UserVO;

public interface UserService {

	
	
	//전체보기
	public List<UserVO> getAllUsers();
	
	//오늘 생성한 유저 보기
	public int getUsersToday();
	
	// 삽입
	int getUserInsert(UserVO uvo);
	
	// 카카오삽입
	int getUserInsertKakao(UserVO uvo);
	
	
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

    // 관리자 계정 추가
    int getAdminInsert(UserVO uvo); 

	// 유저 밴
    int getBanUser(String idx);
    
    // 유저 언밴
    int getUnbanUser(String idx);
	
	// 유저 삭제
    int getDeleteUser(String u_idx);
	
    // 유저 수정
    int getUpdateUserAdmin(UserVO uvo);
	// 유져 1명의 정보 가져오기
	List<UserVO> getUsers(String u_idx);
	
	int pass(String u_idx, String encodedNewPassword);
	
	
	// 유저 상세 검색 (닉네임)
	List<UserVO> getUsersWithNickname(String u_nickname);
	
	List<UserVO> getUsersWithBirthday(String u_birthday);
	
	List<UserVO> getUsersWithPhone(String u_phone); 
	
	// 이메일로 비밀번호 찾기
	String findPwByEmail(String finalemail);
	
	int PassToID(String finalemail, String encodedNewPassword);
	
	
	// 네이버 로그인
	int naver(NaverVO naverVO);
	
	String getNaverUserByEmail(String id);
}
