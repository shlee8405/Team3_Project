package com.team.group.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.group.dao.GroupDAO;
import com.team.group.vo.GroupCmtVO;
import com.team.group.vo.GroupVO;
import com.team.report.vo.ReportVO;
import com.team.user.vo.UserVO;

@Service
public class GroupServiceImpl implements GroupService {
	@Autowired 
	private GroupDAO groupDAO;
	
	@Override
	public int getTotalCount() {
		return groupDAO.getTotalCount();
	}

	@Override
	public List<GroupVO> getAllGroups() {
		return groupDAO.getAllGroups();
	}

	@Override
	public List<GroupVO> getAllGroupsNoPaging() {
		return groupDAO.getAllGroupsAdmin();
	}
	
	@Override
	public List<GroupVO> getAllGroups(int offset, int limit) {
		return groupDAO.getAllGroups(offset, limit);
	}
	
	@Override
	public int getGroupWriteOk(GroupVO gvo) {
		return groupDAO.getGroupWriteOk(gvo);
	}
	
	@Override
	public int getGroupAdminWrite(GroupVO gvo) {
		return groupDAO.getGroupAdminWrite(gvo);
	}

	@Override
	public GroupVO getGroupOnelist(String g_idx) {
		return groupDAO.getGroupOnelist(g_idx);
	}

	// 참여 중복 체크
	@Override
	public int checkUserParticipation(String g_idx, String u_idx) {
	    return groupDAO.checkUserParticipation(g_idx, u_idx);
	}

	// 그룹 참여 추가
	@Override
	public int addParticipation(String g_idx, String u_idx) {
	    return groupDAO.addParticipation(g_idx, u_idx);
	}

	// 그룹 참여 취소
	@Override
	public int removeParticipation(String g_idx, String u_idx) {
	    return groupDAO.removeParticipation(g_idx, u_idx);
	}
	
	@Override
	public int getGroupDelete(GroupVO gvo) {
		return groupDAO.getGroupDelete(gvo);
	}
	
	@Override
	public int getGroupRevive(GroupVO gvo) {
		return groupDAO.getGroupRevive(gvo);
	}

	@Override
	public int getGroupUpdate(GroupVO gvo) {
		return groupDAO.getGroupUpdate(gvo);
	}

	@Override
	public List<GroupCmtVO> getCommList(String g_idx) {
		return groupDAO.getCommList(g_idx);
	}
	// 댓글아이디 출력 아직 적용 확인불가..
	@Override
	public UserVO getUserCmtInfo(String u_idx) {
	    return groupDAO.getUserCmtInfo(u_idx);
	}

	@Override
	public int getCommInsert(GroupCmtVO gcvo) {
		return groupDAO.getCommInsert(gcvo);
	}

	@Override
	public int commentDel(GroupCmtVO gcvo) {
		return groupDAO.commentDel(gcvo);
	}

	@Override
	public List<GroupVO> searchGroups(GroupVO gvo) {
		return groupDAO.searchGroups(gvo);
	}
	
	/*	*/	
	@Override
	public List<GroupVO> getListByTitle(String title) {
		return groupDAO.getListByTitle(title);
	}
	
	@Override
	public List<GroupVO> getListByNickname(String nickname) {
		List<UserVO> userlist = groupDAO.getUsersWithNickname(nickname);
		List<GroupVO> list = new ArrayList<GroupVO>();
		for (UserVO uvo : userlist) {
			list.addAll(groupDAO.getListByUidx(uvo.getU_idx()));
		}
		return list;
	}
	
	@Override
	public List<GroupVO> getListByDate(String date) {
		return groupDAO.getListByDate(date);
	}
	
	@Override
	public List<GroupVO> getListByLocation(String location) {
		return groupDAO.getListByLocation(location);
	}
	
	@Override
	public int filterOldGroups() {
		return groupDAO.filterOldGroups();
	}
	
}
