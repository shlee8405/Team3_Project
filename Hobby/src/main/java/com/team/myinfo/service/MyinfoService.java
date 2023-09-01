package com.team.myinfo.service;

import java.util.List;

import com.team.myinfo.vo.MyinfoVO;

public interface MyinfoService {
	public List<MyinfoVO> getMyinfo(String l_idx);
	// 사용자 정보 업데이트를 위한 메서드 추가
	int updateMyinfo(MyinfoVO vo);
}
