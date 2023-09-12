package com.team.faq.service;

import java.util.List;

import com.team.faq.vo.FaqVO;

public interface FaqService {
	
	// 문의 전체보기
	public List<FaqVO> getList();
	
	// 질문으로 FAQ 검색
	public List<FaqVO> getListByContent(String f_content);

	// 답변으로 FAQ 검색
	public List<FaqVO> getListByResponse(String f_response);
	
	// FAQ 업데이트
	public int getUpdateFaqAdmin(FaqVO fvo);
	
	// faq 숨기기
	public int getHideFaq(String f_idx);
	
	// faq 보이기
	public int getUnhideFaq(String f_idx); 
	
	// faq delete
	public int getDeleteFaq(String f_idx);
	
	// faq insert
	public int getInsertFaq(FaqVO fvo);
	
}
