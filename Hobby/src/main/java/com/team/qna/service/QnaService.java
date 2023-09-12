package com.team.qna.service;

import java.util.List;

import com.team.qna.vo.QnaVO;

public interface QnaService {
	
	// 문의 전체보기
	public List<QnaVO> getAllQna();
	
	// 문의 전체보기. 답변 없는것들 먼저 보임
	List<QnaVO> getAllQnaOrderByResponse();
	
	// 1대1 문의 넣기
	int getInsert(QnaVO qvo,String u_idx);
	
	// 상세 보기
	QnaVO Detail(String q_idx);
	
	// 삭제
	int DeleteQ(String q_idx);
	
	// 수정
	int UpdateQna(QnaVO qvo);
	
	// 로그인 문의 가져오기
	List<QnaVO> getQnAOne(String q_idx);
}
