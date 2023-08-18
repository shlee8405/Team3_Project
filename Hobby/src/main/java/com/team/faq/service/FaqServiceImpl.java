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
	
	
}
