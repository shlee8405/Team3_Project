package com.team.faq.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.faq.vo.FaqVO;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<FaqVO> getAllfaq() {
		return sqlSessionTemplate.selectList("faq.allList");
	}
	// FAQ 질문으로 검색	
	public List<FaqVO> getListByContent(String f_content) {
		return sqlSessionTemplate.selectList("faq.allListByContent", f_content);
	}
	
	// FAQ 답변으로 검색
	public List<FaqVO> getListByResponse(String f_response) {
		return sqlSessionTemplate.selectList("faq.allListByResponse", f_response);
	}
	
	// FAQ 업데이트
	public int getUpdateFaqAdmin(FaqVO fvo) {
		return sqlSessionTemplate.update("faq.updateFaq", fvo);
	}
	
	// FAQ 숨기기
	public int getHideFaq(String f_idx) {
		return sqlSessionTemplate.update("faq.hideFaq" , f_idx);
	}
	
	// FAQ 보이기
	public int getUnhideFaq(String f_idx) {
		return sqlSessionTemplate.update("faq.unhideFaq" , f_idx);
	}
	
	// FAQ 삭제
	public int getDeleteFaq(String f_idx) {
		return sqlSessionTemplate.delete("faq.deleteFaq", f_idx);
	}
	
	// FAQ 추가
	public int getInsertFaq(FaqVO fvo) {
		return sqlSessionTemplate.insert("faq.insertFaq", fvo);
	}
	
}
