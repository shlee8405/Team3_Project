package com.team.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.qna.dao.QnaDAO;
import com.team.qna.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public List<QnaVO> getAllQna() {
		return qnaDAO.getAllQna();
	}
	
	@Override
	public List<QnaVO> getAllQnaOrderByResponse() {
		return qnaDAO.getAllQnaOrderByResponse();
	}
	
	@Override
	public int getInsert(QnaVO qvo,String u_idx) {
		return qnaDAO.getInsert(qvo,u_idx);
	}
	
	@Override
	public QnaVO Detail(String q_idx) {
		return qnaDAO.Detail(q_idx);
	}
	
	@Override
	public int DeleteQ(String q_idx) {
		return qnaDAO.DeleteQ(q_idx);
	}
	
	@Override
	public int UpdateQna(QnaVO qvo) {
		return qnaDAO.UpdateQna(qvo);
	}
	
	@Override
	public List<QnaVO> getQnAOne(String q_idx) {
		return qnaDAO.getQnAOne(q_idx);
	}
}
