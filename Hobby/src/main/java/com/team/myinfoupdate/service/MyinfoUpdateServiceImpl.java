package com.team.myinfoupdate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.myinfoupdate.dao.MyinfoUpdateDAO;
import com.team.myinfoupdate.vo.MyinfoUpdateVO;
import com.team.mypagemain.dao.MypageMainDAO;
import com.team.mypagemain.vo.MypageMainVO;

@Service
public class MyinfoUpdateServiceImpl implements MyinfoUpdateService{

	@Autowired
	private MyinfoUpdateDAO myinfoUpdateDAO;
	
	@Override
	public List<MyinfoUpdateVO> getMyinfoUpdate() {
		// TODO Auto-generated method stub
		return myinfoUpdateDAO.getMyinfoUpdate();
	}
	

}
