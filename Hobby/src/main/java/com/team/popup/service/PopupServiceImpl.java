package com.team.popup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.popup.dao.PopupDAO;
import com.team.popup.vo.PopupVO;
import com.team.qna.dao.QnaDAO;
import com.team.qna.vo.QnaVO;

@Service
public class PopupServiceImpl implements PopupService {
	@Autowired
	private PopupDAO popupDAO;
	
	@Override
	public int Insert_Popup(PopupVO vo) {
		return popupDAO.Insert_Popup(vo);
	}
	
	@Override
	public List<PopupVO> SelectPopup() {
		return popupDAO.SelectPopup();
	}
}
