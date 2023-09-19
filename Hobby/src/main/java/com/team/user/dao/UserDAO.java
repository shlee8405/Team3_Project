package com.team.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.user.vo.NaverVO;
import com.team.user.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	//전체 보기
	public List<UserVO> getAllUsers() {
		List<UserVO> list = sqlSessionTemplate.selectList("user.allList");
		return list;
	}
	// 사용자 추가
	public int getUserInsert(UserVO uvo) {
		return sqlSessionTemplate.insert("user.addUser", uvo);
	}
	// 사용자 추가
	public int getUserInsertKakao(UserVO uvo) {
		return sqlSessionTemplate.insert("user.addUserKakao", uvo);
	}
	
	 // 아이디로 인코딩 된 사용자 비밀번호 가져오기
	public String getUserPass(UserVO uvo) {
		return sqlSessionTemplate.selectOne("user.getPassWithId", uvo);
	}
	
	// 유저 아이디 존재하는지 확인
	public int getUserCount(String u_id) {
		return sqlSessionTemplate.selectOne("user.getCountWithUid", u_id);
	}
	
	// 유저 아이디로 uvo 가져오기
	public UserVO getUserVoWithId(String u_id) {
		return sqlSessionTemplate.selectOne("user.getUserVoWithId", u_id);
	}
	
	
	// 이메일 중복 확인
    public int idCheck(String u_email) {
    	System.out.println("dao string" + u_email);
    	int count = sqlSessionTemplate.selectOne("user.emailcount", u_email);
    	System.out.println("daocount" + count);
        return count;
    }
    // 아이디 중복 확인
    public int idCheck2(String u_id) {
    	int count = sqlSessionTemplate.selectOne("user.idcount", u_id);
    	return count;
    }

    // 이메일로 아이디 찾기
    public String findIdByEmail(String u_email) {
        return sqlSessionTemplate.selectOne("user.findIdByEmail", u_email);
    }
    
    public UserVO findUserByEmail(String u_email) {
        return sqlSessionTemplate.selectOne("user.findUserByEmail", u_email);
    }

    // Update user's password
    public int updateUserPassword(String u_id, String encryptedPassword) {
        Map<String, String> parameterMap = new HashMap<>();
        parameterMap.put("u_id", u_id);
        parameterMap.put("encryptedPassword", encryptedPassword);
        return sqlSessionTemplate.update("user.updateUserPassword", parameterMap);
    }
    
    // 관리자 계정 추가
    public int getAdminInsert(UserVO uvo) {
    	return sqlSessionTemplate.insert("user.insertAdmin",uvo);
    }
    
    // 유저 밴
    public int getBanUser(String idx) {
    	return sqlSessionTemplate.update("user.banUser",idx);
    }
    
    // 유저 언밴
    public int getUnbanUser(String idx) {
    	return sqlSessionTemplate.update("user.unbanUser",idx);
    }
    
    // 유저 삭제
    public int getDeleteUser(String u_idx) {
    	return sqlSessionTemplate.update("user.updateUserStatusToZero", u_idx);
    }
    
    // 유저 수정
    public int getUpdateUserAdmin(UserVO uvo) {
    	return sqlSessionTemplate.update("user.updateUserInfoAdmin", uvo);
    }
    
    // 
    
    
    public List<UserVO> getUsers(String u_idx) {
    	return sqlSessionTemplate.selectList("user.one",u_idx);
    }
    
    public int pass(String u_idx,String encodedNewPassword) {
    	 Map<String, String> map = new HashMap<>();
    	 map.put("u_idx", u_idx);
    	 map.put("u_pw", encodedNewPassword);
         return sqlSessionTemplate.update("user.pass", map);
    }
    
    //닉네임으로 유저들 검색
    public List<UserVO> getUsersWithNickname(String u_nickname){
    	List<UserVO> list = sqlSessionTemplate.selectList("user.allListByNickname", u_nickname);
    	return list;
    }
    //생년으로 유저들 검색    
    public List<UserVO> getUsersWithBirthday(String u_birthday){
    	List<UserVO> list = sqlSessionTemplate.selectList("user.allListByBirthday", u_birthday);
    	return list;
    }
    //전화번호 4자리로 유저들 검색
    public List<UserVO> getUsersWithPhone(String u_phone){
    	List<UserVO> list = sqlSessionTemplate.selectList("user.allListByPhone", u_phone);
    	return list;
    }
 // 이메일로 비번 찾기
    public String findPwByEmail(String u_email2) {
        return sqlSessionTemplate.selectOne("user.findPwByEmail", u_email2);
    }
    
    
    
    // 네이버 로그인
    public int naver(NaverVO naverVO) {
    	return sqlSessionTemplate.insert("user.naver",naverVO);
    }
    
    public String getNaverUserByEmail(String id) {
    	return sqlSessionTemplate.selectOne("user.naverid", id);
    }

}
