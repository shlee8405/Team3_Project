package com.team.qna.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.qna.dao.QnaDAO;
import com.team.qna.vo.QnaVO;
import com.team.report.vo.ReportVO;
import com.team.user.vo.UserVO;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public List<QnaVO> getAllQna() {
		return qnaDAO.getAllQna();
	}
	
	@Override
	public List<QnaVO> getUncheckedQna() {
		return qnaDAO.getUncheckedQna();
	}
	
	@Override
	public int checkQna() {
		return qnaDAO.checkQna();
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
	
	@Override
	public int getDeleteQnaWithQVO(QnaVO qvo) {
		return qnaDAO.getDeleteQnaWithQVO(qvo);
	}
	
	@Override
	public int getUpdateQnaWithQVO(QnaVO qvo) {
		return qnaDAO.getUpdateQnaWithQVO(qvo);
	}
	
	@Override
	public List<QnaVO> getListByTitle(String q_title) {
		return qnaDAO.getListByTitle(q_title);
	}

	@Override
	public List<QnaVO> getListByNickname(String str) {
		List<UserVO> userlist = qnaDAO.getUsersWithNickname(str);
		List<QnaVO> list = new ArrayList<QnaVO>();
		for (UserVO uvo : userlist) {
			list.addAll(qnaDAO.getListByUidx(uvo.getU_idx()));
		}
		return list;
	}
}
