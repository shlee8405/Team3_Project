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
	public int increaseLikeCount(String u_id, String facltNm) {
		System.out.println("좋아요 serviceImpl ::: " + facltNm);
		
		// 사용자가 이미 좋아요를 눌렀는지 확인
		int count = campDAO.checkLike(u_id, facltNm);
		
		// 만약 반환값이 0이상이면 이미 좋아요를 누른 것으로 판단하고 0을 반환
		if(count > 0) {
			return 0;
		}
		
		// 좋아요 수 증가
		Integer result = campDAO.increaseLikeCount(u_id, facltNm);
		// Integer로 변경(NullPointerException 방지)
		
		if(result != null && result > 0) {
			// 좋아요 수 증가에 성공했다면 (1을 반환했다면)
			return result;
		}else {
			// 문제가 발생한 경우(0이나 null 반환했다면)
			return 0;			
		}
	}

	// 좋아요 중복 검사
	@Override
	public int checkLike(String u_id, String facltNm) {
		return campDAO.checkLike(u_id, facltNm);
	}
	
	// 업데이트 된 좋아요 수 가져오기
	@Override
	public int getLikes(String facltNm) {
		return campDAO.getLikes(facltNm);
	}

}
