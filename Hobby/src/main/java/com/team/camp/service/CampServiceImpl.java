package com.team.camp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.camp.dao.CampDAO;

@Service
public class CampServiceImpl implements CampService{

	@Autowired
	private CampDAO campDAO;

	// 좋아요 수 증가
	@Override
	public int increaseLikeCount(String facltNm) {
		System.out.println("좋아요 serviceImpl ::: " + facltNm);
		Integer result = campDAO.increaseLikeCount(facltNm);
		// Integer로 변경(NullPointerException 방지)
		
		if(result == null) {
			return 0;
		}
		return result;
	}

	// 업데이트 된 좋아요 수 가져오기
	@Override
	public int getLikes(String facltNm) {
		return campDAO.getLikes(facltNm);
	}
}
