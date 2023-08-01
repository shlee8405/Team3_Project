package com.ict.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.model.dao.GuestDAO;
import com.ict.model.vo.GuestBookVO;

@Service
public class GuestServiceImpl implements GuestService{
	// DAO에 가서 DB 결과를 받아오자
	@Autowired
	private GuestDAO guestDAO;

	public GuestDAO getGuestDAO() {
		return guestDAO;
	}

	public void setGuestDAO(GuestDAO guestDAO) {
		this.guestDAO = guestDAO;
	}
	
	@Override
	public List<GuestBookVO> guestList() {
		List<GuestBookVO> list = guestDAO.guestList();
		return list;
	}

	@Override
	public GuestBookVO getGuestBookOneList(String idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getGuestBookInsert(GuestBookVO gvo) {
		return guestDAO.getGuestBookInsert(gvo);
	}

	@Override
	public int getGuestBookUpdate(GuestBookVO gvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getGuestBookDelete(String idx) {
		// TODO Auto-generated method stub
		return 0;
	}
}
