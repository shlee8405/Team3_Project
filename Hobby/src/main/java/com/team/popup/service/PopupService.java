package com.team.popup.service;

import java.util.List;

import com.team.popup.vo.PopupVO;

public interface PopupService {
	
	int Insert_Popup(PopupVO vo);
	
	List<PopupVO> SelectPopup();
}
