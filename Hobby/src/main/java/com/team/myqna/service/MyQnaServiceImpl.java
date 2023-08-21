package com.team.myqna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.myqna.dao.MyQnaDAO;
import com.team.myqna.vo.MyQnaVO;

@Service
public class MyQnaServiceImpl implements MyQnaService{

	@Autowired
	private MyQnaDAO myQnaDAO;

	@Override
	public List<MyQnaVO> getMyQna() {
		// TODO Auto-generated method stub
		return myQnaDAO.getMyQna();
	}
	
}
