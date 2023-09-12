package com.team.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.faq.dao.FaqDAO;
import com.team.faq.vo.FaqVO;
import com.team.qna.dao.QnaDAO;
import com.team.qna.vo.QnaVO;

@Service
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDAO faqDAO;

	@Override
	public List<FaqVO> getList() {
		return faqDAO.getAllfaq();
	}
	
	@Override
	public List<FaqVO> getListByContent(String f_content) {
		return faqDAO.getListByContent(f_content);
	}
	
	@Override
	public List<FaqVO> getListByResponse(String f_response) {
		return faqDAO.getListByResponse(f_response);
	}
	
	@Override
	public int getUpdateFaqAdmin(FaqVO fvo) {
		return faqDAO.getUpdateFaqAdmin(fvo);
	}
	
	@Override
	public int getHideFaq(String f_idx) {
		return faqDAO.getHideFaq(f_idx);
	}
	
	@Override
	public int getUnhideFaq(String f_idx) {
		return faqDAO.getUnhideFaq(f_idx);
	}
	
	@Override
	public int getDeleteFaq(String f_idx) {
		return faqDAO.getDeleteFaq(f_idx);
	}
	
	@Override
	public int getInsertFaq(FaqVO fvo) {
		return faqDAO.getInsertFaq(fvo);
	}
}

