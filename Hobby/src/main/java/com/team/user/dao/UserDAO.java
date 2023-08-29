package com.team.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
    	System.out.println("dao string" + u_id);
    	int count = sqlSessionTemplate.selectOne("user.idcount", u_id);
    	System.out.println("daocount" + count);
    	return count;
    }
    
    
    
    
    
    public List<UserVO> getUsers(String u_idx) {
    	return sqlSessionTemplate.selectList("user.one",u_idx);
    }
    
}
