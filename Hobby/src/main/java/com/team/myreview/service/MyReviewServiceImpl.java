package com.team.myreview.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.myreview.dao.MyReviewDAO;
import com.team.myreview.vo.MyReviewVO;

@Service
public class MyReviewServiceImpl implements MyReviewService{

	@Autowired
	private MyReviewDAO myReviewDAO;

	@Override
	public List<MyReviewVO> getMyReview() {
		// TODO Auto-generated method stub
		return myReviewDAO.getMyReivew();
	}
}
