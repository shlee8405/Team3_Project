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
	 // 아이디로 사용자 정보 가져오기 (로그인)
	public UserVO getUserLogin(String u_id) {
		return sqlSessionTemplate.selectOne("user.selectId, u_id");
	}
	
	// 아이디 중복 확인
    public int idCheck(String u_email) {
    	System.out.println("dao string" + u_email);
    	int count = sqlSessionTemplate.selectOne("user.emailcount", u_email);
    	System.out.println("daocount" + count);
        return count;
    }
}
