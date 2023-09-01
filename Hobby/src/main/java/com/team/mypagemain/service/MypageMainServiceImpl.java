package com.team.mypagemain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.mypagemain.dao.MypageMainDAO;
import com.team.mypagemain.vo.MypageMainVO;

@Service
public class MypageMainServiceImpl implements MypageMainService{

	@Autowired
	private MypageMainDAO mypagemainDAO;
	@Override
	public List<MypageMainVO> getMypageMain(String u_id) {
		// TODO Auto-generated method stub
		return mypagemainDAO.getMypageMain(u_id);
	}
	

}
