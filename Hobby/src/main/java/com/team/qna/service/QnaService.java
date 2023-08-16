package com.team.qna.service;

import java.util.List;

import com.team.qna.vo.QnaVO;

public interface QnaService {
	
	// 문의 전체보기
	public List<QnaVO> getAllQna();
	
	// 1대1 문의 넣기
	int getInsert(QnaVO qvo);
}
