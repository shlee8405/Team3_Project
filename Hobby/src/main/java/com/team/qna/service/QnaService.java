package com.team.qna.service;

import java.util.List;

import com.team.qna.vo.QnaVO;

public interface QnaService {
	
	// 문의 전체보기
	public List<QnaVO> getAllQna();
	
	// 1대1 문의 넣기
	int getInsert(QnaVO qvo);
	
	// 상세 보기
	QnaVO Detail(String q_idx);
	
	// 삭제
	int DeleteQ(String q_idx);
}
