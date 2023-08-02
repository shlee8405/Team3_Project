package com.ict.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.model.dao.MembersDAO;
import com.ict.model.vo.MembersVO;

@Service
public class MembersServiceImpl implements MembersService{
	// DAO 호출
	@Autowired
	private MembersDAO memberDAO;
	
	public MembersDAO getMembersDAO() {
		return memberDAO;
	}

	public void setMemberDAO(MembersDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public List<MembersVO> membersList() {
		List<MembersVO> list = getMembersDAO().membersList();
		return list;
	}
	@Override
	public int membersAdd(MembersVO mvo) {
		int result = memberDAO.memberAdd(mvo);
		return 0;
	}
}
