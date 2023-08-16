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
	public int getInsert(QnaVO qvo) {
		return qnaDAO.getInsert(qvo);
	}
}
