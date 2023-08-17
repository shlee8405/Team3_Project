package com.team.faq.service;

import java.util.List;

import com.team.faq.vo.FaqVO;

public interface FaqService {
	
	// 문의 전체보기
	public List<FaqVO> getList();
}
