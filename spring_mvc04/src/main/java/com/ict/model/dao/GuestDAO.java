package com.ict.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.model.vo.GuestBookVO;

@Repository
public class GuestDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	// GuestBook 리스트
	public List<GuestBookVO> guestList() {
		List<GuestBookVO> list = sqlSessionTemplate.selectList("guestbook.list");
		return list;
		
	}
	// GuestBook 삽입
	public int getGuestBookInsert(GuestBookVO gvo) {
		return sqlSessionTemplate.insert("guestbook.insert", gvo);
	}
}
