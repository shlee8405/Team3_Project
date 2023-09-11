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
	
}
