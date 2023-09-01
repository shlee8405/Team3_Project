package com.team.myreview.service;

import java.util.List;

import com.team.myreview.vo.MyReviewVO;
import com.team.user.vo.UserVO;

public interface MyReviewService {
	public List<MyReviewVO> getMyReview(String u_id);
	
}

