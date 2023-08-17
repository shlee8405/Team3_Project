package com.team.myinfo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.myinfo.dao.MyinfoDAO;
import com.team.myinfo.vo.MyinfoVO;

@Service
public class MyinfoServiceImp implements MyinfoService{
	
	@Autowired
	private MyinfoDAO myinfoDAO;
	
	@Override
	public List<MyinfoVO> getMyinfo() {
		// TODO Auto-generated method stub
		return myinfoDAO.getMyinfo();
	}
	

}
