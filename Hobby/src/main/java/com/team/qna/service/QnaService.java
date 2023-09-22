package com.team.qna.service;

import java.util.List;

import com.team.qna.vo.QnaVO;

public interface QnaService {
	
	// 문의 전체보기
	public List<QnaVO> getAllQna();
	
	// 관리자용 확인 안한 문의 전체보기 q_status==2
	public List<QnaVO> getUncheckedQna();
	
	// 관리자용 QNA status==2 일때 status=1 로 바꾸기
	public int checkQna(); 
	
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
	
	// 문의 삭제 with qvo
	int getDeleteQnaWithQVO(QnaVO qvo);
	
	// 문의 수정 with qvo
	int getUpdateQnaWithQVO(QnaVO qvo);
	
	// 문의 list with 제목
	List<QnaVO> getListByTitle(String q_title);
	
	// 문의 list with 문의자
	List<QnaVO> getListByNickname(String u_idx);
}
