package com.team.group.service;

import java.util.List;

import com.team.group.vo.GroupCmtVO;
import com.team.group.vo.GroupVO;
import com.team.user.vo.UserVO;

public interface GroupService {

	public List<GroupVO> getAllGroups();
	
	// 전체 게시물의 수
	public int getTotalCount() ;
	// 페이징처리를 위한 리스트
	public List<GroupVO> getAllGroups(int offset, int limit);
	// 글쓰기
	public int getGroupWriteOk(GroupVO gvo);
	// 상세보기
	public GroupVO getGroupOnelist(String g_idx);
	// 삭제하기
	public int getGroupDelete(GroupVO g_idx);
	// 수정하기
	public int getGroupUpdate(GroupVO gvo);
	// 댓글 가져오기
	public List<GroupCmtVO> getCommList(String g_idx);
	// 댓글 사용자 정보 가져오는 메서드 추가
	public UserVO getUserCmtInfo(String u_idx); 
	// 댓글 삽입
	public int getCommInsert(GroupCmtVO gcvo);
}
